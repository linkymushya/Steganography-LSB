cover_image = imread("img\logo.png");
imwrite(cover_image, "img\cover_image.png");
stego_image = LSB_embed(cover_image, "至诚至坚，博学笃行");
imwrite(stego_image, "img\stego_image.png");
extract_msg = LSB_extract(stego_image);
disp(extract_msg)
[psnr_val, ssim_val] = LSB_quality(cover_image, stego_image);
disp(psnr_val)
disp(ssim_val)
