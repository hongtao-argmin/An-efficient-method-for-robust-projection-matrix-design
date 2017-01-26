%% 
clc;
clear;
close all;
%% train the dictionary versus L
M = 80;
K = 16;
L_array = [650;700;750;800;850;900;950];

epoch = 2; Batchsize = 256; mode_A=false; mode_B = true; mode_C = true;
Isini = false; Iter_dic = 1; Percent = 0.005; Iter_unused = 1000;
param = struct('epsilon',1e-6,'lambda',K,'epoch',epoch,'Batchsize',Batchsize...
    ,'mode_A',mode_A,'mode_B',mode_B,'mode_C',mode_C,...
    'Isini',Isini,'Iter_dic',Iter_dic,'Percent',Percent,'Iter_unused',Iter_unused);
%% 
for i=1:length(L_array)
    i
    param.K = L_array(i);
    Psi_Online_large{i} = Online_DIC_MBPS09('trainblkMatrix256_400.mat','testblkMatrix_256_400.mat',param);
end

%% Test the recovery PSNR
clear param
load('Vary_L_High.mat')
load('testblkMatrix_256_400.mat')
num_L = length(L_array);
PSNR_MT = zeros(num_L,1);
param.M = M;
param.K = K;
for i=1:num_L
   i
   Psi = Psi_Online_large{i};
   param.Psi = Psi;
   [~,~,PSNR_MT_lambda] = effect_lambda_func(param,X_test);
   PSNR_MT(i) = max(PSNR_MT_lambda);    
end
%% plot the figure 
figure
plot(L_array,PSNR_MT,'r-','linewidth',2)
axis tight
z=legend('$CS_{MT}$');
set(z,'interpret','latex')
xlabel('$L$','interpret','latex')
ylabel('$\varrho_{psnr}$','interpret','latex')