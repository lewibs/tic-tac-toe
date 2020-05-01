function [row,col] = bestOption(pNum,game)
%determines the best move for the computer bassed on memory
%	pnum is the number of the player
%   game is the current game string

pNum = num2str(pNum);

fid = fopen('games.txt','a');
fclose('all');
fid = fopen('games.txt','r');

board = zeros(3);
boardCurrent = populateBoard(game);

while ~feof(fid)
    checkGame = fgetl(fid);
    if checkGame~=-1
        if ~ischar(checkGame)
            checkGame = 'n';
        end

        if strlength(checkGame)>=strlength(game)
            boardCheck = populateBoard(checkGame(1:strlength(game)));
            for i=1:3
                if boardCheck==boardCurrent %these moves have been done before goes on to pick next best move
                    moves  = checkGame(strlength(game)+1:strlength(game)+2);
                    result = checkGame(end);
                    if result == '3'
                        result = -1;
                    elseif result == pNum
                        result = 1;
                    elseif result ~= pNum
                        result = -10;
                    end

                    row = str2double(moves(1));
                    col = str2double(moves(2));

                    board(row,col) = board(row,col)+result;        
                end
                boardCheck=rot90(boardCheck);
            end
        end
    end
end


%reset the board wihout illegal moves
illegalMoves = boardCurrent > 0;

for i=1:9
    if illegalMoves(i)==1
        board(i)=-99999999;
    end
end

mx = max(max(board));

board = board == mx; %sets board

validMove = 0;
while validMove == 0
    row = randi(3);
    col = randi(3);
    if board(row,col) == 1
        validMove = 1; 
    end 
end

end 

