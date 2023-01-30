load starData

% calculate the speed of all the stars in spectra
[sHa,idx] = min(spectra);
lambdaHa = lambda(idx);
z = lambdaHa/656.28 - 1;
speed = z*299792.458

% plotting spectra of all seven stars using different line properties for redshifted and blueshifted spectra
for v = 1:7
    s = spectra(:,v);

    if speed(v) <= 0
        plot(lambda,s,"--")
    else
        plot(lambda,s,"LineWidth",3) 
    end
    hold on
end
hold off

legend(starnames)
movaway = starnames(speed > 0) 