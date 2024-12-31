clear all;close all;clc;
while true
light_sensor=menu('Which operation do you want to do (circuit diagram in figurie 1)',...
    'Graph the output voltage according to LDR','Graph the output voltage according to Potentiometer',...
    'Calculate V output','Calculate high protection resistance','Close the programme');

switch light_sensor
    case 1
        hold on;
        imshow('D:\Modül Porjesi\Devre şeması.png')
       prompt = {'What is the min value of the LDR (kohm)','What is the max value of the LDR (kohm)',...
           'Enter the value of the power supply (V)','Enter the value of the Potentiometer (kohm)',...
           'Enter the value of R1 (kohm)','Enter the value of R2 (kohm)'};
        dlgtitle = 'Graph according to LDR ';
        dims = 1;
        definput = {'','','','','',''};
        value = inputdlg(prompt,dlgtitle,dims,definput);
        LDR_min= str2double(value{1});
        LDR_max= str2double(value{2});
        Vi = str2double(value{3});
        P = str2double(value{4});
        R1 = str2double(value{5});
        R2 = str2double(value{6});
        LDR=linspace(LDR_min,LDR_max,100);
        V0= (Vi.*LDR./(R1+LDR))-((P/R2).*(Vi.*R1./(R1+LDR)));
        plot(LDR,V0,'LineWidth',1.5)
        xlabel('Resistance value of the LDR (kohm)');
        ylabel('Voutput value (V)');
        title('Voutput value according to LDR (V)');
        grid;
     hold on;
    case 2   
         hold on
         imshow('D:\Modül Porjesi\Devre şeması.png')
         prompt = {'What is the min value of the Potentiometer (kohm)','What is the max value of the Potentiometer (kohm)',...
           'Enter the value of the power supply (V)','Enter the value of the LDR (kohm)',...
           'Enter the value of R1 (kohm)','Enter the value of R2 (kohm)'};
        dlgtitle = 'Graph according to Potentiometer ';
        dims = 1;
        definput = {'','','','','',''};
        value = inputdlg(prompt,dlgtitle,dims,definput);
        P_min= str2double(value{1});
        P_max= str2double(value{2});
        Vi = str2double(value{3});
        LDR = str2double(value{4});
        R1 = str2double(value{5});
        R2 = str2double(value{6});
        P=linspace(P_min,P_max,100);
        V0= (Vi.*LDR./(R1+LDR))-((P/R2).*(Vi.*R1./(R1+LDR)));
        plot(P,V0,'LineWidth',1.5)
        xlabel('Resistance value of the Potentiometer (kohm)');
        ylabel('Voutput value (V)');
        title('Voutput value according to Potentiometer (V)');
        grid;
     case 3   
         hold on
         imshow('D:\Modül Porjesi\Devre şeması.png')
         prompt = {'What is the set resistance of a potentiometer (kohm)','Enter the value of the power supply (V)',...
             'What is the set resistance of a LDR (kohm)','Enter the value of R1 (kohm)','Enter the value of R2 (kohm)'};
        dlgtitle = 'V output value calculation ';
        dims = 1;
        definput = {'','','','',''};
        value = inputdlg(prompt,dlgtitle,dims,definput);
        P= str2double(value{1});
        Vi = str2double(value{2});
        LDR = str2double(value{3});
        R1 = str2double(value{4});
        R2 = str2double(value{5});
        V0= (Vi.*LDR./(R1+LDR))-((P/R2).*(Vi.*R1./(R1+LDR)));
        msgbox(['V output value: ' num2str(V0),'V']);
    case 4
        hold on;
        imshow('D:\Modül Porjesi\Devre şeması.png')
        prompt = {'What is the min operating voltage value of your led (V)','What is the max operating voltage value of your led (V)',...
    'What is the min operating current value of your led (ma)','What is the max operating current value of your led (mA)',...
    'Enter the value of the power supply (V)'};
        dlgtitle = 'High current protection resistance calculation ';
        dims = 1;
        definput = {'','','','',''};
        value = inputdlg(prompt,dlgtitle,dims,definput);
        V_min= str2double(value{1});
        V_max = str2double(value{2});
        I_min = str2double(value{3}) / 1000; 
        I_max = str2double(value{4}) / 1000; 
        V_S = str2double(value{5});
        R_limmin=(V_S-V_max)/I_max;
        R_limmax=(V_S-V_min)/I_min;
        mesaj = sprintf('Min protection resistance: %s ohm\nMax protection resistance: %s ohm', num2str(R_limmin), num2str(R_limmax));
        msgbox(mesaj);
    case 5
        msgbox('Programme closed successfully')
       clear all;close all;clc;
        break 
  end
  end
      



