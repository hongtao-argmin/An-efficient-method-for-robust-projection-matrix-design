%% 
clc;
clear;
close all;
%% train the dictionary versus K
M = 80;
L = 800;
K_array = [11;16;21;26;31];
epoch = 2; Batchsize = 256; mode_A=false; mode_B = true; mode_C = true;
Isini = false; Iter_dic = 1; Percent = 0.005; Iter_unused = 1000;
param = struct('epsilon',1e-6,'K',L,'epoch',epoch,'Batchsize',Batchsize...
    ,'mode_A',mode_A,'mode_B',mode_B,'mode_C',mode_C,...
    'Isini',Isini,'Iter_dic',Iter_dic,'Percent',Percent,'Iter_unused',Iter_unused);
%% 
for i=1:length(K_array)
    i
    param.lambda = K_array(i);
    Psi_Online_large{i} = Online_DIC_MBPS09('trainblkMatrix256_400.mat','testblkMatrix_256_400.mat',param);
end
%% Test the recovery PSNR
clear param
load('testblkMatrix_256_400.mat')
num_K = length(K_array);
PSNR_MT = zeros(num_K,1);
param.M = M;
for i=1:num_K
   i
   K = K_array(i);
   Psi = Psi_Online_large{i};
   param.Psi = Psi;
   param.K = K;
   [~,~,PSNR_MT_lambda] = effect_lambda_func(param,X_test);
   PSNR_MT(i) = max(PSNR_MT_lambda);    
end

%% plot the figure 
figure
plot(K_array,PSNR_MT,'r-','linewidth',2)
axis tight
z=legend('$CS_{MT}$');
set(z,'interpret','latex')
xlabel('$K$','interpret','latex')
ylabel('$\varrho_{psnr}$','interpret','latex')