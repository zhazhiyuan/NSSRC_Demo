
function  Opts   =    Opts_Set( nSig,  I, gamma, lamada, c1 )

randn ('seed',0);

Opts.I         =   double(I);

Opts.nSig      =   nSig;

Opts.Iter      =   25;

%Opts.eps       =   0.2;


if nSig <= 10
    
    Opts.win       =   6;
    
    Opts.nblk      =   60;   
    
    Opts.c1        =  c1*2.0*sqrt(2);  
    
    Opts.gamma     =   gamma;     
    
    Opts.lamada    =    lamada;
    
    Opts.hp        =   45;   
    
 %   Opts.errr_or   =   0.0003;   

    
elseif nSig <= 20
    
    Opts.win       =   7;
    
    Opts.nblk      =   60;   
    
    Opts.c1        =   c1*2.0*sqrt(2);  
    
    Opts.gamma     =   gamma;     
    
    Opts.lamada    =    lamada;
    
    Opts.hp        =    45;
    
%    Opts.errr_or   =   0.0008;   
    

elseif nSig <= 30
    
    Opts.win       =   7;
    
    Opts.nblk      =   60;
    
    Opts.c1        =   c1*2.0*sqrt(2);  
    
    Opts.gamma     =   gamma;     
    
    Opts.lamada    =    lamada;
    
    Opts.hp        =   60;
     
%    Opts.errr_or   =   0.002;  
    
  
    
 elseif nSig <= 40
    
    Opts.win       =   7;
    
    Opts.nblk      =   60;
    
    Opts.c1        =   c1*2.0*sqrt(2);  
    
    Opts.gamma     =   gamma;     
    
    Opts.lamada    =    lamada;
    
    Opts.hp        =   80;
     
%    Opts.errr_or   =   0.002;   
    
    
elseif nSig<=50
    
    Opts.win       =   7;
    
    Opts.nblk      =   60;
     
    Opts.c1        =   c1*2.0*sqrt(2);  
    
    Opts.gamma     =   gamma;     
    
    Opts.lamada    =    lamada;
    
    Opts.hp        =   115;
    
%    Opts.errr_or   =   0.001;   

    
elseif nSig<=75
    
    Opts.win       =   8;
    
    Opts.nblk      =   70;
    
    Opts.c1        =   c1*2.0*sqrt(2);  
    
    Opts.gamma     =   gamma;     
    
    Opts.lamada    =    lamada;
    
    Opts.hp        =   160;
    
%    Opts.errr_or   =   0.0005;   
    

    
else
    
    Opts.win       =   9; 
    
    Opts.nblk      =   90;
    
    Opts.c1        =   c1*2.0*sqrt(2);  
    
    Opts.gamma     =   gamma;     
    
    Opts.lamada    =    lamada;
    
    Opts.hp        =   160;
    
%    Opts.errr_or   =   0.0005;   

    
end

Opts.step      =   min(4, Opts.win-1);

end

