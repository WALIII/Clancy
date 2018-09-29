function [ROI] = Clancy_Align(ROI)
  % Clancy_Align
  % Align data to target and risetime of E1 cells

  % WAL3
  % D10/31/2017


  % User Input
  tW = 70; % buffer
  C = ROI.e1(:,1); % Target cell

%%% Find Peaks
[Ypk,Xpk,Wpk,Ppk] = findpeaks(C,'MinPeakProminence',(std(C)*3)); figure(); hold on; plot(C); plot(Xpk,Ypk,'*');



figure();
for ii = size(ROI.cells,1)
for i = 1:size(Xpk,1)

ROI.align_peak(i,:,ii) = ((ROI.cells(Xpk(i)-tW:Xpk(i)+tW,ii)));
    end
end

%% Biggest cells first...
[a b] = sort(mean(ROI.cells),'descend');


figure();
tW = 70; % buffer
IndC = [b(1) b(2) b(3) b(4)]; % which indirect cells
for i = 1:size(Xpk,1)
    hold on;
    try
    ax1 = subplot(411);
    plot(ROI.ind((Xpk(i)-tW:Xpk(i)+tW),IndC(1)),'r');
    hold on;
    ax2 = subplot(412);
    hold on;
    plot(ROI.ind((Xpk(i)-tW:Xpk(i)+tW),IndC(2)),'r');
    ax3 = subplot(413);
    hold on;
    plot(ROI.ind((Xpk(i)-tW:Xpk(i)+tW),IndC(3)),'r');
    ax4 = subplot(414);
    hold on;
    plot(ROI.ind((Xpk(i)-tW:Xpk(i)+tW),IndC(4)),'r');
    catch
    end
end
linkaxes([ax1 ax2 ax3 ax4],'xy');
ylim([-0.5 5])









%%% Plot based on the target
figure();
tW = 30;
for i = 1:size(ROI.target,2)
    hold on;

    % index 10 timestamps before and after...
   sT =  ROI.target(i)-tW;
   eT = ROI.target(i)+tW;
   try
 M1(i,:) = Cell_1(sT:eT);
 plot(M1(i,:),'c');
   catch; end;
   try
 M2(i,:) = Cell_2(sT:eT);
 plot(M2(i,:),'b');
   catch;end;

   try
 M3(i,:) = Cell_3(sT:eT);
    plot(M3(i,:),'r');
   catch;end
   try
 M4(i,:) = Cell_4(sT:eT);
    plot(M4(i,:),'m');
   catch;end;



end
title('Direct Cells');
warning off
try
Gx = {M1',M2',M3',M4'};
catch
    Gx = {M1',M3'};
end;
figure();
scrapPlot(Gx);


figure();

%% Indirect Cells
for i = 1:size(ROI.target,2)
    hold on;

    % index 10 timestamps before and after...
   sT =  ROI.target(i)-tW;
   eT = ROI.target(i)+tW;

for ii = 1:4
 M1a(i,:,ii) = ROI.ind(sT:eT,IndC(ii));
 plot(M1a(i,:));
 end
 end
title('Indirect Cells');
