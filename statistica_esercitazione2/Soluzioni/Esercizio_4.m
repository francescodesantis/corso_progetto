clear all
close all
clc

load ('Data_example7.mat');
addpath('BlandAltman');

% Bland-Altman Plot
BlandAltman(Stride_time_solette,Stride_time_tappeto,{'StrideTime Solette','StrideTime Tappeto'});
