function [output] = path2sequence(best_path)
% This function will generate a sequence output in a 1D vector.
counter = 1;
for i = 1:size(best_path,2)
    for j = 2:size(best_path{i},2)
        output_seq(counter) = best_path{i}(j);
        counter = counter + 1;
    end
end

output = [best_path{1}(1) output_seq];
 end



