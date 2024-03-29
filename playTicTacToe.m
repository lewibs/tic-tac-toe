function [] = playTicTacToe() 

clc;clear;close('all');
%% prep game

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
     [board,game] = playTurnPlay(p1,typep1,1,board,game);
     win=checkWin(board,1,'graph');
     
     if win ~= false
         break
     end
     
     %player 2
     [board,game] = playTurnPlay(p2,typep2,2,board,game);
     win=checkWin(board,2,'graph');
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

hold off

end