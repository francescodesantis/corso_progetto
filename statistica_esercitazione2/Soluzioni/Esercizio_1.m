clear all
close all
clc
%%
load('Data_example4.mat');
% Dati di persone sottoposte a dieta. WeightLoss: kg persi a valle della dieta
% 3 tipi di dieta (Diet: 1,2,3),gender (0:F, 1:M)
%% Visualizzazione preliminare dei dati
figure
histogram(WeightLoss);
% Test di Normalità
[H,p] = lillietest(WeightLoss);
%% Visualizzare i Dati
mean_diet1F=mean(WeightLoss(Diet==1 & gender==0)); 
mean_diet1M=mean(WeightLoss(Diet==1 & gender==1)); 
mean_diet2F=mean(WeightLoss(Diet==2 & gender==0)); 
mean_diet2M=mean(WeightLoss(Diet==2 & gender==1));
mean_diet3F=mean(WeightLoss(Diet==3 & gender==0)); 
mean_diet3M=mean(WeightLoss(Diet==3 & gender==1));

std_diet1F=std(WeightLoss(Diet==1 & gender==0)); 
std_diet1M=std(WeightLoss(Diet==1 & gender==1)); 
std_diet2F=std(WeightLoss(Diet==2 & gender==0)); 
std_diet2M=std(WeightLoss(Diet==2 & gender==1));
std_diet3F=std(WeightLoss(Diet==3 & gender==0)); 
std_diet3M=std(WeightLoss(Diet==3 & gender==1));

figure;
errorbar([1,2,3],[mean_diet1F,mean_diet2F,mean_diet3F],[std_diet1F,std_diet2F,std_diet3F],'mo-','LineWidth',1.5); 
hold on;
errorbar([1.2,2.2,3.3],[mean_diet1M,mean_diet2M,mean_diet3M],[std_diet1M,std_diet2M,std_diet3M],'bo-','LineWidth',1.5); 
xticks([1.1,2.1,3.1]); xticklabels({'Diet1','Diet2','Diet3'});
ylabel('Weight Loss [kg]'); xlim([0.5 3.8]); legend('F','M');

%% Scegliere il test opportuno e prendere una decisione su H0 
[p_anovan,~,stats]=anovan(WeightLoss,{Diet,gender},'model','interaction','varname',{'Diet','Gender'});

% Post-hoc con correzione di Bonferroni
figure
[c,~,~,gnames] = multcompare(stats,'CType','bonferroni');
[gnames(c(:,1)), gnames(c(:,2)), num2cell(c(:,3:6))] 

%% Post-hoc con correzione di Bonferroni + Interazione (in MATLAB2018b)
%DIMENSION PERMETTE DI MODIFICARE I FATTORI VALUTATI:
%Dimension = 1: multcompare valuta gli effetti del fattore 1
figure
[c,~,~,gnames] = multcompare(stats, 'Dimension', 1,'CType','bonferroni');
[gnames(c(:,1)), gnames(c(:,2)), num2cell(c(:,3:6))];
title('Diet Effect')
%Dimension = 2: multcompare valuta gli effetti del fattore 2
figure
[c,~,~,gnames] = multcompare(stats, 'Dimension', 2,'CType','bonferroni');
[gnames(c(:,1)), gnames(c(:,2)), num2cell(c(:,3:6))];
title('Gender Effect')
%Dimension = [1 2]: multcompare valuta gli effetti dell'interazione tra i
%fattori 1 e 2 
figure
[c,~,~,gnames] = multcompare(stats, 'Dimension', [1 2],'CType','bonferroni');
[gnames(c(:,1)), gnames(c(:,2)), num2cell(c(:,3:6))];
title('Diet x Gender Interaction')
