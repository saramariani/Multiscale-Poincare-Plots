% Multiscale Poincare Plot Matlab Function Example 1:
% Please note that the wfdb library must be installed
% and in your Matlab path for the example to work
%
% Copyright (C) 2016 Teresa Henriques (teresa.henriques@wyss.harvard.edu)
%
clc
close all
clear all

%load file nsr004 from Normal Sinus Rhythm RR Interval Database
%https://www.physionet.org/physiobank/database/nsr2db/
rr = ann2rr('nsr2db/nsr004','ecg');
freq = 128;
rr = rr/freq;

% Multiscale Poincare Plot for scales 1 to 12 by 1 (defaults)
% ploting 3 rows by 4 columns
% saving the figure as Figure1.jpg
MsPplots(rr) 

% Multiscale Poincare Plot for scales 1 to 32 by 2 
% ploting 4 rows by 4 columns
% without saving the figure
MsPplots(rr,32,2,4,4,0)
