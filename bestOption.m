function [row,col] = bestOption(pNum,game)
%determines the best move for the computer bassed on memory
%	pnum is the number of the player
%   game is the current game string

pNum = num2str(pNum);

fid = fopen('games.txt','a');
fclose('all');
fid = fopen('games.txt','r');

board = zeros(3);
while ~feof(fid)
    checkGame = fgetl(fid);
    if ~ischar(checkGame)
        checkGame = 'n';
    end
    
    if strlength(checkGame)>=strlength(game)
        if strcmp(checkGame(1:strlength(game)),game) %these moves have been done before
            moves  = checkGame(strlength(game)+1:strlength(game)+2);
            result = checkGame(end);
            if result == '3'
                result = 0;
            elseif result == pNum
                result = 5;
            elseif result ~= pNum
                result = -1;
            end

            row = str2double(moves(1));
            col = str2double(moves(2));

            board(row,col) = board(row,col)+result;        
        end 
    end
end

mx = max(max(board));

board = board == mx;

validMove = 0;
while validMove == 0
    row = randi(3);
    col = randi(3);
    if board(row,col) == 1
        validMove = 1; 
    end 
end

end 

