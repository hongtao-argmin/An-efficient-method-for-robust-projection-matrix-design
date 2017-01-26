
function [PSNR,MSE]=showImage(X,Phi,Psi,K)

Y = Phi*X;
D = Phi*Psi;
norm_operator = sparse(diag(1./sqrt(sum(D.*D))));
D = D*norm_operator;
S_hat = omp(D'*Y,D'*D,K);
S_hat = norm_operator*S_hat;
X_hat = Psi*S_hat;
MSE = (norm((X_hat-X),'fro'))^2/numel(X);
PSNR = 10*log10(255^2/MSE);

