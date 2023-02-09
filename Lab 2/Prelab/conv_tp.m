function [y] = conv_tp(x, h,Toeplitz)
    %Here we create the Toeplitz matrix using the built in function.
    if (Toeplitz == 1)
        xCirculant = toeplitz([x(1) zeros(1, length(h) - 1) ], [x zeros(1, length(h) - 1) ]);
   %Here we create the Toeplitz matrix without the built in function.
    elseif (Toeplitz == 0) 
        x = [x zeros(1, length(h) - 1)];
        xCirculant = gallery('circul',x);
        xCirculant = xCirculant(1:length(h),:);
        
    end
    %Here we perform the convolution.
     y = h * xCirculant;   
end