%
% Copyright 2018-2019 University of Padua, Italy
%
% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
%
%     http://www.apache.org/licenses/LICENSE-2.0
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.
%
% Author: Nicola Ferro (ferro@dei.unipd.it)

%select the measure you want to evaluate
selected_measure = 'P10'

if strcmp(selected_measure,'map')
        load('/Users/Ilaria/Documents/Università/InformationRetrival/IR_HW1_GalloIlaria/ANOVA/ap_map.mat');
    else
        if strcmp(selected_measure,'Rprec')
            load('/Users/Ilaria/Documents/Università/InformationRetrival/IR_HW1_GalloIlaria/ANOVA/ap_Rprec.mat');
            else 
            load('/Users/Ilaria/Documents/Università/InformationRetrival/IR_HW1_GalloIlaria/ANOVA/ap_P10.mat');
        end
    end

% the mean for each run across the topics
% Note that if the measure is AP (Average Precision), 
% this is exactly MAP (Mean Average Precision) for each run
m = mean(measure);

% sort in descending order of mean score
[~, idx] = sort(m, 'descend');

% re-order runs by ascending mean of the measure
% needed to have a more nice looking box plot
measure = measure(:, idx);
runID = runID(idx);

% perform the ANOVA
[~, tbl, sts] = anova1(measure, runID, 'off');

% display the ANOVA table
tbl(:,:)

% save the table into a figure
T = table(tbl(:,1), tbl(:,2), tbl(:,3), tbl(:,4), tbl(:,5), tbl(:,6));
RowNames = {'Columns', 'Error', 'Total'};
ColumnNames = {'SS', 'df', 'MS', 'F', 'p-value'};
fig = figure('Name','ANOVAtest');
uitable(fig, 'Data',T{2:4,2:6},'ColumnName',ColumnNames,'RowName',RowNames,'Units', 'Normalized', 'Position',[0 0 0.81 0.25])
figure

if strcmp(selected_measure,'map')
    c = uicontrol(fig,'String', 'ANOVA test results for map', 'Position', [0, 0, 150, 30]);
    print(fig,'-fillpage', '-dpdf', 'ANOVAtest_map.pdf');
    
    else
        if strcmp(selected_measure,'Rprec')
            c = uicontrol(fig,'String', 'ANOVA test results for Rprec', 'Position', [0, 0, 150, 30]);
            print(fig,'-fillpage','-dpdf', 'ANOVAtest_Rprec.pdf');
            else 
            c = uicontrol(fig,'String', 'ANOVA test results for P10', 'Position', [0, 0, 150, 30]);    
            print(fig, '-fillpage','-dpdf', 'ANOVAtest_P10.pdf');
        end
end


% perform
c = multcompare(sts, 'Alpha', 0.05, 'Ctype', 'hsd'); 

% display the multiple comparisons
c

%% plots of the data

% get the Tukey HSD test figure
currentFigure = gcf;

    ax = gca;
    ax.FontSize = 20;
    
    if strcmp(selected_measure,'map')
        ax.XLabel.String = 'Average Precision (AP)';
    else
        if strcmp(selected_measure,'Rprec')
            ax.XLabel.String = 'Precision at the recall base (Rprec)';
            else 
            ax.XLabel.String = 'Precision at 10 (P10)';
        end
    end
        
    ax.YLabel.String = 'Run';

    currentFigure.PaperPositionMode = 'auto';
    currentFigure.PaperUnits = 'centimeters';
    currentFigure.PaperSize = [42 22];
    currentFigure.PaperPosition = [1 1 40 20];

if strcmp(selected_measure,'map')
        print(currentFigure, '-dpdf', 'ap-tukey-map.pdf');
    else
        if strcmp(selected_measure,'Rprec')
            print(currentFigure, '-dpdf', 'ap-tukey-Rprec.pdf');
            else 
            print(currentFigure, '-dpdf', 'ap-tukey-P10.pdf');
        end
    end
    
    
% box plot
currentFigure = figure;
    % need to reverse the order of the columns to have bloxplot displayed
    % as the Tukey HSD plot
    boxplot(measure(:, end:-1:1), 'Labels', runID(end:-1:1), ...
        'Orientation', 'horizontal', 'Notch','off', 'Symbol', 'ro')
    
    ax = gca;
    ax.FontSize = 20;
    if strcmp(selected_measure,'map')
        ax.XLabel.String = 'Average Precision (AP)';
    else
        if strcmp(selected_measure,'Rprec')
            ax.XLabel.String = 'Precision at the recall base (Rprec)';
            else 
            ax.XLabel.String = 'Precision at 10 (P10)';
        end
    end
    ax.YLabel.String = 'Run';
    
    currentFigure.PaperPositionMode = 'auto';
    currentFigure.PaperUnits = 'centimeters';
    currentFigure.PaperSize = [42 22];
    currentFigure.PaperPosition = [1 1 40 20];

if strcmp(selected_measure,'map')
        print(currentFigure, '-dpdf', 'ap-boxplot-map.pdf');
    else
        if strcmp(selected_measure,'Rprec')
            print(currentFigure, '-dpdf', 'ap-boxplot-Rprec.pdf');
            else 
            print(currentFigure, '-dpdf', 'ap-boxplot-P10.pdf');
        end
    end


