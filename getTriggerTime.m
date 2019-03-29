function TriggerTimeStr = getTriggerTime(TriggerTimeStr)
% 输出的是触发时间，有3个，单位是ns
TriggerTime1 = str2double(TriggerTimeStr(1:3));
TriggerTime2 = str2double(TriggerTimeStr(4:6));
TriggerTime3 = str2double(TriggerTimeStr(7:9));
TriggerTimeStr = [num2str(TriggerTime1),'ns,',...
    num2str(TriggerTime2),'ns,',num2str(TriggerTime3),'ns'];
end