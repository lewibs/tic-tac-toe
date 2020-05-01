function [row,col] = twistMoves(twists,moves)
%this twists the next move to be in the right order
    %twists is the number of times that it has twisted
    %moves is the move set 1x2
    row = str2double(moves(1));
    col = str2double(moves(2));
    if twists == 0
        %nothing changes
    else
        moves = zeros(3);
        moves(row,col) = 1;
        for i=1:twists
            moves = rot90(moves);
        end
        
        col = max(moves);
        [~,col] = max(col);
        row = find(moves)-(col-1)*3;
    end
end

