function [b_tx] =  bit_gen( pkt_size, sample_per_smbl)
    rng(1)
    k = log2(sample_per_smbl);
    randomtemp = randi(2,k*pkt_size,1) - 1;
    b_tx = reshape(randomtemp,pkt_size,k);
end