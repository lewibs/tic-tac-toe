function [first,second] = coinToss(pName,cName)
%determines who goes first
%   pName = name of the player in string
%   cName = name of the pc
    coin = randi(2,1);
    if coin == 1
        first=pName;
        second=cName;
    else
        first=cName;
        second=pName;
    end
end

