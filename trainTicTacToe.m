function [] = trainTicTacToe()

setnumber = input('how many times would you like to trin it? 100 times does not take long and shows good results: ');
for runthisbabysetnumberoftimes = 1:setnumber
    %% prep game
    clc;clearvars -except 'runthisbabysetnumberoftimes';close('all');

    pName = 'Player'; %input('input name:','s');
    cName = 'CPU';

    % make game board
    [board,~] = makeBoard(pName);
    hold on

    % decide who goes first
    [p1,p2]=coinToss(pName,cName);

    %% run game

    %set player type
    if strcmp(p1,cName)
        typep1 = 'CPU';
        typep2 = 'player';
    elseif strcmp(p2,cName)
        typep1 = 'player';
        typep2 = 'CPU';
    end

    win=false;
    game='';

    while win==false

        %player 1
         [board,game] = playTurnTrain(p1,typep1,1,board,game);
         win=checkWin(board,1,'graph');

         pause(.001);

         if win ~= false
             break
         end

         %player 2
         [board,game] = playTurnTrain(p2,typep2,2,board,game);
         win=checkWin(board,2,'graph');

         pause(.001);
    end

    %% end game
    if win == 1
       if strcmp(p1,'CPU')
           title('you lost :(');
       else
           title('congrats you won!');
       end
    elseif win == 2
        if strcmp(p2,'CPU')
           title('you lost :(');
       else
           title('congrats you won!');
       end
    else
        title("it's a tie!");
    end

    saveResult(win,game);
    
    pause(.1)
    
    fTime = fopen('times.txt','a');
    time = toc;
    time = num2str(time);
    fprintf(fTime,[time,newline]);
    fclose(fTime);

    title('trianing is finished');

    hold off

end