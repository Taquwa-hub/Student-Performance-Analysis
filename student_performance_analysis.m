clc;
clear;
close all;

%upload file
filename="StudentsPerformance.csv"; %filename

if isfile(filename)
    data=readtable(filename);
else
    error('Dataset not found. Make sure %s is in the current folder.', filename)
end

%% Display few rows data
disp("first 5 rows of the dataset;");
disp(data(1:5,:));

%%%% Columns of interest (mathScore    readingScore    writingScore)

scores={'mathScore',   'readingScore',    'writingScore'};           %%%Table variable names


for i= 1:length(scores)
    col= scores{i};
    vec=data.(col);        %%% Access table Column correctly

    mean_val=mean(vec);
    median_val=median(vec);
    std_val=std(vec);

%%%% Visualization  %%Histrogram   %%boxplots

%Histrogram
 
figure('Name', col, 'NumberTitle', 'off')

subplot(1,2,1);
h=histogram(vec);
title([col '  Histogram']);
xlabel('Score');
ylabel('Count');


%%Box Plot
subplot(1,2,2);
b=boxplot(vec);
title([col '   Box Plot'])


%%%%%%%%Display Results

fprintf('\nStatistics for %s:\n', col)
fprintf('Mean: %.2f\n', mean_val)
fprintf('Median: %.2f\n', median_val)
fprintf('standard Deviation: %2f\n', std_val)

end