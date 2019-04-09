signalSize = 6001;
noise = normrnd(0,0.1, 100, signalSize);
fid = fopen('noisez.txt', 'wb'); 
fwrite(fid, noise, 'double');
fclose(fid);  

% fid = fopen('noisez.txt', 'rb'); 
% B = fread(fid, [signalSize, 100], 'double');
% fclose(fid);
