function [cons, symbolEnergy] = constellation(M, modulationName)
    switch modulationName
        case 'pam'
            cons = -(M-1):2:(M-1);
        case 'psk'
            k = 0:(M-1);
            cons = exp(1j*2*pi.*k/M);
        case 'qam'
            mReal = 2^ceil(log2(sqrt(M)));
            mImag = 2^floor(log2(sqrt(M)));
            cons = (-(mReal-1):2:(mReal-1)).' + 1j*(-(mImag-1):2:(mImag-1));
            for i = 1:size(cons, 2)
                if mod(i, 2) == 0 
                    cons(:, i) = flip(cons(:, i));
                end
            end
            cons = cons(:).';
    end
    cons = (cons./sqrt((cons*cons')./M));
    symbolEnergy = (cons*cons')./M;
end

