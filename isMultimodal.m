
function result = isMultimodal(c_values)
   
result = (nnz(diff(sign(diff(c_values)))) > 1);
% Check if the array is multimodal (neither strictly increasing nor strictly decreasing)
    % increasing = any(diff(c_values) > 0);
    % decreasing = any(diff(c_values) < 0);
    % 
    % result = (increasing && decreasing);
end
