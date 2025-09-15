## RS544522_Encoder-Decoder_Hardware

# Encoder
1. ./Encoder/LFSR_lal8_pipe8 并行度8的级联LFSR进行编码，需要522/8 = 66个周期完成帧编码
2. ./Encoder/Matix_Parallel  矩阵乘法的架构进行编码，并行度为7需要522/7= 75个周期完成帧编码
3. ./Dec_syndrome            22路并行，每路32个常亮乘法器计算校正子，共544/32=17个周期完成校正子计算
4. ./Dec_RiBM                RiBM算法，1个时钟周期装载load，22个周期迭代，共需要23/24个时钟周期完成关键方程求解