function  X   =   NSSRC_Temp( Y, Weight, c, nsig, mB, p )
% =========================================================================

%----------------------------------------------------------------------

U                  =    getsvd(Y); % generate PCA basis

A0                 =    U'*Y; %49*60

mm                 =    size (A0,2);

s0                 =    mean (A0.^2,2); %49*1

s0                 =    max  (0, s0-nsig^2); %49*1

LambdaM            =    repmat ( c*nsig^2./(sqrt(s0)+eps),[1, size(A0,2)]); %Generate the weight  49*60


        I                 =             ones (size(Weight));
        
     Residual           =             abs (I-Weight*mm);

Alpha              =    solve_Lp_w (A0, LambdaM.*Residual, p);%GST Algorithm
 
X                  =    U*Alpha;

X                  =    X + mB;

return;