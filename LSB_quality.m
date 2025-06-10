function [psnr, ssim_val] = LSB_quality(orig, stego)
    % PSNR计算
    mse = mean((orig(:)-stego(:)).^2);
    psnr = 10*log10(255^2/mse);
    
    % SSIM计算
    ssim_val = ssim(orig, stego);

end