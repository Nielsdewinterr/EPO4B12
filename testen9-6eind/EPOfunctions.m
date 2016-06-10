classdef EPOfunctions
    properties
    end
methods(Static)
    
    function [distL,distR] = status()
        stat = EPOCommunications('transmit','S');
        %stat = horzcat('************************** * Audio Beacon: on * c: 0x00000000 * f_c: xxxxx * f_b: xxxxx * c_r: xxx ************************** * PWM: * Dir. ',num2str((50).*rand(1)+150),' * Mot. ',num2str((50).*rand(1)+150),' ************************** * Sensors: * Dist. L ',num2str(fakedist),' R ',num2str(fakedist),' * V_batt ',num2str((10).*rand(1)+20),' V ********************');
        %stat = strcat('************************** * Audio Beacon: on * c: 0x00000000 * f_c: xxxxx * f_b: xxxxx * c_r: xxx ************************** * PWM: * Dir. xxx * Mot. xxx ************************** * Sensors: * Dist. L xxx R xxx * V_batt xx.x V ********************');
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