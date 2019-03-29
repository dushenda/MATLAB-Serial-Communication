function bytes(obj,~,handles)
str = fgetl(obj);
oldData = get(handles.tblShowData,'Data');
% 正则表达式分割数组
strCell = regexp(str,',','split');
Start = strCell{1};
Address = getAddressCode(strCell{2});
[PositionLatStr,~] = getLatitude(strCell{3});
[PositionLonStr,~] = getLongitude(strCell{4});
myTime = datestr(getTime(strCell{5}));
TriggerTime = getTriggerTime(strCell{6});
Power = getPower(strCell(7));
Stop = strCell{8};
if (strcmp(Stop(1:4),'STOP') && strcmp(Start,'START'))
    Iffull = '完整';
    Stop = 'STOP';
else
    Iffull = '不完整';
end
add = '';
newRow = {Start,Address,PositionLatStr,PositionLonStr,myTime,...
    TriggerTime,Power,Stop,Iffull,add};
newData = [oldData; newRow];
set(handles.tblShowData,'Data',newData);
end

