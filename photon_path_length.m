function path_length = photon_path_length(delta_s, mfp)
   xr1=rand();
   A=mfp-delta_s;
   path_length=xr1*A+delta_s;

end