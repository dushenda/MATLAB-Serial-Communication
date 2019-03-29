function [PositionLatStr,PositionLatNum] = getLatitude(LatitudeStr)
% 得到纬度信息，格式为3031.07100N 北纬30°31′7.100″
NumStr = LatitudeStr(1:end-1);
Num = str2double(NumStr);
NumDeg = fix(Num/100);
NumMin = fix(Num-NumDeg*100);
NumSec = (Num - floor(Num))*100;
LocStr = LatitudeStr(end);
if(LocStr == 'N')
    Loc = '北纬';
elseif(LocStr == 'S')
    Loc = '南纬';
else
    disp('not in Earth');
end
PositionLatStr = strcat(Loc,num2str(NumDeg),'°',num2str(NumMin),...
    '''',num2str(NumSec),'''''');
PositionLatNum = NumDeg+NumMin/60+NumSec/3600;
end