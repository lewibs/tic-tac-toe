function [delGames] = cleanData()
%this game goes throught the data and deltetes repeats
%   del games is the number of games that were deleted
fid1  = fopen('games.txt','r');
fid2 = fopen('gamesClean.txt','a+');

while ~feof(fid1)
    copy = 'no';
    gameString = fgetl(fid1);
    game = populateBoard(game);
    while ~feof(fid2)
        checkGame = fgetl(fid2);
        checkGame = populateBoard(checkGame);
        for i=1:3
            if game==checkGame
                copy='yes';
            end
            checkGame = rot90(checkGame);
        end
        
        
        
        
    end
end


end

