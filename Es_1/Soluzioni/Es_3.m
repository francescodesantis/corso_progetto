clear all
close all
clc

%%
%Esempio 3
load('Data_example3.mat');
% The data are from a study of the strength of structural beams in Hogg
% (1987). The vector strength measures deflections of beams in thousandths
% of an inch under 3000 pounds of force. The vector alloy identifies each
% beam as steel (|st|), alloy 1 (|al1|), or alloy 2 (|al2|).

%% Visualizzazione preliminare dei dati
figure
histogram(strength);

%% Test di Normalità
[H,p] = lillietest(strength);

%% Visualizzare i Dati
mean_st=mean(strength(strcmp(alloy,'st')==1));
mean_al1=mean(strength(strcmp(alloy,'al1')==1));
mean_al2=mean(strength(strcmp(alloy,'al2')==1));
dev_st=std(strength(strcmp(alloy,'st')==1));
dev_al1=std(strength(strcmp(alloy,'al1')==1));
dev_al2=std(strength(strcmp(alloy,'al2')==1));

figure;
bar([1,2,3],[mean_st,mean_al1,mean_al2],'FaceColor',[0.7 0.7 0.7]); hold on;
errorbar([1,2,3],[mean_st,mean_al1,mean_al2],[dev_st,dev_al1,dev_al2],'sr','MarkerFaceColor','r');
xticklabels({'Steel','Alloy1','Alloy2'});
ylabel('Deflection [in/1000]');

%% Scegliere il test opportuno e formulare H0
[p3,~,stats] = anova1(strength,alloy);

%H0: Non c'è differenza significativa nella flessione di una trave a parità di 
%forza impressa tra le tre diverse leghe.
%% Post-hoc con correzione di Bonferroni
[c,~,~,gnames] = multcompare(stats,'CType','bonferroni');
[gnames(c(:,1)), gnames(c(:,2)), num2cell(c(:,3:6))] 

