% this is the tic tac toe start menue used for training vs playing I
% sudgest if you havent run it before to train it. keep in mind training
% will take time. Have fun. -Benjamin
clc;clear;close('all');fclose('all');

tic
gameType = input('would you like to train or play (1=play,2=train)? ');

if gameType == 1
    playTicTacToe();
elseif gameType == 2
    if input('I am unsure on the effectvness of trining vs playing it yourself if you would still like to train it press 1: ')==1
        trainTicTacToe();
    end
end
toc

