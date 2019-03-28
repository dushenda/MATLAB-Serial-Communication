clear;clc;
delete(instrfindall) % 关闭前面占用的端口，这句很重要 
%% 从串口读取数据
s = serial('COM2');
s.BytesAvailableFcnMode = 'terminator';
s.BytesAvailableFcn = @instrcallback;
fopen(s);
fprintf(s,'*IDN?');
out = fscanf(s);
disp(out)
% s.BytesAvailableFcn = @disp(out);
% 
% s = serial('COM2');  % 设置端口为 COM2
% set(s,'BaudRate',9600); % 设置波特率为 9600
% fopen(s);            % 打开端口
% % 读取数据并保存至元胞数组 A
% % j=1;
% % for i=1:1:5
% fprintf(s,'*IDN?');
% out = fscanf(s);
% % A(i)=cellstr(out);
% disp(out)
% j=j+1;
% end
fclose(s);
delete(s)
clear s
%% 解析数据，主要是提取元胞数组中
% str = 'START,A017,3031.07100N,10404.00096E,181213101431,658038464,0295,STOP';
% 正则表达式分割数组
ACell = regexp(A,',','split');
DataCellArr = vertcat(ACell{:});
DataTable = cell2table(DataCellArr);
VarName = {'Start','Address','Latitude','Longitude','UTCTime',...
            'TriggerTime','Power','End'};
DataTable.Properties.VariableNames = VarName;
% 把取出的原始数据转化为有用的信息
DataTable.Address = cellfun(@getAddressCode,DataTable.Address,...
                            'UniformOutput',false);
[PositionLatStr,PositionLatNum] = cellfun(@getLatitude,DataTable.Latitude,...
                                            'UniformOutput',false);
DataTable.Latitude = PositionLatStr;                                        
[PositionLonStr,PositionLonNum] = cellfun(@getLongitude,DataTable.Longitude,...
                                          'UniformOutput',false);
DataTable.Longitude = PositionLatStr;                                      
DataTable.UTCTime = cellfun(@getTime,DataTable.UTCTime,...
                            'UniformOutput',false);
DataTable.TriggerTime = cellfun(@getTriggerTime,DataTable.TriggerTime,...
                                'UniformOutput',false);
DataTable.Power = cellfun(@getPower,DataTable.Power,...
                          'UniformOutput',false);
% else
%     disp('data is not security');
% end

%% 显示数据
% f = uifigure;
% f.Name = '处理数据';
% t = uitable(f,'Data',[1 2 3; 4 5 6; 7 8 9]);
% t.FontSize = 10;


%% 计算处理