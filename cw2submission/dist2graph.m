function [output] = dist2graph(vid,dist_matrix,src_idx,num_pts,xi,yi,flows_a)
% This function will convert the distance matrix to graph and
% Find the shortes path based on user input
%  vid : inpute image sequence
%  dist_matrix : distance matrix
%  src_idx : index of the source image
%  num_pts : number of points to draw
%  xi,yi : track of path which is the user input
%  flows_a : computed optical flow.

 [~,~,~,frame_num] = size(vid);
temp =dist_matrix;




dist_mat_new = temp;
dist_mat_new = sparse(dist_mat_new);
%[dist1,path1,pred1] = graphshortestpath(dist_mat_new, src_idx);
[dist2,path2,pred2] = graphshortestpath(dist_mat_new, src_idx);

temp_sparse = dist_matrix;
%threshold = mean(dist_matrix);
%temp_sparse(dist_matrix>threshold)=0;

[dist,path,pred] = graphshortestpath(sparse(temp_sparse), src_idx);


%% Comuting shortest path
fprintf('Comuting shortest path');


real_coord = zeros(num_pts,2);
real_coord(1,:) = [xi(1),yi(1)];
best_path = cell(size(num_pts,2),1);
for i  = 1:num_pts-1
    
[minx,miny,mindisp,mincoord] = get_shortest_path(path,flows_a,[yi(i),xi(i)],[yi(i+1),xi(i+1)]);



real_coord(i+1,:) =  [minx,miny];
best_path{i} = path{mincoord};
[dist,path,pred] = graphshortestpath(sparse(dist_matrix), mincoord);

end    
figure,imshow(vid(:,:,:,src_idx));
hold on
plot(real_coord(:,1), real_coord(:,2), 'o-');
plot(xi(:), yi(:), 'ro-');
%plot(xi(:), yi(:), 'ro-');
hold off;


%% Render path to image sequence
fprintf('Render path to image sequence');


output = path2sequence(best_path);

% figure;
% for i=1:size(output,2)
%     imshow(vid(:,:,:,output(i)));
%     
%     [A,map] = rgb2ind(vid(:,:,:,output(i)),256);    
%       if i == 1 
%           imwrite(A,map,'result.gif','gif', 'Loopcount',inf); 
%       else 
%           imwrite(A,map,'result.gif','gif','WriteMode','append'); 
%       end 
%     pause(0.5);
% end
% 
% 
% 
% fprintf('Done\n')







end

