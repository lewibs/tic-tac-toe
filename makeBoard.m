function [board,figID] = makeBoard(pName)
%makeBoard this makes the game board for the tic tac toe game
%   nothing needed it just makes a nice grid
    figID = figure('name','tic-tac-toe','units','normalized','outerposition',[0 0 1 1])
    yline(-.5);
    yline(.5);
    xline(-.5);
    xline(.5);
    axis([-1.5 1.5 -1.5 1.5]);
    set(gca,'XTick',[], 'YTick', []);
    
    title('tic tac toe');
    
    board = zeros(3);
end

