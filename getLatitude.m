function [PositionLatStr,PositionLatNum] = getLatitude(LatitudeStr)
% 得到纬度信息，格式为3031.07100N 北纬30°31′7.100″
NumStr = LatitudeStr(1:end-1);
LocStr = LatitudeStr(end);
if(LocStr == 'N')
    Loc = '北纬';
elseif(LocStr == 'S')
    Loc = '南纬';
else
    disp('not in Earth');
end
PositionLatStr = strcat(Loc,NumStr);
PositionLatNum = str2double(NumStr);
end