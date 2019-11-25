function [vx,vy] = compute_flow_location(i,j,flows_a)
%given two frames, it will return their corresponded flow index.
%  i : input image 1
%  j : input image 2


if (i>j)
    k = (i-1) * (i-2) / 2 + j;
    vx = flows_a(:,:,1,k);
    vy = flows_a(:,:,2,k);
elseif (i<j)
    k = (j-1) * (j-2) / 2 + i;
    vx = -flows_a(:,:,1,k);
    vy = -flows_a(:,:,2,k);
else
    vx = 0;
    vy = 0;
end

end

