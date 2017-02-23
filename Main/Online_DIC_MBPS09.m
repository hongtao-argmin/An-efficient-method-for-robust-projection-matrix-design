% This file is written to realize the online-dictionary algorithm shown in
% the paper. J. Mairal, F. Bach, J. Ponce and G. Sapiro, ``Online learning
% for matrix factorization and sparse coding,'' JMLR, 2010.
%
% [D,test_error,traintime]=Online_DIC_MBPS09(traindata_filename,testdata_filename,param);
% Input:
%      traindata_filename: the filename of the training data, the data
%      should be stored in .mat form and named X.
%
%      testdata_filename: the filename of the test data, the data should be
%      stored in .mat form and named X_test.
%
%      param: this is a struct parameter which defines the necessary
%      parameters in this code.
%
%      param.mode_A: Utilize A_t =  beta*A_t+\alpha*\alpha^T where beta =
%      \frac{\theta+1-\eta}{\theta+1} with \theta = t*\eta if t<\eta,
%      otherwise \theta = \eta^2+t-\eta for t represents the iteration number
%      to updata A_t and B_t which is shown in J. Mairal, F. Bach, J. Ponce and G. Sapiro, ``Online
%      dictionary learning for learning sparse coding,'' ICML, 2009.
%
%      param.mode_B: Utilize A_t = beta*A_t+\alpha*\alpha^T where beta =
%      (1-1/t)^rho with t represents the iteration number to update A_t and
%      B_t which is shown in J. Mairal, F. Bach, J. Ponce and G. Sapiro, ``Online learning
%      for matrix factorization and sparse coding,'' JMLR, 2010.
%      param.rho: the parameters should be defined if we choose mode_B.
%
%      param.mode_C: after finishing two epoches, we choose to forget the
%      information shown in A_t and B_t from the first epoch.
%
%      param.lambda: the number of nonzero coefficients.
%      param.K: the number of columns in the dictionary.
%      param.epoch: the number of epoches, it must be given to control the
%      terminated of the given algorithm.
%
%      param.Iter: the number of dictionary iterations. If this value is
%      given and smaller than the epoches, the algorithm will be terminated
%      soon. However, this value can be omitted.
%
%      param.Iter_dic: the number of iterations for updating the dictionary
%      column by column. The default is 1.
%
%      param.Percent: the percent of how many less used atoms over maximal
%      used atoms. If the unused atoms ratio smaller than this value will
%      be replaced by the training data.
%
%      param.Iter_unused: after how many iterations, we call the replace
%      the unused atoms steps.
%
%      param.Batchsize: the size of batch, default is 256.
%      param.Isini: whether given an initial value for A_t and B_t. this
%      may useless and may cancel in the future.
%      param.t_0: the parameter used to initialize A_t and B_t.
%
%      param.epsilon: the tolerance when we need to choose the training
%      data, we do not want to choose the zero column.
%
%      param.isshow: show the generalization error on the test data. The
%      default is false. Note that if this is true, the code will become
%      slow because we need to calculate the generalization error.
%
% Output:
%       D: the output dictionary.
%       test_error: the test error.
%       traintime: the traintime.
%Written by Tao Hong in CS-Faculty Technion 6th Aug. 2016.
%Reference:
%      [1] J. Mairal, F. Bach, J. Ponce and G. Sapiro, ``Online
%      dictionary learning for learning sparse coding,'' ICML, 2009.
%      [2] J. Mairal, F. Bach, J. Ponce and G. Sapiro, ``Online learning
%      for matrix factorization and sparse coding,'' JMLR, 2010.
%@Copyright
