function ssim_val = ssim(cover_image, stego_image)
    C_1 = 0.01 * 255;
    C_2 = 0.03 * 255;
    C_3 = C_2 / 2;
    avg_cover = mean(cover_image(:));
    avg_stego = mean(stego_image(:));
    var_cover = var(double(cover_image(:)));
    var_stego = var(double(stego_image(:)));
    cov_total = cov(double(cover_image(:)), double(stego_image(:)));
    cov_single = cov_total(1,2);
   
    luminance_val = (2*avg_stego*avg_cover + C_1)/(avg_cover^2 + avg_stego^2 + C_1);
    contrast_val = (2*var_stego*var_cover + C_2)/(var_stego + var_cover + C_2);
    construct_val = (cov_single + C_3)/(var_stego*var_cover + C_3);
    
    ssim_val = luminance_val*construct_val*contrast_val;
end