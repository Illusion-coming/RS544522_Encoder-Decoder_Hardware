// ============================================================
// Reorder — store_min_basic
// 约束实现：
//  1) 不使用 function/ROM，全部用最基本逻辑；
//  2) 接收阶段维护 pos_syn（GF 位置基址），每拍 +32；
//     本拍 32 个并行符号的写地址：syn[0]=pos_syn+31, …, syn[31]=pos_syn+0（mod 1023）；
//  3) Forney 纠错：由 CTRL 给出 apply_* 控制，直接在 rec_mem 上按地址写回（地址=forney_pos）；
//     写法为 RMW：rec_mem[bank][addr] <= rec_mem[bank][addr] ^ y；
//  4) A/B 乒乓：CAPTURE 与 APPLY/OUTPUT 永不在同一 Bank；
//  5) 输出模块后续从选定 Bank/存储(raw/rec) 的地址 0 开始顺序读出（65b 打包不在此处实现）。
//  说明：为完全避免地址映射，本模块选用 **GF 地址域**（0..1022）作为 RAM 直址，
//        接收/纠错/输出三处共用同一地址域。
// ============================================================

`timescale 1ns/1ps

module reorder_store #(
    parameter int W           = 10,
    parameter int M           = 32,
    parameter int N           = 544,        // 码字全地址0...544
    parameter int K           = 522,        // 有效字符全地址0...522
    parameter int CAP_CYCLES  = 17          // 544 符号 / 32 并行
    )(
    input  logic               clk_i,
    input  logic               rst_ni,

    // -------- RS Decoder：并行输入流 --------
    input  logic               synd_valid_i,
    input  logic               synd_start_i,
    input  logic               synd_last_i,         // 未用，保留
    input  logic [W-1:0]       synd_data_i [0:M-1], // [31]..[0]

    // -------- CTRL：纠错写使能（直接回写到 rec_mem） --------
    input  logic               apply_en_i,          // 1 拍脉冲
    input  logic               apply_sel_i,         // 0:A / 1:B —— 目标 Bank
    input  logic [9:0]         apply_pos_i,         // = forney_pos（0..1022）
    input  logic [W-1:0]       apply_y_i,           // = forney_y

    // -------- 乒乓控制 --------
    input  logic               cap_sel_i,           // 0:A / 1:B —— 当前接收写入 Bank
    output logic [1:0]         cap_done_o,          // A/B 捕获完成脉冲（17 拍）

    // -------- 输出读口（供 OUT 模块顺序读取） --------
    input  logic [1:0]         raw_rd_en_i,
    input  logic [9:0]         raw_rd_addr_i [0:1], // 0..1022
    output logic [W-1:0]       raw_rd_dout_o[0:1],

    input  logic [1:0]         rec_rd_en_i,
    input  logic [9:0]         rec_rd_addr_i [0:1], // 0..1022
    output logic [W-1:0]       rec_rd_dout_o[0:1]
    );
    // ---------- 建议的内存声明（A/B 两个 bank） ----------
    localparam int BANKS = 2;
    logic [W-1:0] raw_mem [0:BANKS-1][0:N-1];
    logic [W-1:0] rec_mem [0:BANKS-1][0:N-1];

    // ---------------- 捕获基址 pos_syn（GF 域） ----------------
    // 语义：本拍 lane[31] 的写地址 = pos_syn + 0（mod N）
    //       lane[0 ] 的写地址 = pos_syn + 31（mod N）
    logic [9:0] pos_syn;           // 0..521
    logic       capturing;

    always @(posedge clk_i or negedge rst_ni) begin
        if(!rst_ni) begin
            capturing  <= 'b0;
            cap_done_o <= 'b0;
        end else if(synd_start_i) begin
            capturing  <= 'b1;
            cap_done_o[cap_sel_i] <= 'b0;
        end else if(synd_last_i) begin
            capturing  <= 'b0;
            cap_done_o[cap_sel_i] <= 'b1;
        end else begin
            capturing  <= capturing;
            cap_done_o <= 'b0;
        end
    end

    always @(posedge clk_i or negedge rst_ni) begin
        if(!rst_ni) begin
            pos_syn <= 'b0;
        end else if(capturing) begin
            pos_syn <= pos_syn + M;
        end else if(synd_last_i) begin
            pos_syn <= 'b0;
        end
    end

    integer i_raw;
    always @(posedge clk_i or negedge rst_ni) begin
        if(!rst_ni) begin
            for(i_raw = 0; i_raw < N; i_raw = i_raw + 'b1) 
                raw_mem[0][i_raw] <= 'b0;
                raw_mem[1][i_raw] <= 'b0;
        end else if(synd_valid_i) begin
            raw_mem[cap_sel_i][pos_syn      ]  <= synd_data_i[31];
            raw_mem[cap_sel_i][pos_syn + 'd1]  <= synd_data_i[30];
            raw_mem[cap_sel_i][pos_syn + 'd2]  <= synd_data_i[29];
            raw_mem[cap_sel_i][pos_syn + 'd3]  <= synd_data_i[28];
            raw_mem[cap_sel_i][pos_syn + 'd4]  <= synd_data_i[27];
            raw_mem[cap_sel_i][pos_syn + 'd5]  <= synd_data_i[26];
            raw_mem[cap_sel_i][pos_syn + 'd6]  <= synd_data_i[25];
            raw_mem[cap_sel_i][pos_syn + 'd7]  <= synd_data_i[24];
            raw_mem[cap_sel_i][pos_syn + 'd8]  <= synd_data_i[23];
            raw_mem[cap_sel_i][pos_syn + 'd9]  <= synd_data_i[22];
            raw_mem[cap_sel_i][pos_syn + 'd10] <= synd_data_i[21];
            raw_mem[cap_sel_i][pos_syn + 'd11] <= synd_data_i[20];
            raw_mem[cap_sel_i][pos_syn + 'd12] <= synd_data_i[19];
            raw_mem[cap_sel_i][pos_syn + 'd13] <= synd_data_i[18];
            raw_mem[cap_sel_i][pos_syn + 'd14] <= synd_data_i[17];
            raw_mem[cap_sel_i][pos_syn + 'd15] <= synd_data_i[16];
            raw_mem[cap_sel_i][pos_syn + 'd16] <= synd_data_i[15];
            raw_mem[cap_sel_i][pos_syn + 'd17] <= synd_data_i[14];
            raw_mem[cap_sel_i][pos_syn + 'd18] <= synd_data_i[13];
            raw_mem[cap_sel_i][pos_syn + 'd19] <= synd_data_i[12];
            raw_mem[cap_sel_i][pos_syn + 'd20] <= synd_data_i[11];
            raw_mem[cap_sel_i][pos_syn + 'd21] <= synd_data_i[10];
            raw_mem[cap_sel_i][pos_syn + 'd22] <= synd_data_i[9];
            raw_mem[cap_sel_i][pos_syn + 'd23] <= synd_data_i[8];
            raw_mem[cap_sel_i][pos_syn + 'd24] <= synd_data_i[7];
            raw_mem[cap_sel_i][pos_syn + 'd25] <= synd_data_i[6];
            raw_mem[cap_sel_i][pos_syn + 'd26] <= synd_data_i[5];
            raw_mem[cap_sel_i][pos_syn + 'd27] <= synd_data_i[4];
            raw_mem[cap_sel_i][pos_syn + 'd28] <= synd_data_i[3];
            raw_mem[cap_sel_i][pos_syn + 'd29] <= synd_data_i[2];
            raw_mem[cap_sel_i][pos_syn + 'd30] <= synd_data_i[1];
            raw_mem[cap_sel_i][pos_syn + 'd31] <= synd_data_i[0];
        end
    end

    integer i_rec;
    always @(posedge clk_i or negedge rst_ni) begin
        if(!rst_ni) begin
            for(i_rec = 0; i_rec < N; i_rec = i_rec + 'b1) 
                rec_mem[0][i_rec] <= 'b0;
                rec_mem[1][i_rec] <= 'b0;
        end else if(synd_valid_i) begin
            rec_mem[cap_sel_i][pos_syn      ]  <= synd_data_i[31];
            rec_mem[cap_sel_i][pos_syn + 'd1]  <= synd_data_i[30];
            rec_mem[cap_sel_i][pos_syn + 'd2]  <= synd_data_i[29];
            rec_mem[cap_sel_i][pos_syn + 'd3]  <= synd_data_i[28];
            rec_mem[cap_sel_i][pos_syn + 'd4]  <= synd_data_i[27];
            rec_mem[cap_sel_i][pos_syn + 'd5]  <= synd_data_i[26];
            rec_mem[cap_sel_i][pos_syn + 'd6]  <= synd_data_i[25];
            rec_mem[cap_sel_i][pos_syn + 'd7]  <= synd_data_i[24];
            rec_mem[cap_sel_i][pos_syn + 'd8]  <= synd_data_i[23];
            rec_mem[cap_sel_i][pos_syn + 'd9]  <= synd_data_i[22];
            rec_mem[cap_sel_i][pos_syn + 'd10] <= synd_data_i[21];
            rec_mem[cap_sel_i][pos_syn + 'd11] <= synd_data_i[20];
            rec_mem[cap_sel_i][pos_syn + 'd12] <= synd_data_i[19];
            rec_mem[cap_sel_i][pos_syn + 'd13] <= synd_data_i[18];
            rec_mem[cap_sel_i][pos_syn + 'd14] <= synd_data_i[17];
            rec_mem[cap_sel_i][pos_syn + 'd15] <= synd_data_i[16];
            rec_mem[cap_sel_i][pos_syn + 'd16] <= synd_data_i[15];
            rec_mem[cap_sel_i][pos_syn + 'd17] <= synd_data_i[14];
            rec_mem[cap_sel_i][pos_syn + 'd18] <= synd_data_i[13];
            rec_mem[cap_sel_i][pos_syn + 'd19] <= synd_data_i[12];
            rec_mem[cap_sel_i][pos_syn + 'd20] <= synd_data_i[11];
            rec_mem[cap_sel_i][pos_syn + 'd21] <= synd_data_i[10];
            rec_mem[cap_sel_i][pos_syn + 'd22] <= synd_data_i[9];
            rec_mem[cap_sel_i][pos_syn + 'd23] <= synd_data_i[8];
            rec_mem[cap_sel_i][pos_syn + 'd24] <= synd_data_i[7];
            rec_mem[cap_sel_i][pos_syn + 'd25] <= synd_data_i[6];
            rec_mem[cap_sel_i][pos_syn + 'd26] <= synd_data_i[5];
            rec_mem[cap_sel_i][pos_syn + 'd27] <= synd_data_i[4];
            rec_mem[cap_sel_i][pos_syn + 'd28] <= synd_data_i[3];
            rec_mem[cap_sel_i][pos_syn + 'd29] <= synd_data_i[2];
            rec_mem[cap_sel_i][pos_syn + 'd30] <= synd_data_i[1];
            rec_mem[cap_sel_i][pos_syn + 'd31] <= synd_data_i[0];
        end else if(apply_en_i) begin
            rec_mem[apply_sel_i][apply_pos_i] <= rec_mem[apply_sel_i][apply_pos_i] ^ apply_y_i;
        end
    end

    // ---------------- 读口（RAW/REC，供 OUT 顺序访问 0..N-1）
    genvar k;
    generate
        for (k = 0; k < 2; k++) begin : g_rd
            always @(posedge clk_i) begin
                if (raw_rd_en_i[k]) raw_rd_dout_o[k] <= raw_mem[k][raw_rd_addr_i[k]];
                if (rec_rd_en_i[k]) rec_rd_dout_o[k] <= rec_mem[k][rec_rd_addr_i[k]];
            end
        end
    endgenerate

endmodule
