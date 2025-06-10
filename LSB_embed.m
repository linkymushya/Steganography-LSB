function stego_image = LSB_embed(cover_image, secret_msg)
    num_msg = unicode2native(secret_msg, 'UTF-8');
    bin_msg = '';
    for i = 1:length(num_msg)
        bin_msg = [bin_msg, dec2bin(num_msg(i), 8)];
    end
    bin_msg = [bin_msg '1111111111111110']; % 添加结束标记
   
    [h, w, ~] = size(cover_image);
    total_bits = h * w;

    if length(bin_msg) > total_bits
        error('信息量超过图像容量');
    end
    
    % LSB嵌入
    stego_image = cover_image;
    bin_idx = 1;
    for i = 1:h
        for j = 1:w
            if bin_idx <= length(bin_msg)
                stego_image(i, j) = bitset(stego_image(i, j), 1, str2double(bin_msg(bin_idx)));
                bin_idx = bin_idx + 1;
            end
        end
    end
end
