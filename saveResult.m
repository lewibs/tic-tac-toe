function [] = saveResult(win,game)
%saves whether player 1 or 2 won the game
%   win is either a 1 or 2
win = num2str(win);
game = [game,win];
copy='no';

% fid = fopen('games.txt','r');
% 
% while ~feof(fid)
%     checkGame = fgetl(fid);
%     if strcmp(checkGame,game)
%         copy = 'yes';
%     end
% end
% 
% fclose(fid);

fid = fopen('games.txt','a');

if strcmp(copy,'no')
    fprintf(fid,[game,newline]);
end

fclose(fid);

end
