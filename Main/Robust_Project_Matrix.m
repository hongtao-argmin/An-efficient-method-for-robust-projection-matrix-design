% This function is written to solve the problem:
% min_\Phi \|I-D'*Psi'*Psi*D\|_F^2+\lambda\|Psi\|_F^2.
% The default method is to choose toolbox minFunc on CG, BFGS etc.   
%
% Input:
%       param is a struct.
%
%       param.M: the number of row of the projection matrix.
%
%       param.lambda: the trade-off parameter
%
%       param.D: the given dictionary
%       
%       param.param_BFGS: the parameter setting of the `minFunc'. 
%       The default is to call CG with back-tracking as the line search strategy.
%              
%       param.LBJH: if it is true, the closed-form solution given in [8] is
%       called. The default is false.
%       
%       param.precond: whether to utilize regularization techniques for LBJH. The default is false.
%
% Output:
%       Phi_final: the optimal projection matrix.
%       
% Written by Tao Hong in CS-Technion 19th Jan. 2017.
%@Copyright
%=============================================================
