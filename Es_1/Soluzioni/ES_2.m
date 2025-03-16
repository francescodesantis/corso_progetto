%%
clear all
close all
clc
%%
%Esempio 2
load ('Data_example2.mat');
% NCP: vettore che contiene il numero relativo di inversioni nella forza esercitata
% sul foglio durante il disegno di una spirale [#/s] da parte di 58 soggetti
% classificati come " PD Patient" o "Healthy". 
% Patients: variabile contente la diagnosi dei 58 soggetti


%% Visualizzazione preliminare dei dati
figure
histogram(NCP);
%% I dati provengono da una distribuzione Gaussiana?
[H,p] = lillietest(NCP); 

%% 
NCP_pd=NCP(strcmp(Patients,'PD Patient')==1);
NCP_sani=NCP(strcmp(Patients,'Healthy')==1);
mean_pd=nanmean(NCP_pd); mean_sani=nanmean(NCP_sani);
dev_pd=nanstd(NCP_pd);   dev_sani=nanstd(NCP_sani);

%% Visualizzare i Dati
figure;
bar([1,2],[mean_pd,mean_sani],'FaceColor',[0 1 0]); hold on;
errorbar([1,2],[mean_pd,mean_sani],[dev_pd,dev_sani],'sr','MarkerFaceColor','r');
xticklabels({'PD Patient','Healthy'});
ylabel('relative NCP [#/s]');

%% Scegliere il test opportuno e formulare H0
[H2,p2] = ttest2(NCP_sani,NCP_pd) ;

%H0: Non c'è differenza nel numero di inversioni nella forza esercitata sul foglio durante 
%il disegno tra i pazienti affetti da Parkinson e i soggetti sani.
