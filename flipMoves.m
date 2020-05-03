function [moves] = flipMoves(moves)
%this function just takes the move its checking and flips it to the side
%   moves is a 1x2 string
    moves = populateBoard(moves);
    moves = fliplr(moves);
    col = max(moves);
    [~,col] = max(col);
    row = find(moves)-(col-1)*3;
    row = num2str(row);
    col = num2str(col);
    moves = [row,col];
end

