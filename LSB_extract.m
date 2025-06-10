function extract_msg = LSB_extract(stego_image)
    [h, w, ~] = size(stego_image);
    lsb_bits = zeros(1, h * w);
    idx = 1;
    
    for i = 1:h
        for j = 1:w
            lsb_bits(idx) = bitget(stego_image(i, j), 1);
            idx = idx + 1;
        end
    end
   
    bin_str = num2str(lsb_bits);
    bin_str = bin_str(bin_str ~= ' ');
    
    % 查找结束标记
    end_idx = strfind(bin_str, '1111111111111110');
    if isempty(end_idx)
        error('未检测到结束标记');
    end
    
    bin_data = bin_str(1:end_idx(1)-1);
    

    num_bytes = length(bin_data)/8;
    if mod(num_bytes,1) ~= 0
        error('二进制数据长度不是8的倍数');
    end
    byte_array = zeros(1, num_bytes, 'uint8');
    for i = 1:num_bytes
        byte_array(i) = bin2dec(bin_data(8*(i-1)+1:8*i));
    end
    
    % UTF-8解码
    extract_msg = native2unicode(byte_array, 'UTF-8');
end