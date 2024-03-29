%  (31-May-2022)
% Preprocess and Loop on subjects 
clear
Subject = [1:7,9:50];

for iSubject = 1:length(Subject)
SubjectNames = {['sub',num2str(Subject(iSubject))]};
RawFiles = {['E:\Sustained attention\Baseline\Data\EEG\sub',num2str(Subject(iSubject)),'.cdt']};
 
% Input files
sFiles = [];
% Start a new report
bst_report('Start', sFiles);

% Process: Create link to raw file
sFiles = bst_process('CallProcess', 'process_import_data_raw', sFiles, [], ...
    'subjectname',    SubjectNames{1}, ...
    'datafile',       {RawFiles{1},'EEG-CURRY'}, ...
    'channelreplace', 0, ...
    'channelalign',   0, ...
    'evtmode',        'value');

% Process: DC offset correction: [All file]
sFiles = bst_process('CallProcess', 'process_baseline', sFiles, [], ...
    'baseline',    [], ...
    'sensortypes', 'MEG, EEG', ...
    'method',      'bl', ...  % DC offset correction:    x_std = x - &mu;
    'read_all',    0);

% Process: Resample: 256Hz
sFiles = bst_process('CallProcess', 'process_resample', sFiles, [], ...
    'freq',     256, ...
    'read_all', 1);

% Process: Re-reference EEG
sFiles = bst_process('CallProcess', 'process_eegref', sFiles, [], ...
    'eegref',      'M1;M2', ...
    'sensortypes', 'EEG');

% Process: Band-pass:0.1Hz-40Hz
sFiles = bst_process('CallProcess', 'process_bandpass', sFiles, [], ...
    'sensortypes', 'EEG', ...
    'highpass',    0.1, ...
    'lowpass',     40, ...
    'tranband',    0, ...
    'attenuation', 'strict', ...  % 60dB
    'ver',         '2019', ...  % 2019
    'mirror',      0, ...
    'read_all',    1);

% Save and display report
ReportFile = bst_report('Save', sFiles);
bst_report('Open', ReportFile);
% bst_report('Export', ReportFile, ExportDir);
end
