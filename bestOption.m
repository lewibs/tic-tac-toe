function [row,col] = bestOption(pNum,game)
%determines the best move for the computer bassed on memory
%	pnum is the number of the player
%   game is the current game string

ImWin = 0;
pNum = num2str(pNum);

if pNum == '1'
    j=[2:-1:1];
elseif pNum == '2'
    j=[1:2];
end

if ~strcmp(game,'')
    for player=j
        board = populateBoard(game);
        board = changem(board,-1,player);
        for i = 1:9
            checkBoard = board;
            if board(i)==0
                checkBoard(i) = max(max(board)); 
                win = checkWin(checkBoard,max(max(board)),'noGraph');
                if win ~= 0
                    winBoard = zeros(3);
                    winBoard(i) = 1;
                    
                    if ~exist('row');   
                        col = max(winBoard);
                        [~,col] = max(col);
                        row = find(winBoard)-(col-1)*3;
                        ImWin = 1;
                    end
                end
            end
        end
    end
end
    
if ImWin == 1
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
                for j = 0:1                   
                    if j == 1 && exist('moves')
                        boardCheck = fliplr(boardCheck);
                        moves = flipMoves(moves);
                    end
                    i = 1;
                    while i<=4
                        if boardCheck==boardCurrent %these moves have been done before goes on to pick next best move
                            result = checkGame(end);
                            if result == '3'
                                result = 0;
                            elseif result == pNum
                                result = 1;
                            elseif result ~= pNum
                                result = -1;
                            end

                            row = str2double(moves(1));
                            col = str2double(moves(2));
                            board(row,col) = board(row,col)+result
                        end
                        if exist('moves')
                            moves = twistMoves(1,moves);
                            if (moves == '22')
                                i=4;
                            end
                        end
                        boardCheck=rot90(boardCheck);
                        i=i+1;
                    end
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