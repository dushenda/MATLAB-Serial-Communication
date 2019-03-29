function bytes(obj,events,handles)
% str = fgets(obj);
% % handles.hasData = 1;
% disp(str);
% disp('bytes called');
str = fgetl(obj);
disp(str);
% str = 'START,A017,3031.07100N,10404.00096E,181213101431,658038464,0295,STOP';
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
% newRow = {1,2,3,4,5,6,7,8,9,10};
newData = [oldData; newRow];
set(handles.tblShowData,'Data',newData);
end

