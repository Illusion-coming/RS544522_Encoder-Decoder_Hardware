## RS544522_Encoder-Decoder_Hardware

# Encoder
1. ./Encoder/LFSR_lal8_pipe8 并行度8的级联LFSR进行编码，需要522/8 = 66个周期完成帧编码
2. ./Encoder/Matix_Parallel  矩阵乘法的架构进行编码，并行度为7需要522/7= 75个周期完成帧编码

# Decode
1. ./Dec_syndrome            22路并行，每路32个常亮乘法器计算校正子，共544/32=17个周期完成校正子计算。
2. ./Dec_RiBM                RiBM算法，1个时钟周期装载load，22个周期迭代，共需要23/24个时钟周期完成关键方程求解。
3. ./Dec_chein               钱搜索算法，32路并行，每路11个乘法器，通过参数传递alpha的次方，避免查表。17+1个周期完成计算。
4. ./Dec_forney              forney算法，三级流水线，最坏情况 11+3/4 个周期完成错误值恢复。
                             查表法求得逆元，32个数据FIFO + 1个event fifo。 共消耗 10 + 5个乘法器和一个平方器。