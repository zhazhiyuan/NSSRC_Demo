function    [im, diff]                    =                          NSSRC_Deblocking_Main(Im_out, Par, p, Err_or)

             randn ('seed',0);
ori_im                      =                        Par.I; 

n_im                        =                        Im_out; 

[h1, w1]                    =                        size(ori_im); 


d_im                        =                        Im_out;  


v                           =                        Par.nSig;


cnt                         =                         1;


All_PSNR                    =                         zeros(1,Par.Iter);

GSR_NLS_Results             =                 cell (1,Par.Iter);   




for j                        =                1 : Par.Iter
    
       if (j ==1)
        d_im                 =                         n_im;
        
        nSig1                =                           v;
       end
     
      Par.nSig               =                         nSig1;
      
      
       d_im                  =                        NSSRC_Solver(d_im, Par, p);
       
       
        dif1                 =                         d_im-n_im;
        
    
        vd1                  =                          v^2-(mean(mean(dif1.^2)));
        
    
        nSig1                =                          sqrt(abs(vd1))* Par.lambda;
       
        
        d_im                 =                          (d_im*v^2*2*Par.AA+ n_im*nSig1^2)/(v^2*2*Par.AA + nSig1^2);
    
        d_im                 =                           BDCT_project_onto_QCS(d_im, Par.C_q, Par.QTable, Par.Qfactor, Par.blockSize);
    
        
        All_PSNR(j)        =                            csnr( d_im(1:h1,1:w1), ori_im, 0, 0 );
    
      fprintf( 'Preprocessing, Iter %d : PSNR = %2.2f\n', cnt,  csnr( d_im(1:h1,1:w1), ori_im, 0, 0 ));
    
         cnt   =  cnt + 1;       
         
           GSR_NLS_Results{j}      =                      d_im;
         
         if j>5
             
            diff      =  norm(abs(GSR_NLS_Results{j}) - abs(GSR_NLS_Results{j-1}),'fro')/norm(abs(GSR_NLS_Results{j-1}), 'fro');    
             
             if  GSR_NLS_Results{j}- GSR_NLS_Results{j-1} <0%diff < Err_or
                 
                 break;
             end
             
         end
       
      
    
    
end


        im               =                 d_im;

end

