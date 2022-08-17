clc
clear
m_10_1=0; 
m_10_2=0; 
m_10_3=0; 
m_20_1=0; 
m_20_2=0; 
m_20_3=0; 
m_30_1=0; 
m_30_2=0; 
m_30_3=0; 
m_40_1=0;
m_40_2=0; 
m_40_3=0; 
m_50_1=0;
m_50_2=0; 
m_50_3=0; 
m_75_1=0;
m_75_2=0; 
m_75_3=0; 
m_100_1=0;
m_100_2=0; 
m_100_3=0; 

All_data_Results_10_1 = cell(1,200);
All_data_Results_10_2 = cell(1,200);
All_data_Results_10_3 = cell(1,200);

All_data_Results_20_1 = cell(1,200);
All_data_Results_20_2 = cell(1,200);
All_data_Results_20_3 = cell(1,200);

All_data_Results_30_1 = cell(1,200);
All_data_Results_30_2 = cell(1,200);
All_data_Results_30_3 = cell(1,200);

All_data_Results_40_1 = cell(1,200);
All_data_Results_40_2 = cell(1,200);
All_data_Results_40_3 = cell(1,200);

All_data_Results_50_1 = cell(1,200);
All_data_Results_50_2 = cell(1,200);
All_data_Results_50_3 = cell(1,200);

All_data_Results_75_1 = cell(1,200);
All_data_Results_75_2 = cell(1,200);
All_data_Results_75_3 = cell(1,200);

All_data_Results_100_1 = cell(1,200);
All_data_Results_100_2 = cell(1,200);
All_data_Results_100_3 = cell(1,200);



for i = 1:15
ImageNum =i;

switch ImageNum
          case 1
                filename = 'airplane';
            case 2
                filename = 'Barbara';
            case 3
                filename = 'boats';
            case 4
                filename = 'Fence';    
            case 5
                filename = 'flower'; 
                
            case 6
                filename = 'foreman';
            case 7
                filename = 'House';
            case 8
                filename = 'J.Bean';
            case 9
                filename = 'Leaves';    
            case 10
                filename = 'lena'; 
                
            case 11
                filename = 'Monarch';
            case 12
                filename = 'Parrots';
            case 13
                filename = 'plants';     
                
            case 14
                filename = 'starfish';
            case 15
                filename = 'Lake';
       
            
end



for j  =  1:7
    
   
filename    
randn ('seed',0);

Sigma_Num        =       [10, 20, 30, 40, 50, 75, 100]; 



Sigma             =       Sigma_Num(j)


if Sigma <=10
       
    p                 =       0.85;% 0.95
    
elseif Sigma <=20
       
    p                 =      0.80;%  0.90

elseif Sigma <=30
    
    p                 =       0.80;
    
elseif Sigma <=40
    
    p                 =       0.85;%0.80  
    
elseif Sigma <=50
    
    p                 =       0.70;%0.75
    
elseif Sigma <=75
    
    p                 =       0.20;%0.1;
    
else
    p                 =       0.20;%0.05;

end



if Sigma<= 10
    
     gamma  = 0.3;      lamada  =   0.8;   c1  =  0.2;  Err_or  =  0.00017;
     
elseif Sigma<= 20  
    
     gamma  = 0.3;      lamada  =   1;   c1  =  0.1;   Err_or  =  0.00087;

elseif Sigma<= 30  
         
     gamma  = 0.2;      lamada  =   0.9;   c1  =  0.1;    Err_or  =  0.0016;
elseif Sigma<= 40  
         
     gamma  = 0.1;      lamada  =   0.8;   c1  =  0.1;     Err_or  =  0.0024;
     
elseif Sigma<= 50  
    
     gamma  = 0.1;      lamada  =   0.7;   c1  =  0.3;    Err_or  =  0.0011;
     
elseif Sigma<= 75  
    
         gamma  = 0.1;      lamada  =   0.8;   c1  =  2.5;   Err_or  =  0.0027;
else
         gamma  = 0.1;      lamada  =   0.8;   c1  =  2.5;     Err_or  =  0.0023;
