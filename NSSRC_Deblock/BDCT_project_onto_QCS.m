function projectedImage  = BDCT_project_onto_QCS(I_hat, C_q, QTable, factor, blockSize)

% Jian Zhang

Q = QTable;
fun_dct2 = @(block_struct) dct2(block_struct.data);
projectedCoe    = blockproc(I_hat, [blockSize blockSize], fun_dct2);        % initial value is DCT coefficients of restored image

maxRange   = factor * Q;         % use blockproc

fun_upper =  @(block_struct) (block_struct.data + maxRange);
fun_lower =  @(block_struct) (block_struct.data - maxRange);
upper      = blockproc(C_q, [blockSize blockSize], fun_upper);    
lower      = blockproc(C_q, [blockSize blockSize], fun_lower);

projectedCoe( projectedCoe>upper ) = upper( projectedCoe>upper );               % projection onto (N)QCS
projectedCoe( projectedCoe<lower ) = lower( projectedCoe<lower );

fun_idct2 = @(block_struct) idct2(block_struct.data);
projectedImage = blockproc(projectedCoe, [blockSize blockSize], fun_idct2);