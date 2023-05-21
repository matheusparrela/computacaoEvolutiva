function FX = rastrigin(POP)
    dim = size(POP,2);
    FX = 10*dim;

    for d = 1:dim
        FX = FX + (POP(d)-1)^2 - 10*cos(2*pi*(POP(d)-1));
    end
end