end





 if  Sigma== 10
     
     
  [filename,  PSNR_Final,FSIM_Final,SSIM_Final, Time_s]     =  NSSRC_Denoising_Main (filename, Sigma, gamma, lamada, c1, p,Err_or); 
 
 m_10_1= m_10_1+1;
 
 s=strcat('A',num2str(m_10_1));
 
 All_data_Results_10_1{m_10_1}={filename, Sigma, PSNR_Final,FSIM_Final,SSIM_Final,Time_s};
 
 
 xlswrite('NSSRC_Sigma_10_Final.xls', All_data_Results_10_1{m_10_1},'sheet1',s);
 
 
 
 
 elseif  Sigma==20
     
 [filename,  PSNR_Final,FSIM_Final,SSIM_Final, Time_s]     =  NSSRC_Denoising_Main (filename, Sigma, gamma, lamada, c1, p,Err_or); 
 
 m_20_1= m_20_1+1;
 
 s=strcat('A',num2str(m_20_1));
 
 All_data_Results_20_1{m_20_1}={filename, Sigma, PSNR_Final,FSIM_Final,SSIM_Final,Time_s};
 
 xlswrite('NSSRC_Sigma_20_Final.xls', All_data_Results_20_1{m_20_1},'sheet1',s);
 

 
  elseif  Sigma==30
     
         
     
 [filename,  PSNR_Final,FSIM_Final,SSIM_Final, Time_s]     =  NSSRC_Denoising_Main (filename, Sigma, gamma, lamada, c1, p,Err_or); 
 
 m_30_1= m_30_1+1;
 
 s=strcat('A',num2str(m_30_1));
 
 All_data_Results_30_1{m_30_1}={filename, Sigma, PSNR_Final,FSIM_Final,SSIM_Final,Time_s};
 
 xlswrite('NSSRC_Sigma_30_Final.xls', All_data_Results_30_1{m_30_1},'sheet1',s);

   elseif  Sigma==40
     
     
 [filename,  PSNR_Final,FSIM_Final,SSIM_Final, Time_s]     =  NSSRC_Denoising_Main (filename, Sigma, gamma, lamada, c1, p,Err_or); 
 
 m_40_1= m_40_1+1;
 
 s=strcat('A',num2str(m_40_1));
 
 All_data_Results_40_1{m_40_1}={filename, Sigma, PSNR_Final,FSIM_Final,SSIM_Final,Time_s};
 
 xlswrite('NSSRC_Sigma_40_Final.xls', All_data_Results_40_1{m_40_1},'sheet1',s);
 
 

 elseif  Sigma==50
     
 [filename,  PSNR_Final,FSIM_Final,SSIM_Final, Time_s]     =  NSSRC_Denoising_Main (filename, Sigma, gamma, lamada, c1, p,Err_or); 
 
 m_50_1= m_50_1+1;
 
 s=strcat('A',num2str(m_50_1));
 
 All_data_Results_50_1{m_50_1}={filename, Sigma, PSNR_Final,FSIM_Final,SSIM_Final,Time_s};
 
 xlswrite('NSSRC_Sigma_50_Final.xls', All_data_Results_50_1{m_50_1},'sheet1',s);

 
 
 elseif  Sigma==75
     
     
 [filename,  PSNR_Final,FSIM_Final,SSIM_Final, Time_s]     =  NSSRC_Denoising_Main (filename, Sigma, gamma, lamada, c1, p,Err_or); 
 
 m_75_1= m_75_1+1;
 
 s=strcat('A',num2str(m_75_1));
 
 All_data_Results_75_1{m_75_1}={filename, Sigma, PSNR_Final,FSIM_Final,SSIM_Final,Time_s};
 
 xlswrite('NSSRC_Sigma_75_Final.xls', All_data_Results_75_1{m_75_1},'sheet1',s);
 


 else
     
     
 [filename,  PSNR_Final,FSIM_Final,SSIM_Final, Time_s]     =  NSSRC_Denoising_Main (filename, Sigma, gamma, lamada, c1, p,Err_or); 
 
 m_100_1= m_100_1+1;
 
 s=strcat('A',num2str(m_100_1));
 
 All_data_Results_100_1{m_100_1}={filename, Sigma, PSNR_Final,FSIM_Final,SSIM_Final,Time_s};
 
 xlswrite('NSSRC_Sigma_100_Final.xls', All_data_Results_100_1{m_100_1},'sheet1',s);


 end
 

clearvars -except filename i m_10_1 m_10_2 m_10_3 m_20_1 m_20_2 m_20_3 m_30_1 m_30_2 m_30_3 m_40_1 m_40_2 m_40_3...
m_50_1 m_50_2 m_50_3 m_75_1 m_75_2 m_75_3 m_100_1 m_100_2 m_100_3 All_data_Results_10_1...
All_data_Results_10_2 All_data_Results_10_3 All_data_Results_20_1 All_data_Results_20_2...
All_data_Results_20_3 All_data_Results_30_1 All_data_Results_30_2 All_data_Results_30_3...
All_data_Results_40_1 All_data_Results_40_2 All_data_Results_40_3 All_data_Results_50_1...
All_data_Results_50_2 All_data_Results_50_3 All_data_Results_75_1 All_data_Results_75_2...
All_data_Results_75_3 All_data_Results_100_1 All_data_Results_100_2 All_data_Results_100_3
end
clearvars -except filename m_10_1 m_10_2 m_10_3 m_20_1 m_20_2 m_20_3 m_30_1 m_30_2 m_30_3 m_40_1 m_40_2 m_40_3...
m_50_1 m_50_2 m_50_3 m_75_1 m_75_2 m_75_3 m_100_1 m_100_2 m_100_3 All_data_Results_10_1...
All_data_Results_10_2 All_data_Results_10_3 All_data_Results_20_1 All_data_Results_20_2...
All_data_Results_20_3 All_data_Results_30_1 All_data_Results_30_2 All_data_Results_30_3...
All_data_Results_40_1 All_data_Results_40_2 All_data_Results_40_3 All_data_Results_50_1...
All_data_Results_50_2 All_data_Results_50_3 All_data_Results_75_1 All_data_Results_75_2...
All_data_Results_75_3 All_data_Results_100_1 All_data_Results_100_2 All_data_Results_100_3
end






         