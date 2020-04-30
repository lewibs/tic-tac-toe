function [board] = populateBoard(game)
%this takes the game sting and makes it a board array
%   game is a  string
%   board is a 3x3 array
board = zeros(3);
for i=1:length(game)/2
    row = str2double(game(1));
    col = str2double(game(2));
    game(1:2) = '';
    if rem(i,2)
        board(row,col) = 1;
    elseif ~rem(i,2)
       board(row,col) = 2; 
    end
end

