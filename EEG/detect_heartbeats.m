% Script generated by Brainstorm (12-May-2022)
% Detect heartbeats and Loop on subjects 
clear
Subject = [2:50];

for iSubject = 1:length(Subject)
SubjectNames = {['sub',num2str(Subject(iSubject))]};

% Input files
sFiles = strcat(SubjectNames,'/@raw',SubjectNames,'_bl_resample_band/data_0raw_',SubjectNames,'_bl_resample_band.mat');

% Start a new report
bst_report('Start', sFiles);

% Process: Detect heartbeats
sFiles = bst_process('CallProcess', 'process_evt_detect_ecg', sFiles, [], ...
    'channelname', 'EKG', ...
    'timewindow',  [], ...
    'eventname',   'cardiac');

% Save and display report
ReportFile = bst_report('Save', sFiles);
bst_report('Open', ReportFile);
% bst_report('Export', ReportFile, ExportDir);
% bst_report('Email', ReportFile, username, to, subject, isFullReport);
end