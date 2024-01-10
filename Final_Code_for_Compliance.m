data = load('x_variables.mat');
final_x = data.x;
x_org = final_x;
x_itr = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0];
total_cases = 0;
unimodal_count = 0;
monotonic_count = 0;
multimodal_count = 0;
for row_no = 1:32
    for col_no = 1:100
        figure;
        c_itr = zeros(1, length(x_itr));
        x_values = zeros(1, length(x_itr));
        c_values = zeros(1, length(x_itr));
        for i = 1:length(x_itr)
            final_x(row_no, col_no) = x_itr(i);
            c = Compliance_Calculator(final_x);
            c_itr(i) = c;
            x_values(i) = x_itr(i);
            c_values(i) = c;
        end      
        final_x(row_no, col_no) = x_org(row_no, col_no);
        modality_code = modalityChecker(c_itr);
        % Score each case based on modality
        switch modality_code
            case 0 % Monotonic
                monotonic_count = monotonic_count + 1;
            case 1 % Unimodal
                unimodal_count = unimodal_count + 1;
            case 2 % Multimodal
                multimodal_count = multimodal_count + 1;
        end
        total_cases = total_cases + 1;
        % Scatter plot
        scatter(x_values, c_values, 'Marker', 'o', 'MarkerFaceColor', 'blue', 'MarkerEdgeColor', 'blue');
        hold on;
        % Line plot
        plot(x_values, c_values, 'LineWidth', 2);
        title(['Compliance vs. x for Row ' num2str(row_no) ', Col ' num2str(col_no) ' (' getModalityText(modality_code) ')'])
        xlabel('x')
        ylabel('Compliance')
        legend('Scatter Plot', 'Line Plot', 'Location', 'Best', 'FontSize', 10, 'FontWeight', 'bold', 'TextColor', 'blue')
        hold off;
    end
end
% Calculate percentages
unimodal_percentage = (unimodal_count / total_cases) * 100;
monotonic_percentage = (monotonic_count / total_cases) * 100;
multimodal_percentage = (multimodal_count / total_cases) * 100;
% Display results
disp(['Percentage of Unimodal Cases: ' num2str(unimodal_percentage) '%']);
disp(['Percentage of Monotonic Cases: ' num2str(monotonic_percentage) '%']);
disp(['Percentage of Multimodal Cases: ' num2str(multimodal_percentage) '%']);
