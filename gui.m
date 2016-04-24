function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 24-Apr-2016 10:54:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% initialize globals
global speed; speed = 150;
global last_speed;last_speed = 150;
global direction; direction = 150;
global last_direction; last_direction = 150;
global log;log='';
global distance; distance = [];
global voltage; voltage = [];
global motor; motor = [];
global dir; dir = [];
global time; time= [];
global record; record = 0;
global choice; choice = 'None';

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
logdata('stop',handles);%updating log
global speed; speed=150; %set speed
global last_speed; last_speed=150; %reset last speed
set(handles.text_speed,'String',150); %set speed text
set(handles.nav_speed,'Value',150); %set speed slider
%status = EPOCommunications('transmit', 'M150');

% --- Executes on speed slider movement.
function nav_speed_Callback(hObject, eventdata, handles)
% hObject    handle to nav_speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

global speed;
speed = get(hObject,'Value');
logdata(horzcat('speed: ',num2str(speed)),handles);%updating log
set(handles.text_speed,'String',speed); %set speed text
%status = EPOCommunications('transmit', strcat('D',speed)); 

% --- Executes on direction slider movement.
function nav_dir_Callback(hObject, eventdata, handles)
% hObject    handle to nav_dir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

global direction;
direction = 300-get(hObject,'Value');%300-value because of slider orientation
logdata(horzcat('direction: ',num2str(direction)),handles);%updating log
set(handles.text_dir,'String',direction); %set direction text
%status = EPOCommunications('transmit', strcat('D',direction));


% --- Executes during object creation, after setting all properties.
function nav_speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nav_speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: slider controls usually have a light gray background.

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function status_out_Callback(hObject, eventdata, handles)
% hObject    handle to status_out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of status_out as text
%        str2double(get(hObject,'String')) returns contents of status_out as a double


% --- Executes during object creation, after setting all properties.
function status_out_CreateFcn(hObject, eventdata, handles)
% hObject    handle to status_out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in voor.
function voor_Callback(hObject, eventdata, handles)
% hObject    handle to voor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

logdata('speed: 157',handles);%updating log
global speed; speed=157; %set speed
set(handles.text_speed,'String','157'); %set speedtext
set(handles.nav_speed,'Value',157); %set speed slider
%status = EPOCommunications('transmit', 'M157');


% --- Executes on button press in achter.
function achter_Callback(hObject, eventdata, handles)
% hObject    handle to achter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

logdata('speed: 142',handles);%updating log
global speed; speed=142; %set speed
set(handles.text_speed,'String','142'); %set speedtext
set(handles.nav_speed,'Value',142); %set speed slider
%status = EPOCommunications('transmit', 'M142');

