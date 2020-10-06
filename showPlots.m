%% Graficar señales originales

fds = fileDatastore('C:\Users\Itiel BoGa\Documents\Universidad\9NO SEMESTRE\Lab. Proyecto Ingeniería II\Matlab\Data\Front Lying','ReadFcn',@load,'FileExtensions','.txt');
fullFileNames = fds.Files;
numFiles = length(fullFileNames);

fs = 25;
Ts = 1/fs;
s = tf('s');
g = s/(s+2*pi*4);

figure
n = 1;
for k = 56: 61

    Table = readtable(fullFileNames{k});
    atX=Table{:,10};
    atY=Table{:,11};
    atZ=Table{:,12};
    atX(any(isnan(atX), 2), :) = []; %Elimina Nan's
    atY(any(isnan(atY), 2), :) = []; %Elimina Nan's
    atZ(any(isnan(atZ), 2), :) = []; %Elimina Nan's
    
    t = 0:Ts:Ts*(length(atX)-1);
    SMV = sqrt( atX.^2 + atY.^2 + atZ.^2 );

    abX = lsim(g, atX', t');
    abY = lsim(g, atY', t');
    abZ = lsim(g, atZ', t');
    abSMV = lsim(g, SMV', t');

    abX = abX(10:end);
    abY = abY(10:end);
    abZ = abZ(10:end);
    abSMV = abSMV(10:end);
    t = t(10:end);
    
    subplot(2,3,n);
    plot(t,abY);
    title(['Señal en el tiempo #' num2str(k)]);
    n = n + 1;

end

figure
n = 1;
for k = 56: 61
    
    Table = readtable(fullFileNames{k});
    atX=Table{:,10};
    atY=Table{:,11};
    atZ=Table{:,12};
    atX(any(isnan(atX), 2), :) = []; %Elimina Nan's
    atY(any(isnan(atY), 2), :) = []; %Elimina Nan's
    atZ(any(isnan(atZ), 2), :) = []; %Elimina Nan's
    
    t = 0:Ts:Ts*(length(atX)-1);
    SMV = sqrt( atX.^2 + atY.^2 + atZ.^2 );

    abX = lsim(g, atX', t');
    abY = lsim(g, atY', t');
    abZ = lsim(g, atZ', t');
    abSMV = lsim(g, SMV', t');

    abX = abX(10:end);
    abY = abY(10:end);
    abZ = abZ(10:end);
    abSMV = abSMV(10:end);
    t = t(10:end);
    
    % PSD with numerical output
    [p,f] = pwelch(abSMV,[],[],[],fs);

    fmindist = 0.25;                    % Minimum distance in Hz
    N = 2*(length(f)-1);                % Number of FFT points
    minpkdist = floor(fmindist/(fs/N)); % Minimum number of frequency bins

    subplot(2,3,n);
    findpeaks(p,'minpeakdistance',minpkdist,'minpeakprominence', 0.10);
    title(['Señal en frecuencia #' num2str(k)]);
    n = n + 1;
    
end