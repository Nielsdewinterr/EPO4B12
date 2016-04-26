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

% Last Modified by GUIDE v2.5 19-Apr-2016 18:17:44

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

% create speed and angle
global speed; speed = 150;
global last_speed;last_speed = 150;
global direction; speed = 150;
global last_direction; last_direction = 150;
global log;log='';

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
EPOfunctions.status(hObject, eventdata, handles);

% --- Executes on speed slider movement.
function nav_speed_Callback(hObject, eventdata, handles)
% hObject    handle to nav_speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

global speed;
speed = get(hObject,'Value');
logdata(strcat('speed: ',speed),handles);%updating log
set(handles.text_speed,'String',speed); %set speed text
%status = EPOCommunications('transmit', strcat('D',speed); 
EPOfunctions.status(hObject, eventdata, handles);

% --- Executes on direction slider movement.
function nav_dir_Callback(hObject, eventdata, handles)
% hObject    handle to nav_dir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

global direction;
direction = 300-get(hObject,'Value');%300-value because of slider orientation
logdata(strcat('direction: ',direction),handles);%updating log
set(handles.text_dir,'String',direction); %set direction text
%status = EPOCommunications('transmit', strcat('D',direction);
EPOfunctions.status(hObject, eventdata, handles);


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

logdata('speed: 165',handles);%updating log
global speed; speed=165; %set speed
set(handles.text_speed,'String','165'); %set speedtext
set(handles.nav_speed,'Value',165); %set speed slider
%status = EPOCommunications('transmit', 'M165');
EPOfunctions.status(hObject, eventdata, handles);



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
EPOfunctions.status(hObject, eventdata, handles);

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
EPOfunctions.status(hObject, eventdata, handles);

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
EPOfunctions.status(hObject, eventdata, handles);

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
EPOfunctions.status(hObject, eventdata, handles);

% --- Executes on button press in com_upd.
function com_upd_Callback(hObject, eventdata, handles)
global comport;
global result;
% hObject    handle to com_upd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.com_out,'String')
comport = strcat('\\.\COM',data);
EPOCommunications('close'); %close any unwanted open connections
result = EPOCommunications('open',comport); %open the wanted connection
logdata('---------',handles);%updating log
logdata('opened connection',handles);%updating log
EPOfunctions.status(hObject, eventdata, handles);

% --- Executes on button press in disconnect.
function disconnect_Callback(hObject, eventdata, handles)
% hObject    handle to disconnect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
EPOCommunications('close');
logdata('closed connection(s)',handles);%updating log

function com_out_Callback(hObject, eventdata, handles)
% hObject    handle to com_out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of com_out as text
%        str2double(get(hObject,'String')) returns contents of com_out as a double


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

% --- Executes on key press with focus on figure1 and none of its controls.
function figure1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
        key = get(handles.figure1, 'CurrentCharacter');
        if key==119 || key==87 %w
            voor_Callback(hObject, eventdata, handles);
        elseif key==115 || key==83 %s
            achter_Callback(hObject, eventdata, handles);
        elseif key == 97 || key==65  %a
            links_Callback(hObject, eventdata, handles);
        elseif key == 100 || key==68 %d
            rechts_Callback(hObject, eventdata, handles);
        elseif key == 108 || key==76 %l
            EPOfunctions.status(hObject, eventdata, handles);
        else %alle andere toetsen
            stop_Callback(hObject, eventdata, handles);
        end

% --- Executes on selection change in list_log.
function list_log_Callback(hObject, eventdata, handles)
% hObject    handle to list_log (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns list_log contents as cell array
%        contents{get(hObject,'Value')} returns selected item from list_log


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



