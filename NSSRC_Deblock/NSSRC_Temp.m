function  X   =   NSSRC_Temp( Y, Weight, c, nsig, mB, p )

U                  =    getsvd(Y); % generate PCA basis

A0                 =    U'*Y; %49*60

s0                 =    mean (A0.^2,2); %49*1

s0                 =    max  (0, s0-nsig^2); %49*1

LambdaM            =    repmat ( c*nsig^2./(sqrt(s0)+0.2),[1, size(A0,2)]); 


c0                    =  size(A0,2);

        I                 =             ones (size(Weight));
        
     Residual           =             abs (I-c0*Weight);

Alpha              =    solve_Lp_w (A0, LambdaM.*Residual, p);%GST Algorithm
 
X                  =    U*Alpha;

X                  =    X + mB;

return;