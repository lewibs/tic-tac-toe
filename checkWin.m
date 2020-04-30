function win=checkWin(board,pNum)
%this checks the board for any wins
%   board is the 3x3 board consiting of either 2 or 1

posibleWins = {[1,1,1;-1,-1,-1;-1,-1,-1],[-1,-1,-1;1,1,1;-1,-1,-1],[-1,-1,-1;-1,-1,-1;1,1,1],...
               [1,-1,-1;1,-1,-1;1,-1,-1],[-1,1,-1;-1,1,-1;-1,1,-1,],[-1,-1,1;-1,-1,1;-1,-1,1],...
               [1,-1,-1;-1,1,-1;-1,-1,1],[-1,-1,1;-1,1,-1;1,-1,-1]};          
tie = ones(3);
    
checkBoard = board==pNum;
for i = 1:8
    if sum(sum(checkBoard == posibleWins{i}))==3
        win = pNum;
        return
    else
        win = false;
    end
end

checkBoard = board > 0;

if checkBoard == tie
    win = '3';
    return
end

end

