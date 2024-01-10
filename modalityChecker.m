function modality_code = modalityChecker(c_values)
   % Check for Unimodal
    if isUnimodal(c_values)
        modality_code = 1; % Unimodal
    % Check for Monotonic
    elseif isMonotonic(c_values)
        modality_code = 0; % Monotonic
    % Check for Multimodal
    else
        modality_code = 2; % Multimodal
    end
end