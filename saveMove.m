function [game] = saveMove(row,col,game)
%saves the last move made into game string
%   row is the row of the last move
%   col is the column of the last move
%   game is the string saving game data
row=num2str(row);
col=num2str(col);
game = [game,row,col];
end

