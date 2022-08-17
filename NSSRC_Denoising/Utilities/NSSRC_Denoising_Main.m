function [filename,  PSNR_Final,FSIM_Final,SSIM_Final, Time_s]     =  NSSRC_Denoising_Main (filename, Sigma,gamma, lamada, c1, p, Err_or)


randn ('seed',0);

fn               =     [filename, '.tif'];

I                =     imread(fn);

%I                =  imresize (I, [256,256]);

[~, ~, kk]       =     size (I);

if kk==3
    
    I     = rgb2gray (I);
       
end


Opts              =    Opts_Set (Sigma, I, gamma, lamada, c1);

Opts.nim          =    Opts.I + Opts.nSig* randn(size( Opts.I ));

disp(sprintf('PSNR of the noisy image = %f \n', csnr(Opts.nim, Opts.I, 0, 0) ));


time0         =   clock;

[Denoising ,  iter]              =    NSSRC_Denoising( Opts, p, Err_or);

   Time_s =(etime(clock,time0));

im  = Denoising{iter};


PSNR_Final       =   csnr (im, Opts.I,0,0);
FSIM_Final       =   FeatureSIM(im, Opts.I);
SSIM_Final       =   cal_ssim (im, Opts.I,0,0);



if Sigma==10

Final_denoisng= strcat(filename,'NSSRC_','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(im),strcat('./10_Result/',Final_denoisng));


elseif Sigma==20

Final_denoisng= strcat(filename,'NSSRC_','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(im),strcat('./20_Result/',Final_denoisng));

elseif Sigma==30
    
Final_denoisng= strcat(filename,'NSSRC_','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(im),strcat('./30_Result/',Final_denoisng));

elseif Sigma==40
    
Final_denoisng= strcat(filename,'NSSRC_','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(im),strcat('./40_Result/',Final_denoisng));

elseif Sigma==50
    
Final_denoisng= strcat(filename,'NSSRC_','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(im),strcat('./50_Result/',Final_denoisng));

elseif Sigma==75
    
Final_denoisng= strcat(filename,'NSSRC_','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');


imwrite(uint8(im),strcat('./75_Result/',Final_denoisng));

else
    
Final_denoisng= strcat(filename,'NSSRC_','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(im),strcat('./100_Result/',Final_denoisng));
end


end

