
% There will be a choice to pop up choosing OWN data or not.
data_choice = input('Using Given data or Own data? (1->Given, 0->Own): ','s');
if data_choice =='1'
    vid_fullsize = load_sequence_color('gjbLookAtTargets','gjbLookAtTarget_', 0, 71, 4, 'jpg');

    %load('flows.mat');
else
    vid_fullsize = load_sequence_color('ownData','cap',1,30,4,'JPG');
end


% 
% impath='gjbLookAtTargets';
% prefix = 'gjbLookAtTarget_';
% first =0;
% last = 71;
% digits =4;
% suffix = 'jpg';
%vid_fullsize = load_sequence_color('gjbLookAtTargets','gjbLookAtTarget_', 0, 71, 4, 'jpg');






%output = double(vid);
[~,~,~,frame_num] = size(vid_fullsize);
% Downscale image by 30 percents.

first_frame = imresize(vid_fullsize(:,:,:,1),0.3);
[height,width,~] = size(first_frame);
vid = zeros(height,width,3,frame_num);
for i = 1:frame_num
   vid(:,:,:,i) =  imresize(vid_fullsize(:,:,:,i),0.3); 
end
if data_choice =='1'
    if (exist('flows.mat') == 2)
        load('flows.mat');
    else
        fprintf('Compute Optical flow \n');
        flows_a = compute_optical_flow(vid);

    end
    
else
    if (exist('flows_own.mat') == 2)
        load('flows_own.mat');
    else
        fprintf('Compute Optical flow \n');
        flows_a = compute_optical_flow(vid);
    end
end


%dist_matrix = compute_dst_matrix(vid);



% There will be a choice to pop up choosing advanced dis_matrix or not.
adv_1 = input('Enable adv_1(advanced distance matrix computation)? (1->Yes, 0->skip): ','s');
if adv_1 =='1'
    dist_matrix = advanced_1(vid,flows_a);
else
    dist_matrix = compute_dst_matrix(vid);
end



%imshow(dist_matrix)

src_idx = input('Please Enter the Index of source image:');

num_pts = input('Please Enter the Number of points to draw (minimum 5):');



imshow(vid(:,:,:,src_idx)),title('Draw path, hit ENTER for finish, DELETE for redraw');
drawing = 1;
while (drawing == 1)
    
    fig = gcf;
    [xi,yi] = getline(fig);
    num_pts = size(xi,1);
    if(num_pts >4)
        
       drawing = 0;        
    else 
        imshow(vid(:,:,:,src_idx)),title('Please draw aleast 5 pivot points');
    end
    
end

output = dist2graph(vid,dist_matrix,src_idx,num_pts,xi,yi,flows_a);
figure;
for i=1:size(output,2)
    imshow(vid(:,:,:,output(i)));
    
    [A,map] = rgb2ind(vid(:,:,:,output(i)),256);    
      if i == 1 
          imwrite(A,map,'result.gif','gif', 'Loopcount',inf); 
      else 
          imwrite(A,map,'result.gif','gif','WriteMode','append'); 
      end 
    pause(0.5);
end

