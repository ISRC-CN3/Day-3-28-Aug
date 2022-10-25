clearvars

%% Constants
channels = {'FC3', 'FCz', 'FC4', 'C5', 'C3', 'C1', 'Cz', 'C2', 'C4', ...
    'C6', 'CP3', 'CPz', 'CP4', 'P3', 'Pz', 'P4'};
subject_id = {'15', '16', '17', '18'};
sample_rate = 256;
no_trials = 96;
no_electrodes = length(channels);
epoch_length = sample_rate * 6;
pre_cue = sample_rate * 1;
%% Load the eeg data and their corresponding labels   
load('labels.mat')
disp(['Labels = ',num2str(size(labels,2))])
for sIdx=1:numel(subject_id)
    load (['Subject',subject_id{sIdx},'.mat'])
    epochs{sIdx}=permute(EEGEpoch,[3 2 1]);
    correctness{sIdx}=labels(sIdx).y;
    disp([num2str(size(epochs{sIdx})),num2str(size(correctness{sIdx})),...
        '   ',num2str(mean(mean(mean(epochs{sIdx}))))])
end