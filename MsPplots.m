function MsPplots(X,scales,scstep,nrow,ncol,save)

%MSP function creates an ensemble of Poincar? Plots, one for each
%coarse grained time series
%
%MSP function requires dscatter.m and CoarseGrain.m functions.
%
%MSP was tested on Matlab_R2010b and Matlab_R2014b
%
%input:
        %X - a time series vector with one column.
        %scales - the number of time scales. (integer; default: 12)
        %scstep - Poicare plots from 1 to scale by scstep. (integer - default: 1)
        %nrow - number of rows in the plot montage. (integer; default: 3)
        %ncol - number of columns in the plot montage. (integer; default: 4)
%save - True (default: 1) if you want to save figure as Figure1.jpg
%


%% Copyright (C) 2016 Teresa Henriques (teresa.henriques@wyss.harvard.edu)
% and A Burykin (burykin@gmail.com)

% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% any later version.

% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.
 

if (~isvector(X) || ~isnumeric(X)) %verify if X is a numeric vector
   msg = 'X must be a numeric vector';
   error(msg);
end
        
if (nargin<2 || isempty (scales)) %define default number of scales
    scales=12;
end

if (nargin<3 || isempty (scstep)) %define default scale step
    scstep=1;
end

S0=1:scstep:scales;

if (nargin<4 || isempty (nrow)) %define default number of rows
    nrow=3;
end

if (nargin<5 || isempty (ncol)) %define default number of columns
    ncol=4;
end

if (nargin<6 || isempty (save)) %define save default
    save=1;
end


if(~isnumeric(scales) || mod(scales,1) ~= 0)
       msg = 'scales must be an integer';
   error(msg);
end

if(~isnumeric(scstep) || mod(scstep,1) ~= 0)
       msg = 'scales step must be an integer';
   error(msg);
end

if(~isnumeric(nrow) || mod(nrow,1) ~= 0)
       msg = 'number of rows must be an integer';
   error(msg);
end

if(~isnumeric(ncol) || mod(ncol,1) ~= 0)
       msg = 'number of columns must be an integer';
   error(msg);
end

if (size(X,1)==1) %transform X as a row in a one column.
    X=X';
end

if (save ~= 0 && save ~=1)
   msg1 = 'Save must be 1 if you want to save the final figure or 0 if you do NOT want to save final figure';
   error(msg1);
end

if (nrow*ncol<length(S0))
   msg1 = 'Adjust the number of plots by number of rows and columns to be display';
   error(msg1);
end

scrsz = get(0,'ScreenSize'); % get screen size

if (save == 0)
    fig1 = figure('Position',[0.05*scrsz(3) 0.05*scrsz(4) 0.7*scrsz(3) 0.9*scrsz(4)]);
    colormap(jet)
end
if (save == 1)
    fig1=figure('Position',[0.05*scrsz(3) 0.05*scrsz(4) 0.7*scrsz(3) 0.9*scrsz(4)],'Color',[1 1 1],'PaperSize',[11 8.5],'PaperPosition', [-0.5 0 12.5 8.5]);
    colormap(jet)
end

set(0,'DefaultAxesFontName', 'Times New Roman')
set(0,'DefaultAxesFontSize', 14)

Xmin = floor(min(X)*10)/10-0.05; %Plot limits (min)
Xmax = ceil(max(X)*10)/10+0.05; %Plot limits (max)
Xstep = round((Xmax-Xmin)/5*10)/10;
tick = Xmin:Xstep:Xmax; %Plot ticks position


for sc=1:length(S0)
      
    s=S0(sc);
        
    %CoarseGrain
    ys = CoarseGrain(X,s);
    yp = ys(1:end-1);
    ym = ys(2:end);   
   
    subplot(nrow,ncol,sc)
    dscatter(yp,ym) %scatter plot
    
    ylab = ylabel(strcat('z_{',int2str(s),'}(i+1)'),'FontWeight','bold'); % y-axis label
    set(ylab,'FontName', 'Times New Roman','FontSize', 18,'Units', 'Normalized', 'Position', [-0.18, 0.5, 0]);
    xlab = xlabel(strcat('z_{',int2str(s),'}(i)'),'FontWeight','bold'); % x-axis label
    set(xlab,'FontName', 'Times New Roman','FontSize', 18,'Units', 'Normalized', 'Position', [0.5, -0.15, 0]);

    axis([Xmin Xmax Xmin Xmax])
    set(gca,'XTick',tick,'XMinorTick' , 'on','FontName', 'Times New Roman','FontSize', 14) 
    set(gca,'YTick',tick,'YMinorTick' , 'on','FontName', 'Times New Roman','FontSize', 14)    
    grid on  
   
   if (sc==length(S0))
       pos = get(gca,'Position');
       colorbar('Location','manual','Units', 'Normalized', 'Position', [pos(1)+pos(3)+0.005 pos(2) 0.03 pos(4)])
   end
   
end
 if (save == 1)
    saveas(fig1, 'Figure1', 'jpg'); %save figure as Figure1.jpg
 end
end

function y_s=CoarseGrain(x,s)
%Creates Coarse Grain time series for scale s by averaging s consecutive
%non-overlapping data points

L = length(x); % length of original time series
Jmax = fix(L/s); %length of the Coarse Grain time series for scale s
y_s = zeros(Jmax,1);

    for j = 1:Jmax

        ind1 = (j-1)*s+1;
        ind2 = j*s;
        y_s(j) = mean(x(ind1:ind2)); %average of s consecutive data points on non-overlapping windows.

    end

end
