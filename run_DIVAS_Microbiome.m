jack_path = genpath('/Users/emmamitchell/Desktop/Workspace/DIVAS2021/DJIVECode');
data_path = genpath('/Users/emmamitchell/Desktop/Workspace/Data');
addpath(jack_path)
addpath(data_path)

load('MicroBiome_subset_all.mat')

out = DJIVEMainJP(data_blocks, paramstruct) ;

DJIVEAngleDiagnosticJP(data_blocks, data_names, out, 556, "MicroBiome")

save('BacteriaStruct.mat', 'out')