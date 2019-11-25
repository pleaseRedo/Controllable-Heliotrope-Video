function [dist_matrix] = advanced_1(vid,flows_a)
[height,width,~,frame_num] = size(vid);
dist_matrix = zeros(frame_num,frame_num);

for i = 1:frame_num
    
    
    for j = 1:frame_num
        dist_R = ((vid(:,:,1,i)-vid(:,:,1,j)).^2);
        dist_G = ((vid(:,:,2,i)-vid(:,:,2,j)).^2);
        dist_B = ((vid(:,:,3,i)-vid(:,:,3,j)).^2);
        %dist_matrix(i,j) = sqrt(sum(sum(dist_R+dist_G+dist_B)));
        temp = (sum(dist_R(:))+sum(dist_G(:))+sum(dist_B(:)))/(frame_num^2);
        
        [vx,vy] = compute_flow_location(i,j,flows_a);
        dist_vx = vx.^2;
        dist_vy = vy.^2;
        temp_v = sum(dist_vx(:) + dist_vy(:));
        dist_matrix(i,j) = sqrt(temp+temp_v);
    end
    
end
dist_matrix = rescale(dist_matrix);








end


