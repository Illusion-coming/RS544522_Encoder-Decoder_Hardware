## RS544522_Encoder-Decoder_Hardware

# Encoder
1. ./Encoder/LFSR_lal8_pipe8 并行度8的级联LFSR进行编码，需要522/8 = 66个周期完成帧编码
2. ./Encoder/Matix_Parallel  矩阵乘法的架构进行编码，并行度为7需要522/7= 75个周期完成帧编码