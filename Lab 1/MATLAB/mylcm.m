function out = mylcm(vect)
        if (~all(vect)>0)
            disp("All numbers should be positive integers.")
            out = 0;
        else
            n = length(vect);
            for i=1:n-1
                temp = lcm(vect(i),vect(i+1));
                vect(i+1) = temp;
            end
            out = vect(end);
        end
end