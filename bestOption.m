function [row,col] = bestOption(pNum,game)
%determines the best move for the computer bassed on memory
%	pnum is the number of the player
%   game is the current game string

pNum = num2str(pNum);
board = populateBoard(game);
wins = {[1,1,1;-1,-1,-1;-1,-1,-1],[-1,-1,-1;1,1,1;-1,-1,-1],[-1,-1,-1;-1,-1,-1;1,1,1],...
       [1,-1,-1;1,-1,-1;1,-1,-1],[-1,1,-1;-1,1,-1;-1,1,-1,],[-1,-1,1;-1,-1,1;-1,-1,1],...
       [1,-1,-1;-1,1,-1;-1,-1,1],[-1,-1,1;-1,1,-1;1,-1,-1]};

ImWin = 0;

saveBoard = board;
noValBoard = board>0;

if pNum == '1'
    for j =2:-1:1
        for i=1:length(wins)
            board = saveBoard == j;
            if sum(sum(board == wins{i}))==2
                board = board == wins{i};
                board = wins{i}-board;
                board = board == 1;
                playBoard = board;
                board = double(board);
                board = changem(board,-1,0);
                board = board == noValBoard;
                if sum(sum(board)) == 0
                    ImWin=2;
                    col = max(playBoard);
                    [~,col] = max(col);
                    row = find(playBoard)-(col-1)*3;
                end
            end
        end
    end
elseif pNum == '2'
    for j =1:1:2
        board = saveBoard == j;
        for i=1:length(wins)
            if sum(sum(board == wins{i}))==2
                board = board == wins{i};
                board = wins{i}-board;
                board = board == 1;
                playBoard = board;
                board = double(board);
                board = changem(board,-1,0);
                board = board == noValBoard;
                if sum(sum(board)) == 0
                    ImWin=2;
                    col = max(playBoard);
                    [~,col] = max(col);
                    row = find(playBoard)-(col-1)*3;
                end
            end
        end
    end
end

if ImWin == 2
    %do nothing
elseif ImWin == 0
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
                if strlength(checkGame)>strlength(game)+2
                    moves  = checkGame(strlength(game)+1:strlength(game)+2);
                end
                for i=1:3
                    if boardCheck==boardCurrent %these moves have been done before goes on to pick next best move
                        result = checkGame(end);
                        if result == '3'
                            result = -1;
                        elseif result == pNum
                            result = 0;
                        elseif result ~= pNum
                            result = -2;
                        end

                        row = str2num(moves(1));
                        col = str2num(moves(2));
                        board(row,col) = board(row,col)+result;
                    end
                    if exist('moves')
                        moves = twistMoves(1,moves);
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

end 