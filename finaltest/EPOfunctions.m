classdef EPOfunctions
    properties
    end
methods(Static)
    
    function [distL,distR] = status()
        %stat = EPOCommunications('transmit','S');
        OP = input('left(0)/right(1)/nothing(2)/close(3)');
        if OP == 0 
            stat = horzcat('************************** * Audio Beacon: on * c: 0x00000000 * f_c: xxxxx * f_b: xxxxx * c_r: xxx ************************** * PWM: * Dir. ',num2str((50).*rand(1)+150),' * Mot. ',num2str((50).*rand(1)+150),' ************************** * Sensors: * Dist. L ','40',' R ','130',' * V_batt ',num2str((10).*rand(1)+20),' V ********************');
        elseif OP == 1
            stat = horzcat('************************** * Audio Beacon: on * c: 0x00000000 * f_c: xxxxx * f_b: xxxxx * c_r: xxx ************************** * PWM: * Dir. ',num2str((50).*rand(1)+150),' * Mot. ',num2str((50).*rand(1)+150),' ************************** * Sensors: * Dist. L ','300',' R ','50',' * V_batt ',num2str((10).*rand(1)+20),' V ********************');
        elseif OP == 2
            stat = horzcat('************************** * Audio Beacon: on * c: 0x00000000 * f_c: xxxxx * f_b: xxxxx * c_r: xxx ************************** * PWM: * Dir. ',num2str((50).*rand(1)+150),' * Mot. ',num2str((50).*rand(1)+150),' ************************** * Sensors: * Dist. L ','300',' R ','300',' * V_batt ',num2str((10).*rand(1)+20),' V ********************');
        else
            stat = horzcat('************************** * Audio Beacon: on * c: 0x00000000 * f_c: xxxxx * f_b: xxxxx * c_r: xxx ************************** * PWM: * Dir. ',num2str((50).*rand(1)+150),' * Mot. ',num2str((50).*rand(1)+150),' ************************** * Sensors: * Dist. L ','30',' R ','20',' * V_batt ',num2str((10).*rand(1)+20),' V ********************');
        end
        getdata = strread(stat,'%s');
        l=length(getdata);
        i=1;
        while(i<l)
            switch char(getdata(i));
                case 'L'
                    distL = str2num(cell2mat(getdata(find(strcmp('L',getdata))+1)));
                case 'R'
                    distR = str2num(cell2mat(getdata(find(strcmp('R',getdata))+1)));
                otherwise
            end
            i=i+1;
        end 
    end
end
end