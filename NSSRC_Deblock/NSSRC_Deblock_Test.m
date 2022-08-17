function  [filename, JPEG_Quality,  lambda, c,JPEG_Inital,  PSNR_Final,FSIM_Final,SSIM_Final, diff, Time_s]     =  NSSRC_Deblock_Test (filename, JPEG_Quality,  lambda, c, p, QF, Err_or)
 
                randn ('seed',0);

                time0            =   clock;
                 
                fn               =     [filename, '.tif'];

                I                =     imread(fn);
              
         [~, ~, kk]        =     size (I);
     
                colorI           =     I;

              if kk==3
    
                     I           =      rgb2gray (I);
          
                     y_yuv       =      rgb2ycbcr(colorI);                     
                     
                x_2_yuv(:,:,2)   =       y_yuv(:,:,2); % Copy U Componet
                  
                x_2_yuv(:,:,3)   =       y_yuv(:,:,3); % Copy V Componet                   
              end 
                                   
                Par                     =    Par_Set (I, JPEG_Quality,  lambda, c);   

 %-------------------------------------JPEG Operator------------------------------------------%     
                           jpeg_name  = [filename '_jeg_q' num2str(JPEG_Quality)];
                           
                           imwrite(I, [jpeg_name '.jpg'], 'Quality',  JPEG_Quality);
                           
                           JPEG_info = imfinfo([jpeg_name '.jpg']);
 
                           JPEG_image = imread([jpeg_name '.jpg']);
 
                          
              Par.nim                    =                          double (JPEG_image);
              
              
              JPEG_Inital                =                           csnr ( Par.nim, Par.I, 0,0)
  
               [W, H]                    =                          size(I);
        
               bpp                       =                          JPEG_info.FileSize*8/(W*H);       
              
              JPEG_header_info           =                          jpeg_read([jpeg_name '.jpg']);
              
              Par.QTable                 =                          JPEG_header_info.quant_tables{1}; 
        
              Par.blockSize              =                          8;
              
              Par.C_q                    =                          blkproc(Par.nim , [8 8], 'dct2'); 
        
              meanQuant                  =                          mean(mean(Par.QTable(1:3,1:3)));
              
          %   Par.nSig                   =                          1.195.*meanQuant.^0.6394 + 0.9673; %文献公式6
         
              Par.nSig                   =                           sqrt(0.69*meanQuant^1.3); %噪声估计文献公式 6 
                            
              Par.Qfactor                =                          QF;
              
          %    Par.Qfactor                =                          AA;

        
 %--------------------------JPEG Operator------------------------------------------%             
                     
              
               
               [im, diff]                    =                     NSSRC_Deblocking_Main(Par.nim, Par,  p, Err_or);    
             
             Time_s                      =                          (etime(clock,time0));                          
                
              PSNR_Final                 =                          csnr (im, double(I), 0, 0);

              SSIM_Final                 =                          cal_ssim (im, double(I), 0, 0);
              
              FSIM_Final                 =                          FeatureSIM (im, double(I));       
              
              
              
              
                if kk  ==3
              
               x_2_yuv(:,:,1)            =                          uint8(im);
               
            SSR_QC_Re                  =                          ycbcr2rgb(uint8(x_2_yuv));   
                end      
                    
              
              

if JPEG_Quality==1
    

Final_denoisng= strcat(filename,'_NSSRC','_JQ_',num2str(JPEG_Quality),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');


if kk==3

imwrite(uint8(SSR_QC_Re),strcat('./JQ_1_Result/',Final_denoisng));

else
imwrite(uint8(im),strcat('./JQ_1_Result/',Final_denoisng));

end




elseif JPEG_Quality==5

Final_denoisng= strcat(filename,'_NSSRC','_JQ_',num2str(JPEG_Quality),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');

if kk==3

imwrite(uint8(SSR_QC_Re),strcat('./JQ_5_Result/',Final_denoisng));

else
imwrite(uint8(im),strcat('./JQ_5_Result/',Final_denoisng));

end


elseif JPEG_Quality==10

Final_denoisng= strcat(filename,'_NSSRC','_JQ_',num2str(JPEG_Quality),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');

if kk==3

imwrite(uint8(SSR_QC_Re),strcat('./JQ_10_Result/',Final_denoisng));

else
imwrite(uint8(im),strcat('./JQ_10_Result/',Final_denoisng));

end


elseif JPEG_Quality==15

Final_denoisng= strcat(filename,'_NSSRC','_JQ_',num2str(JPEG_Quality),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');

if kk==3

imwrite(uint8(SSR_QC_Re),strcat('./JQ_15_Result/',Final_denoisng));

else
imwrite(uint8(im),strcat('./JQ_15_Result/',Final_denoisng));

end


elseif JPEG_Quality==20
    
Final_denoisng= strcat(filename,'_NSSRC','_JQ_',num2str(JPEG_Quality),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');

if kk==3

imwrite(uint8(SSR_QC_Re),strcat('./JQ_20_Result/',Final_denoisng));

else
imwrite(uint8(im),strcat('./JQ_20_Result/',Final_denoisng));

end

elseif JPEG_Quality==30
    
Final_denoisng= strcat(filename,'_NSSRC','_JQ_',num2str(JPEG_Quality),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');

if kk==3

imwrite(uint8(SSR_QC_Re),strcat('./JQ_30_Result/',Final_denoisng));

else
imwrite(uint8(im),strcat('./JQ_30_Result/',Final_denoisng));

end


elseif JPEG_Quality==40
    
Final_denoisng= strcat(filename,'_NSSRC','_JQ_',num2str(JPEG_Quality),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');

if kk==3

imwrite(uint8(SSR_QC_Re),strcat('./JQ_40_Result/',Final_denoisng));

else
imwrite(uint8(im),strcat('./JQ_40_Result/',Final_denoisng));

end

elseif JPEG_Quality==50
    
Final_denoisng= strcat(filename,'_NSSRC','_JQ_',num2str(JPEG_Quality),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');

if kk==3

imwrite(uint8(SSR_QC_Re),strcat('./JQ_50_Result/',Final_denoisng));

else
imwrite(uint8(im),strcat('./JQ_50_Result/',Final_denoisng));

end


elseif JPEG_Quality==60
    
Final_denoisng= strcat(filename,'_NSSRC','_JQ_',num2str(JPEG_Quality),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');

if kk==3

imwrite(uint8(SSR_QC_Re),strcat('./JQ_60_Result/',Final_denoisng));

else
imwrite(uint8(im),strcat('./JQ_60_Result/',Final_denoisng));

end


elseif JPEG_Quality==70
    
Final_denoisng= strcat(filename,'_NSSRC','_JQ_',num2str(JPEG_Quality),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');

if kk==3

imwrite(uint8(SSR_QC_Re),strcat('./JQ_70_Result/',Final_denoisng));

else
imwrite(uint8(im),strcat('./JQ_70_Result/',Final_denoisng));

end


elseif JPEG_Quality==80
    
Final_denoisng= strcat(filename,'_NSSRC','_JQ_',num2str(JPEG_Quality),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');

if kk==3

imwrite(uint8(SSR_QC_Re),strcat('./JQ_80_Result/',Final_denoisng));

else
imwrite(uint8(im),strcat('./JQ_80_Result/',Final_denoisng));

end



else
    
    
    
Final_denoisng= strcat(filename,'_NSSRC','_JQ_',num2str(JPEG_Quality),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');

if kk==3

imwrite(uint8(SSR_QC_Re),strcat('./JQ_90_Result/',Final_denoisng));

else
imwrite(uint8(im),strcat('./JQ_90_Result/',Final_denoisng));

end




end              
              
end

