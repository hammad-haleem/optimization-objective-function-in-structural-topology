function modality_text = getModalityText(modality_code)
    % Converting modality code to text
    if modality_code == 1
        modality_text = 'Unimodal';
    elseif modality_code == 0
        modality_text = 'Monotonic';
    else
        modality_text = 'Multimodal';
    end
end