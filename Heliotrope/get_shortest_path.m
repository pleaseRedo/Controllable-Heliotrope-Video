function [minx,miny,mindisp,mincoord] = get_shortest_path(path,flows_a,cur_coord,next_coord)

% This function will find out the shortest path between cur_coord and
% next_coord

% path : path from source image to others.
% cur_coord : current pixel location -- user input
% next_coord : next pixel location

coord_for_all_frames = zeros(size(path,2),2);

for i = 1 : size(path,2)
    
    cur_path = path{i}; % Routes from source to other nodes. e.g.[3,1] 
    coord = round(cur_coord);
    coord_displacement = double(coord);
    for j = 1:size(cur_path,2)-1 %Iterate through every nodes for each path 
        % vx for vertical flow , vy for horizontal
        % For user input, x is horizontal mouse movement, y is vertical
        % movement, don't get confused.
        frame_i = cur_path(j);
        frame_j = cur_path(j+1); 
        [vx,vy] = compute_flow_location(frame_i,frame_j,flows_a);
        coord_displacement  = coord_displacement + [vy(coord(1),coord(2)),vx(coord(1),coord(2))];
       
    end
    coord_for_all_frames(i,:) = coord_displacement;
end

% Make it to 72x2 
next_coord_for_all_frames = repmat(next_coord,size(path,2),1);
% diff_dispandnext_temp = abs(coord_for_all_frames - next_coord_for_all_frames);
% diff_dispandnext = sum(diff_dispandnext_temp,2);

diff_dispandnext_temp = (coord_for_all_frames - next_coord_for_all_frames).^2;
diff_dispandnext = sqrt(sum(diff_dispandnext_temp,2));

[mindisp,mincoord] = min(diff_dispandnext);
minx= coord_for_all_frames(mincoord,2);
miny= coord_for_all_frames(mincoord,1);






end

