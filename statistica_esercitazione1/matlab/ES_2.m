%%
clear all
close all
clc
%%
%Esempio 2
load ('Data_example2.mat');
% TMTa: vettore che contiene il tempo di esecuzione [s] di un 
% test neuropsicologico di 23 pazienti
% (classificati come ‘Dementia’ o ‘Healthy’). 
% Patients : variabile contente la diagnosi dei 23 pazienti.



%% Visualizzazione preliminare dei dati
figure
histogram(TMTa,5);
%% I dati provengono da una distribuzione Gaussiana?
[H,p] = lillietest(TMTa); 

%% 
TMTa_D=TMTa(strcmp(Patients,'Dementia')==1);
TMTa_sani=TMTa(strcmp(Patients,'Healthy')==1);
mean_d=nanmean(TMTa_D); mean_sani=nanmean(TMTa_sani);
dev_d=nanstd(TMTa_D);   dev_sani=nanstd(TMTa_sani);

%% Visualizzare i Dati
figure;
bar([1,2],[mean_d,mean_sani],'FaceColor',[0 1 0]); hold on;
errorbar([1,2],[mean_d,mean_sani],[dev_d,dev_sani],'sr','MarkerFaceColor','r');
xticklabels({'Dementia','Healthy'});
ylabel('relative TMTa [#/s]');

%% Scegliere il test opportuno e formulare H0
[H2,p2] = ttest2(TMTa_sani,TMTa_D) ;

%H0: Non c'è differenza nel numero di inversioni nella forza esercitata sul foglio durante 
%il disegno tra i pazienti affetti da Parkinson e i soggetti sani.
