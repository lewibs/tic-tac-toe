function [] = saveResult(win,game)
%saves whether player 1 or 2 won the game
%   win is either a 1 or 2
win = num2str(win);
game = [game,win];
gameOG = game;
copy='no';

fid = fopen('games.txt','r');

% while ~feof(fid)
%     checkGame = fgetl(fid);
%     if length(game)==length(checkGame)
%         checkGame(end) = '';
%         game = game(1:end-1);
% 
%         %change to cell array
%         for i=1:(length(checkGame))/2
%             checkGameCell{i} = checkGame(1:2);
%             checkGame(1:2) = '';
%         end
% 
%         checkGame = [];
%         moves=[];
%         for i=0:3
%             for j = 1:length(checkGameCell)
%                 moves = checkGameCell{j};
%                 checkGame = [checkGame,twistMoves(i,moves)];
%             end
% 
%             if strcmp(game,checkGame)
%                 copy = 'yes';
%             end
%             checkGame = [];
%         end
%     end
% end

fclose(fid);

fid = fopen('games.txt','a');

if strcmp(copy,'no')
    fprintf(fid,[gameOG,newline]);
end

fclose(fid);

end
