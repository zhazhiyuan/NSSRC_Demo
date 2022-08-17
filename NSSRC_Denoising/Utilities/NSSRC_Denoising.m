
function [Denoising ,  iter]     =  NSSRC_Denoising( Opts, p, Err_or )

randn ('seed',0);

Nim                =   Opts.nim;

Ori_im             =   Opts.I;

b                  =   Opts.win;

[h, w, ch]         =   size(Nim);

N                  =   h-b+1;

M                  =   w-b+1;

r                  =   [1:N];

c                  =   [1:M]; 

%disp(sprintf('PSNR of the noisy image = %f \n', csnr(Nim, Ori_im, 0, 0) ));

Im_Out      =   Nim;

nsig        =   Opts.nSig;

m           =   Opts.nblk;

cnt         =   1;


AllPSNR     =  zeros(1,Opts.Iter );

Denoising  =   cell (1,Opts.Iter);

for iter = 1 : Opts.Iter    
    
            Im_Out               =   Im_Out +    Opts.gamma*(Nim - Im_Out);
        
            dif                  =   Im_Out-Nim;
        
            vd                   =      nsig^2-(mean(mean(dif.^2)));
 
            [blk_arr, wei_arr]             =         Block_matching( Im_Out, Opts);                
            
       if iter==1
            
            Opts.nSig             =         sqrt(abs(vd)); 
            
       else
            
             Opts.nSig            =         sqrt(abs(vd))* Opts.lamada  ;
            
       end 
            
   
       
      
        X                       =         Im2Patch( Im_Out, Opts );  
        
        Ys                      =         zeros( size(X) );    
        
        W                       =         zeros( size(X) );
        
        K                       =         size(blk_arr,2);
           
    
        
        for  i  =  1 : K  
            
            
           %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %Noise_Group_Operator...
             B                  =         X(:, blk_arr(:, i));  
             
             mB                 =         repmat(mean( B, 2 ), 1, size(B, 2));
             
             B                  =         B-mB;   
             
            Weight           =      repmat(wei_arr(:, i)',size(B, 1), 1);                
             
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            TMP                 =          NSSRC_Temp( double(B), double(Weight), Opts.c1, Opts.nSig, mB, p); %Core
           
       Ys(:, blk_arr(1:m,i))    =          Ys(:, blk_arr(1:m,i)) + TMP;
       
       W(:, blk_arr(1:m,i))     =          W(:, blk_arr(1:m,i)) + 1;
             
         end

        Im_Out   =  zeros(h,w);
        
        im_wei   =  zeros(h,w);
        
        k        =   0;
        
        for i  = 1:b
            for j  = 1:b
                k    =  k+1;
                Im_Out(r-1+i,c-1+j)  =  Im_Out(r-1+i,c-1+j) + reshape( Ys(k,:)', [N M]);
                im_wei(r-1+i,c-1+j)  =  im_wei(r-1+i,c-1+j) + reshape( W(k,:)',  [N M]);
            end
        end
        
        Im_Out  =  Im_Out./(im_wei+eps);
        
        Denoising{iter}  =   Im_Out;

        AllPSNR(iter)  = csnr( Im_Out, Opts.I, 0,0 );
              
        fprintf( 'Iteration %d :   PSNR = %f\n', cnt,  csnr( Im_Out, Opts.I, 0, 0) );
        
        cnt   =  cnt + 1;

   if iter>1
       dif      =  norm(abs(Denoising{iter}) - abs(Denoising{iter-1}),'fro')/norm(abs(Denoising{iter-1}), 'fro');
             
       if  AllPSNR(iter)- AllPSNR(iter-1) <0 %dif <Err_or
           break;
       end    
   end    
   
end
im      =      Denoising{iter};

disp(sprintf('PSNR of the Denoised image = %f \n', csnr(im, Ori_im, 0, 0) ));

return;




