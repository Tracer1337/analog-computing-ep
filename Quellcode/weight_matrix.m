function W = create3x3WeightMatrix(w12, w13, w23)
W = [0,    w12,  w13;
  w12,  0,    w23;
  w13,  w23,  0];
end
