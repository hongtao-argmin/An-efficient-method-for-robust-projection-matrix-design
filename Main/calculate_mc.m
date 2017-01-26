% This function is written to calculate the mutual coherence and average
% mutual coherence. 
%
% Input:
%      D: the dictionary or equivalent dictionary.
%      mu_bound: the low bound used in calculating the average mutual
%      coherence. If it is omitted, the welch bound is chosen.  
% Output:
%      mu: the mutual coherence
%      mu_av: the average mutual coherence
% Written by Tao Hong, CS-Technion, 8th Sep. 2016.
% @Copyright
%======================================================================================%
function [mu,mu_av] = calculate_mc(D,mu_bound)

if norm(D(:,1))~=1
    norm_operator = sparse(diag(1./sqrt(sum(D.*D))));
    D = D*norm_operator;
end
[M,L] = size(D);
if nargin<2
mu_bound = sqrt((L-M)/(M*(L-1)));
end
G = D'*D; G = G-eye(L); G = abs(G); G = G(:);
mu = max(G);
index = G>=mu_bound;
mu_av = sum(G(index))/sum(index);
end

