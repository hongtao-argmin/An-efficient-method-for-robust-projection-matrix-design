% This file is written to conduct our algorithm in the experiment A
%%
close all;
clear;
clc
%%
% Parameters set
M = 20; N=64; L = 100; N_ite = 35; K = 4; lambda = 0.1;

blkSize = 8; mblk_I = 8; nblk_I = mblk_I;

% Dictionary Learning
% although we will obtain different dictionary every time, the asymptotic
% property will never change.
% load the traindata which is stored in X
load('trainblkMatrix.mat')
% DCT initial dictionary
DCT=zeros(N,L);
for k=0:1:L-1,
    V=cos([0:1:N-1]'*k*pi/L);
    if k>0, V=V-mean(V); end;
    DCT(:,k+1)=V/norm(V);
end;
param_KSVD = struct('data',X,'Tdata',K,'dictsize',L,'iternum',N_ite,'exact',true,'initdict',DCT);
[Psi_KSVD,CoefMatrix] = ksvd(param_KSVD);
E = X - Psi_KSVD*omp(Psi_KSVD,X,Psi_KSVD'*Psi_KSVD,K);
%%
G_t = eye(L);
fprintf('||I-G}||_F2,  mu,  mu_{av},  ||Phi||_F2,  ||Phi E||_F2\n')
% Projection matrix design
param_Robust = struct('M',M,'lambda',lambda,'D',Psi_KSVD);
Phi_MT = Robust_Project_Matrix(param_Robust);
temp = Phi_MT*Psi_KSVD;
[mu,mu_av] = calculate_mc(temp);
fprintf('The values the MT system are\n %d  %d  %d  %d  %d\n',norm(G_t-(temp)'*(temp),'fro')^2,...
    mu,mu_av,norm(Phi_MT,'fro')^2,norm(Phi_MT*E,'fro')^2)


%%
%Testing on natural images
im = imread('Data\peppers256.png');
im = double(im);
[im,~,~] = our_im2col(im,blkSize);
im_mean = mean(im);
im_mean_0 = im - ones(size(im,1),1)*im_mean;
PSNR_MT = showImage(im_mean_0,Phi_MT,Psi_KSVD,K);
fprintf('The PSNR for MT matrix is: %d\n',PSNR_MT)