% --- Executes on button press in links.
function links_Callback(hObject, eventdata, handles)
% hObject    handle to links (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

logdata('direction: 200',handles);%updating log
global direction; direction=200; %set direction
set(handles.text_dir,'String','200'); %set direction text
set(handles.nav_dir,'Value',101); %set direction slider
%status = EPOCommunications('transmit', 'D200'); % D200 moet nog aangepast worden

% --- Executes on button press in rechts.
function rechts_Callback(hObject, eventdata, handles)
% hObject    handle to rechts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

logdata('direction: 100',handles);%updating log
global direction; direction=100; %set direction
set(handles.text_dir,'String','100'); %set direction text
set(handles.nav_dir,'Value',199); %set (negative) direction slider
%status = EPOCommunications('transmit', 'D100'); % D100 moet nog aangepast worden


% --- Executes on button press in straight.
function straight_Callback(hObject, eventdata, handles)
% hObject    handle to straight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

logdata('direction: 150',handles);%updating log
global direction; direction=150; %set direction
set(handles.text_dir,'String','150'); %set direction text
set(handles.nav_dir,'Value',150); %set (negative) direction slider
%status = EPOCommunications('transmit', 'D150');


% --- Executes on button press in com_upd.
function com_upd_Callback(hObject, eventdata, handles)
global edit; %whether the edit box is being used
global comport;
global result;
% hObject    handle to com_upd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
edit=0;
data = get(handles.com_out,'String');
comport = strcat('\\.\COM',data);
figure(handles.figure1);
EPOCommunications('close'); %close any unwanted open connections
%result = EPOCommunications('open',comport); %open the wanted connection
timecall(hObject, eventdata, handles);
logdata('---------',handles);%updating log
logdata('opened connection',handles);%updating log

% --- Executes on button press in disconnect.
function disconnect_Callback(hObject, eventdata, handles)
% hObject    handle to disconnect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global record;
global t;
record = 0;
stop(t);
EPOCommunications('close');
logdata('closed connection(s)',handles);%updating log

function com_out_Callback(hObject, eventdata, handles)
% hObject    handle to com_out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of com_out as text
%        str2double(get(hObject,'String')) returns contents of com_out as a double
global edit; %whether the edittext is being used
edit = 1;


% --- Executes during object creation, after setting all properties.
function com_out_CreateFcn(hObject, eventdata, handles)
% hObject    handle to com_out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on key press with focus on voor and none of its controls.
function voor_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to voor (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
% 

% --- Executes during object creation, after setting all properties.
function nav_dir_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nav_dir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function logdata(logcode,handles)
global log; 
log=sprintf('%s\n%s',log,logcode);
set(handles.list_log,'String',log);
currentItems =size(get(handles.list_log,'String'));
set(handles.list_log,'Value',currentItems(1));

%graphical interface for recording and displaying data
    function timecall(hObject, eventdata, handles)
    global t;
    t = timer;
    t.StartDelay = .5;
    t.TimerFcn = {@startstatus,handles};
    t.ExecutionMode='fixedRate';
    t.period=.5;
    start(t);

    function startstatus(hObject,eventdata,handles)
    global record; %whether the wants to record the data
    %Get Status
            status = EPOfunctions.status(hObject, eventdata, handles);%[Dir,Mot,distL,distR, vBatt]
    if record==1 %user clicked record
        global distance; %global matrix with recorded distance (r and l)
        global voltage;
        global motor;
        global dir;
        global time;
        global choice; %which record the user wants to display
        axes(handles.Graph);
            %Get Distance
            distance_new = str2double([status(3);status(4)]);
            if isempty(distance)
              distance=distance_new;
            else
              distance=[distance, distance_new];
            end
            %Get Voltage
            voltage_new = str2double(status(5));
            if isempty(voltage)
              voltage=voltage_new;
            else
              voltage=[voltage, voltage_new];
            end
            %Get Speed
            motor_new = str2double(status(2));
            if isempty(motor)
              motor=motor_new;
            else
              motor=[motor, motor_new];
            end
            %Get Direction
            dir_new = str2double(status(1));
            if isempty(dir)
              dir=dir_new;
            else
              dir=[dir, dir_new];
            end
            %Set Time
            if isempty(time)
                time=0.5;
            else
                time= [time,time(end)+0.5];
            end
        %dispay in graph
        switch choice
            case 'Distance'
                plot(handles.Graph,time,(distance)');
            case 'Voltage'
                plot(handles.Graph,time,(voltage)');
            case 'Motor'
                plot(handles.Graph,time,(motor)');
            case 'Direction'
                plot(handles.Graph,time,(dir)');
            otherwise
        end
    end

% --- Executes during object creation, after setting all properties.
function list_log_CreateFcn(hObject, eventdata, handles)
% hObject    handle to list_log (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
global choice;
global distance;
global voltage;
global motor;
global dir;
global time;
contents = cellstr(get(hObject,'String'));
choice = contents{get(hObject,'Value')};
cla(handles.Graph);
switch choice
            case 'Distance'
                plot(handles.Graph,time,(distance)');
            case 'Voltage'
                plot(handles.Graph,time,(voltage)');
            case 'Motor'
                plot(handles.Graph,time,(motor)');
            case 'Direction'
                plot(handles.Graph,time,(dir)');
            otherwise
        end
logdata(horzcat('Display: ',choice),handles);%updating log


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in RecordBtn.
function RecordBtn_Callback(hObject, eventdata, handles)
% hObject    handle to RecordBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global record;
record = 1;
logdata('started record',handles);%updating log


% --- Executes on button press in StopRecordBtn.
function StopRecordBtn_Callback(hObject, eventdata, handles)
% hObject    handle to StopRecordBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global record;
record = 0;
logdata('stopped record',handles);%updating log


% --- Executes on button press in ClearRecordBtn.
function ClearRecordBtn_Callback(hObject, eventdata, handles)
% hObject    handle to ClearRecordBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global distance; distance = [];
global voltage; voltage = [];
global motor; motor = [];
global dir; dir = [];
global time; time=[];
cla(handles.Graph);


% --- Executes on button press in SaveRecordBtn.
function SaveRecordBtn_Callback(hObject, eventdata, handles)
% hObject    handle to SaveRecordBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global distance;assignin('base','distance',distance);
global voltage;assignin('base','voltage',voltage);
global motor;assignin('base','motor',motor);
global dir;assignin('base','direction',dir);
global time;assignin('base','time',time);


% --- Executes on key press with focus on figure1 or any of its controls.
function figure1_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global edit;
if edit==0
    key = get(handles.figure1, 'CurrentCharacter');
    if key==119 || key==87 %w
        voor_Callback(hObject, eventdata, handles);
    elseif key==115 || key==83 %s
        achter_Callback(hObject, eventdata, handles);
    elseif key==97 || key==65  %a
        links_Callback(hObject, eventdata, handles);
    elseif key==100 || key==68 %d
        rechts_Callback(hObject, eventdata, handles);
    elseif key==108 || key==76 %l
        EPOfunctions.status(hObject, eventdata, handles);
    elseif key==120 || key==88 %x
        straight_Callback(hObject, eventdata, handles);
    elseif key==113 || key==81 %q
        links_Callback(hObject, eventdata, handles);
        voor_Callback(hObject, eventdata, handles);
    elseif key==101 || key==69 %e
        rechts_Callback(hObject, eventdata, handles);
        voor_Callback(hObject, eventdata, handles);
    else %alle andere toetsen
        stop_Callback(hObject, eventdata, handles);
    end
end

% --- Executes on key press with focus on com_out and none of its controls.
function com_out_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to com_out (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global edit;
edit=1;