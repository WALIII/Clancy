
function ClancyPlot(allData)
% Plot basics from the Clacny et al paper

% Get the Mouse
%G = allData.KA7.d20130927.task;
%G = allData.KA1_2.d20131016.task;

% Get Cell Activity
[ROI] = Clancy_Parse(allData);% Get Cell Activity


% Plot ROI Location
figure(); plot(ROI.pos(:,1),ROI.pos(:,2),'o');
title('Cell Location');



% Plot Time Series
figure();
hold on;
for i = find(ROI.index ==0)
plot(ROI.cells(i,:)')
end
for i = find(ROI.index ==1)
plot(-ROI.cells(i,:)')
end


plot(ROI.target, 3*ones(length(ROI.target)),'r*');
plot(ROI.timeouts, 3*ones(length(ROI.timeouts)),'k*');
title(' Data Plotted');


plot(ROI.target, 3*ones(length(ROI.target)),'r*');
plot(ROI.timeouts, 3*ones(length(ROI.timeouts)),'k*');
title(' Data Plotted');
