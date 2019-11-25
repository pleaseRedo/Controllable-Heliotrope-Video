function [flow] = compute_optical_flow(vid)
% Compute the optical flows.
%I did a bit of resarch and I found the usage of Coarse2FineTwoFrames files in
% https://people.csail.mit.edu/celiu/OpticalFlow/
%

[height,width,~,frame_num] = size(vid);
total = height*width;
flow_num = (frame_num-1) *frame_num /2;
flow = zeros(height, width,2,flow_num);

flow_counter = 1;
for i = 2:frame_num
    i
   for j = 1:i-1
       im_i = vid(:,:,:,i);
       %im_j = vid(:,:,:,i-1);
       im_j = vid(:,:,:,j);
       [vx,vy,warp] = Coarse2FineTwoFrames(im_i, im_j);
       flow(:,:,1,flow_counter) = vx;
       flow(:,:,2,flow_counter) = vy;
       flow_counter = flow_counter + 1;
       
       
   end
    
    
    
end

end

