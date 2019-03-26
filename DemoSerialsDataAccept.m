clear;clc;
delete(instrfindall) % 关闭前面占用的端口，这句很重要 
%% 从串口读取数据
s = serial('COM2');  % 设置端口为 COM2
set(s,'BaudRate',9600); % 设置波特率为 9600
fopen(s);            % 打开端口
% 读取数据并保存至元胞数组 A
for i=1:1:10
fprintf(s,'*IDN?');
out = fscanf(s);
A{i}=cellstr(out);
disp(out)
end
fclose(s);
delete(s)
clear s
%% 解析数据，主要是提取元胞数组中
str = 'START,A017,3031.07100N,10404.00096E,181213101431,658038464,0295,STOP';
% 正则表达式分割数组
DataCellArr = regexp(str,',','split');
START = DataCellArr{1};
STOP = DataCellArr{8};
% 判断帧头帧尾是否完整
if((START == "START" ) && (STOP == "STOP"))
    disp('data is security');
else
    disp('data is not security');
end
% 取出数据
AddressCode = DataCellArr{2};
LatitudeBefore = DataCellArr{3};
LongitudeBefore = DataCellArr{4};
UTCDateTimeBeefore = DataCellArr{5};
TriggerTimeBefore = DataCellArr{6};
PowerBefore = DataCellArr{7};
% 把取出的原始数据转化为有用的信息
[PositionLatStr,PositionLatNum] = getLatitude(LatitudeBefore);
[PositionLonStr,PositionLonNum] = getLongitude(LongitudeBefore);
UTCDateTime = getTime(UTCDateTimeBeefore);
TriggerTimeArr = getTriggerTime(TriggerTimeBefore);
Power = getPower(PowerBefore);
%% 显示数据
% f = uifigure;
% f.Name = '处理数据';
% t = uitable(f,'Data',[1 2 3; 4 5 6; 7 8 9]);
% t.FontSize = 10;


%% 计算处理