% this is the tic tac toe start menue used for training vs playing I
% sudgest if you havent run it before to train it. keep in mind training
% will take time. Have fun. -Benjamin
clc;clear;close('all');fclose('all');

gameType = input('would you like to train or play (1=play,2=train)? ');

if gameType == 1
    playTicTacToe();
elseif gameType == 2
    trainTicTacToe();
end