function closePort(hObject,handles)
try
    scom = instrfind;
    fclose(scom);
    delete(scom); 
catch
    msgbox('关闭串口失败','错误');
end

set(hObject,'BackgroundColor',[0.392,0.831,0.075]);
set(hObject,'string','打开串口');
set(handles.txtNotify,'string','当前未打开任何串口');
end