data_path = genpath('/Users/emmamitchell/Desktop/Workspace/Data');
addpath(data_path)

% Specify the name and location of the Excel file
filename_1 = 'Data_patient_info_AGE_GENDER.csv';
filename_2 = 'Data_tumor_info_final.csv';
filename_3 = 'Subset_Bacteria_Counts.csv';

% Read the data from the Excel file into a table
patient_info_matrix = readmatrix(filename_1);
tumor_info_matrix = readmatrix(filename_2);
bacteria_count_matrix_1 = readmatrix(filename_3);

% Selecting the correct rows and columns of my data
patient_info_matrix = (patient_info_matrix(2:51,3:4))';
tumor_info_matrix = (tumor_info_matrix(2:51,3:6))';
bacteria_count_matrix_1 = (bacteria_count_matrix_1(:,2:5397))';

% Visualizing my first data block. Since my data was very skewed, I log
% transformed it. DIVAS is also very sensitive to 
% some bacteria species having substantially different counts than others in the gut so
% the MatCenterJP centers and scales both the traits (bacteria type) and objects (patients) for me.
bacteria_count_matrix_log = log(bacteria_count_matrix_1+1);
bacteria_count_matrix_log_center= MatCenterJP(bacteria_count_matrix_log,1,1);
HeatmapVisualJP(bacteria_count_matrix_log_center)

% Visualizing the other two data blocks
HeatmapVisualJP(patient_info_matrix)
HeatmapVisualJP(tumor_info_matrix)

% Data block names 
data_names = {'bacteria counts','Patient Info','Tumor Info'};

% Data Block all together
data_blocks = {bacteria_count_matrix_log_center,patient_info_matrix,tumor_info_matrix};

% Final DIVAS ready data frame
save('MicroBiome_subset_all.mat', 'data_names','data_blocks')
