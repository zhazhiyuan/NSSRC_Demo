
function  [im]     =     NSSRC_Solver( d_im,Par, p)

randn ('seed',0);

Nim            =   d_im;

b              =   Par.win;

[h, w, ch]     =   size(Nim);

N              =   h-b+1;

M              =   w-b+1;

r              =   [1:N];

c              =   [1:M]; 

Out_Put        =   Nim;

%gamma          =   Par.gamma;

nsig           =   Par.nSig;

m              =   Par.nblk;

%cnt            =   1;

for iter = 1 : 3%Par.Iter    
    
    %    Out_Put               =    Out_Put + gamma*(Nim - Out_Put);
        
       Out_Put               =    Out_Put + 0.1*(Nim - Out_Put);
       
         dif                  =    Out_Put-Nim;
        
         vd                   =    nsig^2-(mean(mean(dif.^2)));
     
   [blk_arr, wei_arr]         =    Block_matching( Out_Put, Par);          
        

       if iter==1               
            Par.nSig         =    sqrt(abs(vd)); 
       end

     
               X             =     Im2Patch( Out_Put, Par );  
               
               Ys            =     zeros( size(X) );   
               
               W             =     zeros( size(X) );
               
               K             =     size(blk_arr,2);
               
        %       NL_A          =     zeros (b*b, Par.nblk);
               
                 
        for  i  =  1 : K  
            %
            % Get Nonlocal Similar patches from noisy image...
            
               A             =         X(:, blk_arr(:, i));    
               
               mA            =         repmat(mean( A, 2 ), 1, size(A, 2));
             
               A             =         A-mA;                  
               
               
            Weight           =      repmat(wei_arr(:, i)',size(A, 1), 1);       
            
         TMP                 =          NSSRC_Temp( double(A), double(Weight), Par.c, Par.nSig, mA, p); %Core            

                  
 %             TMP            =      GSRC_NLM_CORE( double(A), double(NL_A), Par.c, Par.nSig, Par.eps);
             
            
            
            
       %        A             =      X(:, blk_arr(:, i));    
               
       %     Weight           =      repmat(wei_arr(:, i)',size(A, 1), 1);       
               
        %  for j = 1:m
              
               % recursive algorithm
        %      wei            =      Weight(:,1:m-j+1);
              
        %      a              =      A(:,1:m-j+1);

        %     nla_app         =      sum(wei.*a, 2); % NLM_Means     
                         
          %   NL_A (:, j)     =      nla_app;
             
        %  end
               
            
       %     TMP              =    RRC_CORE( double(A), double(NL_A), Par.c, Par.nSig, Par.eps);
            
    
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%          
    Ys(:, blk_arr(1:m,i))    =   Ys(:, blk_arr(1:m,i)) + TMP;
    
    W(:, blk_arr(1:m,i))     =   W(:, blk_arr(1:m,i)) + 1;
    
        end

     Out_Put        =   zeros(h,w);       
     
     im_wei        =  zeros(h,w);     
     
      k            =   0;
      
     for i   =  1:b
         for j  = 1:b
                k    =  k+1;
                Out_Put(r-1+i,c-1+j)  =  Out_Put(r-1+i,c-1+j) + reshape( Ys(k,:)', [N M]);
                im_wei(r-1+i,c-1+j)  =  im_wei(r-1+i,c-1+j) + reshape( W(k,:)', [N M]);
          end
     end
     
      Out_Put            =        Out_Put./(im_wei+eps);

              
  %  fprintf( 'Iteration %d : nSig = %2.2f, PSNR = %f\n', cnt, Par.nSig, csnr( Out_Put, Par.I, 0, 0 ));
    
%    cnt   =  cnt + 1;
 
end


im    =  Out_Put;


end





