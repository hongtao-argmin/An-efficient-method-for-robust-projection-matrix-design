%  This function is written to test how to choose the best parameter lambda
%  based on the testing data for the proposed algorithm.
%
% function [lambda,Phi_MT,PSNR_MT] = effect_lambda_func(param,X_test);
%
%  Input:
%       param: a class parameter
%       param.M: the row of the projection matrix
%       param.K: the sparsity level of the given dictionary.
%       param.Psi: the given dictionary.
%       param.lambda: the range of the lambda. The default is 0:0.1:1.
%       param.decision: `1' means in image we calculate the PSNR, otherwise
%       we calculate the MSE.
%       X_test: the test signal.
%
% Output:
%       lambda: the lambda which give the proposed algorithm a highest PSNR on
%       testing data.
%       Phi_MT: the obtained Projection Matrix set by the proposed algorithm.
%       PSNR_MT: the different PSNR with corresponding Projection Matrix by the proposed algorithm.
% Author: Tao Hong in Taub CS Department, Technion. 1th Dec. 2016.
%@Copyright.
%-------------------------------------------------------------------------------------------------
