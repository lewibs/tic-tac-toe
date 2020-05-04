function win=checkWin(board,pNum,graph)
%this checks the board for any wins
%   board is the 3x3 board consiting of either 2 or 1

posibleWins = {[1,1,1;-1,-1,-1;-1,-1,-1],[-1,-1,-1;1,1,1;-1,-1,-1],[-1,-1,-1;-1,-1,-1;1,1,1],...
               [1,-1,-1;1,-1,-1;1,-1,-1],[-1,1,-1;-1,1,-1;-1,1,-1,],[-1,-1,1;-1,-1,1;-1,-1,1],...
               [1,-1,-1;-1,1,-1;-1,-1,1],[-1,-1,1;-1,1,-1;1,-1,-1]}; 

tie = ones(3);

if pNum == 1
    color = 'r';
elseif pNum == 2
    color = 'b';
elseif pNum == 0
    color = '';
end
    
checkBoard = board==pNum;

for i = 1:8
    if sum(sum(checkBoard == posibleWins{i}))==3
        win = pNum;
        
        if sum(max(checkBoard == posibleWins{i}))==3
            %horizontal/diagonal
            if sum(sum(checkBoard == [1,1,1;-1,-1,-1;-1,-1,-1]))==3 || sum(sum(checkBoard == [-1,-1,-1;1,1,1;-1,-1,-1]))==3 || sum(sum(checkBoard == [-1,-1,-1;-1,-1,-1;1,1,1]))==3
                %horizontal
                col = max((checkBoard) == posibleWins{i});
                [~,col] = max(col);
                row = find((checkBoard) == posibleWins{i})-(col-1)*3;
                row = row(1);
                if row == 3
                    row = -1;
                elseif row == 2
                    row = 0;
                elseif row == 1
                    row = 1;
                end
                if strcmp(graph,'graph')
                    yline(row,color,'LineWidth',4);
                end
            elseif (max((checkBoard == posibleWins{i})'))==(max((checkBoard == posibleWins{i})))
                %diagonal
                col = max((checkBoard) == posibleWins{i});
                [~,col] = max(col);
                row = find((checkBoard) == posibleWins{i})-(col-1)*3;
                row = row(1);
                
                if row == 3
                    row = -1;
                elseif row == 2
                    row = 0;
                elseif row == 1
                    row = 1;
                end
                
                if col == 3
                    col = 1;
                elseif col == 2
                    col = 0;
                elseif col == 1
                    col = -1;
                end
                
                if row == -1 && col == -1
                    x=[-1.5:1.5];
                    y=[-1.5:1.5];
                elseif row == 1 && col == -1
                    x=[-1.5:1.5];
                    y=[1.5:-1:-1.5];
                end
                if strcmp(graph,'graph')
                    plot(x,y,color,'LineWidth',4)
                end
            end
        else
            %vertical
            col = max((checkBoard) == posibleWins{i});
            [~,col] = max(col);
            row = find((checkBoard) == posibleWins{i})-(col-1)*3;
            if col == 3
                col = 1;
            elseif col == 2
                col = 0;
            elseif col == 1
                col = -1;
            end
            if strcmp(graph,'graph')
                xline(col,color,'LineWidth',4);
            end
        end
        
        return
    else
        win = false;
    end
end

checkBoard = board > 0;

if checkBoard == tie
    win = '3';
    %text(0,0,'C','VerticalAlignment','middle','HorizontalAlignment','center','LineWidth',3,'Color',c,'FontSize',400)
    return
end

end

