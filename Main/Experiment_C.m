% This file is written to conduct our algorithm in the experiment C.
%%
clear;
clc
close all;
%% 
M = 80; N=256; L = 800; K = 16; lambda = 0.5;
M_bias = 0;
blkSize = 16; mblk_I = 16; nblk_I = mblk_I;

%% train online dictionary
epoch = 5; Batchsize = 256; mode_A=false; mode_B = true; mode_C = true;
Isini = false; Iter_dic = 1; Percent = 0.005; Iter_unused = 1000;
param = struct('epsilon',1e-6,'K',L,'lambda',K,'epoch',epoch,'Batchsize',Batchsize...
    ,'mode_A',mode_A,'mode_B',mode_B,'mode_C',mode_C,...
    'Isini',Isini,'Iter_dic',Iter_dic,'Percent',Percent,'Iter_unused',Iter_unused);
Psi_Online_large = Online_DIC_MBPS09('trainblkMatrix256_400.mat','testblkMatrix_256_400.mat',param);

%% 
% design projection matrices
param_Robust = struct('M',M,'lambda',lambda,'D',Psi_Online_large);
Phi_MT = Robust_Project_Matrix(param_Robust);

%% test image
im = imread('Data\lena.png');
im = double(im);
[im,~,~] = our_im2col(im,blkSize);
im_mean = mean(im);
im_mean_0 = im - ones(size(im,1),1)*im_mean;

PSNR_MT = showImage(im_mean_0,Phi_MT,Psi_Online_large,K);
fprintf('The PSNR for MT matrix is: %d\n',PSNR_MT)
