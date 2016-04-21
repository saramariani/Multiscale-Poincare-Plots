% Multiscale Poincare Plot Matlab Function Example 2:
%
% Copyright (C) 2016 Teresa Henriques (teresa.henriques@wyss.harvard.edu)
 
clc
close all
clear all

%import file n2-filter. This is the RR time series from the healthy subject used in the paper.
rr = importdata('n2-filtered');

% Multiscale Poincare Plot for scales 1 to 9 by 1 (defaults)
% ploting 3 rows by 3 columns
% saving the figure as Figure1.jpg
MsPplots(rr(:,2),9,1,3,3) 

