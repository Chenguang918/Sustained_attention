clear
load('E:\Sustained attention\bd_data\Baseline\data\sub1\@rawsub1_bl_resample_band\data_0raw_sub1_bl_resample_band.mat')
evt1_t = F.events(45).times; % 81
evt2_t = F.events(46).times; % 82
evt3_t = F.events(47).times; % 83
evt4_t = F.events(48).times; % 84
evt5_t = F.events(49).times; % 85
evt6_t = F.events(50).times; % 86
res1_t = F.events(137).times;% 249
res2_t = F.events(138).times;% 250
res3_t = F.events(139).times;% 251
marker_serial(1,:) = [evt1_t evt2_t evt3_t evt4_t evt5_t evt6_t res1_t res2_t res3_t];

evt1 = 81*F.events(45).epochs; % 81
evt2 = 82*F.events(46).epochs; % 82
evt3 = 83*F.events(47).epochs; % 83
evt4 = 84*F.events(48).epochs; % 84
evt5 = 85*F.events(49).epochs; % 85
evt6 = 86*F.events(50).epochs; % 86
res1 = 249*F.events(137).epochs;% 249
res2 = 250*F.events(138).epochs;% 250
res3 = 251*F.events(139).epochs;% 251
marker_serial(2,:) = [evt1 evt2 evt3 evt4 evt5 evt6 res1 res2 res3];

% if length(time_serial)~= length(marker_serial)
%     error('Dismatch between event and time')
% end
load('E:\Sustained attention\Baseline\Data\Beh\Correct\FlyStim6_sub1_1_correct.mat')
event_all=sortrows(marker_serial');
resp_onset=event_all(2:2:end-1,1);
sti_onset=event_all(3:2:end,1);
SOA = sti_onset-resp_onset-0.4;
for i=2:6
   SOA(1+172*(i-1))=[];
end
beh_SOA=[fidnew.SOA(1,:) fidnew.SOA(2,:) fidnew.SOA(3,:) fidnew.SOA(4,:) fidnew.SOA(5,:) fidnew.SOA(6,:)];
beh_SOA_10Hz=[fidnew.SOA_10Hz(1,:) fidnew.SOA_10Hz(2,:) fidnew.SOA_10Hz(3,:) fidnew.SOA_10Hz(4,:) fidnew.SOA_10Hz(5,:) fidnew.SOA_10Hz(6,:)];
SOA_10Hz = roundn(SOA,-1);
figure
plot(beh_SOA',SOA,'*')
hold on 
plot([0 1 2 3 4 5 6 7 8],[0 1 2 3 4 5 6 7 8])
axis([0 8 0 8])

figure
plot(beh_SOA_10Hz',SOA_10Hz,'*')
hold on 
plot([0 1 2 3 4 5 6 7 8],[0 1 2 3 4 5 6 7 8])
axis([0 8 0 8])

SOA_all(1,:) = beh_SOA;
SOA_all(2,:) = SOA';
SOA_all(3,:) = SOA_all(1,:)- SOA_all(2,:);