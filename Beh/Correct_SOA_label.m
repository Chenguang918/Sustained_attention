% 计算PAC的值
clear
Subject = [1:50]; 

for iSubject = 1:length(Subject)
fidnew =[];
SubjectNames = ['FlyStim6_sub',num2str(Subject(iSubject))];
fileFolder_add =[SubjectNames,'_1_'];
fileFolder = fullfile(['E:\Sustained attention\Baseline\Data\Beh\',fileFolder_add]);
%%
dirOutput = dir(fullfile([fileFolder,'*.mat']));
fileNames = {dirOutput.name};
loadpath =['E:\Sustained attention\Baseline\Data\Beh\',fileNames{1}];
load(loadpath);
fidnew.SOA=fidnew.BlockTRespOnset;
fidnew.SOA=fidnew.BlockTRespOnset(:,2:end)-fidnew.BlockTRespOnset(:,1:end-1)-0.24-fidnew.BlockRespRT(:,2:end); 
fidnew.SOA_10Hz=roundn(fidnew.SOA,-1);
save([fileFolder,'correct.mat'])
end