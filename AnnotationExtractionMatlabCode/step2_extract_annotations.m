clc;clear;
% poolobj = gcp('nocreate');
% delete(poolobj);

root = '/home/azamhamidinekoo/Documents/dataset/';


%  training_numbers = {'2514_RMS.czi','2250_RMS.czi','2542_RMS.czi','3503_RMS.czi'};
training_numbers = {'2401_RMS.czi'};
% training_numbers = {'2400_RMS.czi','2403_RMS.czi','2247_RMS.czi','3509_RMS.czi','2519_RMS.czi','2504_RMS.czi'};
 
%     '2400_RMS.czi','3509_RMS.czi','2519_RMS.czi','2403_RMS.czi',...
%     '2542_RMS.czi','2247_RMS.czi'};
% training_numbers = {'2216_RMS.czi','2504_RMS.czi','2390_RMS.czi','3503_RMS.czi'};
% ----------------------------------------------------------------------------------
% testing_numbers = {'2841_RMS.czi','2832_RMS.czi','2523_RMS.czi','2831_RMS.czi',...
% '2517_RMS.czi','2401_RMS.czi','3498_RMS.czi',};

samples = training_numbers;
set ='10x';
%parpool()

resolution = 2;
tileSize = [1000 1000];

for i = 1:length(samples)
    tr_num = samples{i}
    
    ImagePath  =[root,'RMS-dataset/raw/',strrep(tr_num,'_',' ')];
    AnnoPath = [root , 'PolyscopeSDK/downloadedAnnotations/',tr_num,'.txt'];
    PatchPath = [root,'RMS-dataset/Annotations/vasculature/',set,'/',tr_num,'/'];
    
    %         LabelMap = containers.Map('#ffff00','YellowLabels');
    LabelMap = containers.Map({'#00ff00','#00ffff','#0000ff','#000080'},{'lumen','wall','box1','box2'});
%     LabelMap = containers.Map({'#00ff00'},{'lumen'});
    
    ExtractTilesPolyscope_all_resolutions(ImagePath, AnnoPath, PatchPath, LabelMap,tileSize, resolution)
%     ExtractTilesPolyscope_20x(ImagePath, AnnoPath, PatchPath, LabelMap,tileSize, resolution)
end
   

