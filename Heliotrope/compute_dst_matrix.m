function [dist_matrix] = compute_dst_matrix(vid)

%This function is used to compute the distance Matrix based on L2 norm.


[height,width,~,frame_num] = size(vid);
dist_matrix = zeros(frame_num,frame_num);

for i = 1:frame_num
    
    
    for j = 1:frame_num
        dist_R = ((vid(:,:,1,i)-vid(:,:,1,j)).^2);
        dist_G = ((vid(:,:,2,i)-vid(:,:,2,j)).^2);
        dist_B = ((vid(:,:,3,i)-vid(:,:,3,j)).^2);
        %dist_matrix(i,j) = sqrt(sum(sum(dist_R+dist_G+dist_B)));
        temp = (sum(dist_R(:))+sum(dist_G(:))+sum(dist_B(:)))/(frame_num^2);
        dist_matrix(i,j) = sqrt(temp);
    end
    
end
dist_matrix = rescale(dist_matrix);
end

