clear all
close all
clc

%% Esempio 5a
load ('Data_example5.mat');

%% Visualizzazione preliminare dei dati
subplot (1,2,1)
histogram(TMTa);
subplot (1,2,2)
histogram(MMSE);

%% I dati provengono da una distribuzione Gaussiana?


[H1,p1] = lillietest(TMTa); 
[H2,p2] = lillietest(MMSE); 

% Rappresento i dati: scatter
figure;
scatter(MMSE, TMTa);
xlabel('MMSE'); ylabel('TMTa [s]');

% Studio la correlazione tramite la funzione corr
[RHO,PVAL] = corr([MMSE,TMTa],'type','Pearson' );
%% Esempio 5b
% Trovare i coefficienti della retta di regressione tra MMSE e TMTa
N=1; %retta
P = polyfit(MMSE,TMTa,N); 
% Predire i valori di TMTa, tramite P
TMTa_stimato= polyval(P,MMSE); 

% Rappresentare la retta di regressione
figure;
scatter(MMSE, TMTa); hold on;
plot(MMSE,TMTa_stimato,'r');
xlabel('MMSE'); ylabel('TMTa [s]');

% Calcolare il coefficiente di determinazione
Rsq2 = sum((TMTa_stimato - mean(TMTa)).^2)/sum((TMTa - mean(TMTa)).^2);