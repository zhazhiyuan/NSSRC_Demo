
function  Par   =    Par_Set(  I,  JPEG_Quality,  lambda, c)

randn ('seed',0);

Par.I         =   double(I);

Par.Iter      =   25;

Par.eps       =   0.2;

Par.hp        =   40;  

Par.win       =   7;

Par.nblk      =   40;  

Par.AA        =   10;  

if JPEG_Quality <= 1

    
    
    
    Par.lambda            =      lambda;   

    Par.c                 =      c;  
 
    
elseif JPEG_Quality <= 5
    
    
    
    
    
    Par.lambda            =      lambda;   

    Par.c                 =      c;  
 
    
    
elseif JPEG_Quality <= 10
    
    
    
    
    Par.lambda            =      lambda;   

    Par.c                 =      c;  
 

    
 elseif JPEG_Quality <= 15
     
    
    
    
    Par.lambda            =      lambda;   

    Par.c                 =      c;  
 
 elseif JPEG_Quality <= 20
     
    
    
    
    Par.lambda            =      lambda;   

    Par.c                 =      c;  
    
    
 elseif JPEG_Quality <= 30
     
    
    
    
    Par.lambda            =      lambda;   

    Par.c                 =      c;  
 
 

else
    
    
    
    Par.lambda            =      lambda;   

    Par.c                 =      c;  
  

end

Par.step      =   min(4, Par.win-1);

end

