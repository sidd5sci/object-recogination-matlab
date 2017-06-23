
doi = 5;
%% setting up the connection to the aurdino uno
arduino=serial('COM3','BaudRate',9600); % create serial communication object
disp(arduino);
fopen(arduino); % initiate arduino communication
%fprintf(arduino, '%s', char(doi)); % send answer variable content to arduino

fgets(arduino);% read the data comming from the arduino

fclose(arduino); 