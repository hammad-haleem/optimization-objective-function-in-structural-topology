function result = isMonotonic(c_values)
    % Check if the array is strictly increasing and then strictly decreasing
    increasing = all(diff(c_values) > 0);
    decreasing = all(diff(c_values) < 0);

    result = (increasing || decreasing);
end
