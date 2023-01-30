load starData
nObs = size(spectra,1)
lambdaStart = 630.02
lambdaDelta = 0.14


% create wavelength vector from recorded spectrum
lambdaEnd = lambdaStart + (nObs - 1)*lambdaDelta
lambda = (lambdaStart:lambdaDelta:lambdaEnd)

% extracting spectrum of star 
% replace the numerical value of variable s (1 - 7) for a different star spectrum
s = spectra(:,6)

plot(lambda,s,".-")
xlabel("Wavelength")
ylabel("Intensity")

% wavelength of the hydrogen-alpha line 
[sHa,idx] = min(s)
lambdaHa = lambda(idx)

%  location of the hydrogen-alpha line
hold on
plot(lambdaHa,sHa,"rs","MarkerSize",8)
hold off

% calculating redshift factor (the speed of the star relative to Earth)
z = lambdaHa/656.28 - 1
speed = z*299792.458