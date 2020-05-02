function [board,game] = playTurnPlay(player,typePlayer,pNum,board,game)
%this is for doing the player turn either pc or human
%   player is either the name of the player or CPU
%   typePlayer is either determines what type of playturn will be used
%   pnum is weather they are first or second
%   board is the current board

%sets narker type
    if pNum == 1
       marker = 'rx'; 
    elseif pNum == 2
       marker = 'bo'; 
    end
%plays either cpu or player
    if strcmp(typePlayer,'CPU') %plays CPU
       title('CPU turn');
       while 1  
            %think
            [y,x] = bestOption(pNum,game);

            %place
            if board(y,x)==0
                board(y,x)=pNum;

                game = saveMove(y,x,game);

                %reset x and y for plot
                x=x-2;
                if y == 3
                    y=-1;
                elseif y==2
                    y=0;
                else
                    y=1;
                end

                plot(x,y,marker,'MarkerSize',50,'LineWidth',1);
                break
            end
        end
            
    elseif strcmp(typePlayer,'player') %plays Player
        title('player turn')
        [x,y]=ginput(1);
        x=round(x);
        y=round(y);
        plot(x,y,marker,'MarkerSize',50,'LineWidth',1);
        
        %resets x y for putting on board
        x=x+2;
        if y == -1
            y=3;
        elseif y==0
            y=2;
        else
            y=1;
        end
        
        board(y,x)=pNum;
        
        game = saveMove(y,x,game);
    end
    
end

