function [blocks,mblk_I,nblk_I] = our_im2col(I,blkSize)

[m,n]=size(I);
blocks = zeros(blkSize^2,(floor(m/blkSize)*floor(n/blkSize)));
k=1;
for i = 1:floor(m/blkSize)
    for j=1:floor(n/blkSize)
    currBlock = I(blkSize*(i-1)+1:blkSize*(i-1)+blkSize,blkSize*(j-1)+1:blkSize*(j-1)+blkSize);
    blocks(:,k) = im2col(currBlock,[blkSize blkSize]);
    k=k+1; 
    end
end
mblk_I=floor(m/blkSize);nblk_I=floor(n/blkSize);
