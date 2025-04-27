%% 
clear all
close all
clc

%% Esempio 1
load ('Data_example1.mat');
% Maximal_force: vettore che contiene le forze massimali [kg] di 54 soggetti. 
% I primi 54 campioni sono ottenuti con la mano dominante, mentre i successivi
% 54 campioni sono ottenuti dalla mano non dominante


%% Visualizzazione preliminare dei dati
figure
histogram(Maximal_Force);

%% I dati provengono da una distribuzione Gaussiana?
[H,p] = lillietest(Maximal_Force) 

%% Visualizzare i Dati
figure;
boxplot(Maximal_Force, Group);
ylabel('Maximal Force [kg]');

%% Scegliere il test opportuno e formulare H0
Maximal_Force_D=Maximal_Force(strcmp(Group,'Dominant')==1);
Maximal_Force_ND=Maximal_Force(strcmp(Group,'NDominant')==1);
[p1,H1] = signrank(Maximal_Force_D,Maximal_Force_ND)

%H0: Non c'è differenza nella forza massimale tra la mano dominante e la mano non dominante.