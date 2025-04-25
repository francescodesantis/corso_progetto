clear all
close all
clc

load ('Data_example6.mat');

% I dati provengono da una distribuzione Gaussiana?
[H1,p1] = lillietest(Jankovic); 
[H2,p2] = lillietest(NCA); 

% Rappresento i dati: scatter
figure;
scatter(Jankovic, NCA);
xlabel('Jankovic'); ylabel('relative NCA [#/s]');

% Studio la correlazione tramite la funzione corr
[RHO,PVAL] = corr([Jankovic,NCA],'type','Spearman');