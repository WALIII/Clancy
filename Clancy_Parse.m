function [ROI] = Clancy_Parse(allData)
  % Clancy_Parse
  % Grab data from a relevant session, and export cells in a better format

  % WAL3
  % d10/31/17




  % G = allData.KA7.d20130922.task; % early
  G = allData.KA7.d20130924.task; % early
  % G = allData.KA7.d20130928.task; % last


% ROI.index reference
% e1 = 0
% e2 = 1
% indirect = 2


  % group1, Direct Cells
  A = struct2cell(getfield(G.dF, 'e1',{1}));
    for i = 1:numel(fieldnames(G.dF.e1))
      e1(i,:) = A{i};
      ind1(i,:) = 0;
    end


  % group2, Indirect Cells
  B = struct2cell(getfield(G.dF, 'e2',{1}));
    for i = 1:numel(fieldnames(G.dF.e2))
      e2(i,:) = B{i};
      ind2(i,:) = 1;
    end

  %% Get unrelated Cells
  Bc = struct2cell(getfield(G.dF, 'Indirect  ',{1}));
  for i = 1:numel(fieldnames(G.dF.Indirect))
    indirect(i,:) = Bc{i};
    ind3(i,:) = 2;
  end

  % Concat all
  ROI.cells = cat(1,e1,e2,indirect);
  ROI.index = cat(1,ind1,ind2,ind3);

  %% Plot Cell Positions
  Bd = struct2cell(getfield(G, 'pos',{1}));
  for i = 1:numel(fieldnames(G.pos))
  ROI.pos(i,:) = Bd{i};
  end

  % Targerts and timeouts
  ROI.target = G.target1;
  ROI.timeouts = G.timeouts;
