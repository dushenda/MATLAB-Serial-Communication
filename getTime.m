function UTCDateTime = getTime(UTCDateTimeStr)
% 输入字符数组，输出时间格式数据
Year = str2double(strcat('20',UTCDateTimeStr(1:2)));
Month = str2double(UTCDateTimeStr(3:4));
Day = str2double(UTCDateTimeStr(5:6));
Hour = str2double(UTCDateTimeStr(7:8));
Minute = str2double(UTCDateTimeStr(9:10));
Second = str2double(UTCDateTimeStr(11:12));
UTCDateTime = datetime(Year,Month,Day,Hour,Minute,Second); 
end