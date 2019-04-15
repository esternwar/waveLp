signalSize = 6001;
noise = 2*normrnd(0,0.7, 100, signalSize);
fid = fopen('noisez.txt', 'wb'); 
fwrite(fid, noise, 'double');
fclose(fid);  

% fid = fopen('noisez.txt', 'rb'); 
% B = fread(fid, [signalSize, 100], 'double');
% fclose(fid);
