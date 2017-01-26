%
%% parameter setting
clear;
clc;
close all;
%% 
epoch = 5; Batchsize = 256; mode_A=false; mode_B = true; mode_C = true;
Isini = false; Iter_dic = 1; Percent = 0.005; Iter_unused = 1000;
param = struct('epsilon',1e-6,'K',L,'lambda',K,'epoch',epoch,'Batchsize',Batchsize...
    ,'mode_A',mode_A,'mode_B',mode_B,'mode_C',mode_C,...
    'Isini',Isini,'Iter_dic',Iter_dic,'Percent',Percent,'Iter_unused',Iter_unused);
Psi_Online_large = Online_DIC_MBPS09('trainblkMatrix256_400.mat','testblkMatrix_256_400.mat',param);
Psi = Psi_Online_large;
K = 16;
M_array = 50:5:80;

%% 
num_M = length(M_array);
PSNR_MT = zeros(num_M,1);
load('testblkMatrix_256_400.mat')
param.K = K;
param.Psi = Psi;
for i=1:num_M
   i
   M = M_array(i);
   param.M = M;
   [~,~,PSNR_MT_lambda] = effect_lambda_func(param,X_test);
   PSNR_MT(i) = max(PSNR_MT_lambda);    
end

%% plot the figure
figure
plot(M_array,PSNR_MT,'r-','linewidth',2);
z=legend('$CS_{randn}$','$CS_{DCS}$','$CS_{MT}$');
set(z,'interpret','latex')
xlabel('$M$','interpret','latex')
ylabel('$\varrho_{psnr}$','interpret','latex')