verdiSetActWin -dock widgetDock_<Message>
debImport "-sv" "-f" "rtl_list.f" "-f" "sim_list.f"
debLoadSimResult \
           /home/EDA/work/IEEE802_3_CZ/Hardware/RS_Decoder/pre_sim/dump.fsdb
wvCreateWindow
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 0 0 1718 815
verdiSetActWin -win $_nWave2
wvResizeWindow -win $_nWave2 0 0 1718 815
wvSetCursor -win $_nWave2 54662.519440
wvRestoreSignal -win $_nWave2 \
           "/home/EDA/work/IEEE802_3_CZ/Hardware/RS_Decoder/pre_sim/signal.rc" \
           -overWriteAutoAlias on -appendSignals on
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "forney_chien/ribm_output" 1 )} 
wvSetPosition -win $_nWave2 {("forney_chien/ribm_output" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("forney_chien/ribm_output" 1)}
wvGetSignalOpen -win $_nWave2
wvGetSignalClose -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "syndromes" 7 )} 
wvSelectSignal -win $_nWave2 {( "syndromes" 7 )} 
wvSetPosition -win $_nWave2 {("syndromes" 7)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("forney_chien/ribm_output" 1)}
wvSelectSignal -win $_nWave2 {( "syndromes" 7 )} 
wvSetPosition -win $_nWave2 {("syndromes" 7)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("syndromes" 7)}
wvSetPosition -win $_nWave2 {("forney_chien/ribm_output" 1)}
wvSelectSignal -win $_nWave2 {( "syndromes" 1 )} 
wvSelectSignal -win $_nWave2 {( "syndromes" 3 )} 
wvSelectSignal -win $_nWave2 {( "syndromes" 2 )} 
wvSetPosition -win $_nWave2 {("syndromes" 2)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("syndromes" 2)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/chien_consts_pkg"
wvGetSignalSetScope -win $_nWave2 "/tb_rs_544_522_decoder_top"
wvGetSignalSetScope -win $_nWave2 "/tb_rs_544_522_decoder_top/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_rs_544_522_decoder_top/dut/u_cf"
wvGetSignalSetScope -win $_nWave2 "/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk"
wvGetSignalSetScope -win $_nWave2 "/tb_rs_544_522_decoder_top/dut/u_cf"
wvGetSignalSetScope -win $_nWave2 "/tb_rs_544_522_decoder_top/dut"
wvSetPosition -win $_nWave2 {("syndromes" 6)}
wvSetPosition -win $_nWave2 {("syndromes" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"syndromes" \
{/tb_rs_544_522_decoder_top/dut/clk_i} \
{/tb_rs_544_522_decoder_top/dut/rst_ni} \
{/tb_rs_544_522_decoder_top/dut/cw_start_i} \
{/tb_rs_544_522_decoder_top/dut/synd_data_i\[0:31\]} \
{/tb_rs_544_522_decoder_top/dut/synd_last_i} \
{/tb_rs_544_522_decoder_top/dut/synd_s_valid_o} \
{/tb_rs_544_522_decoder_top/dut/synd_start_i} \
{/tb_rs_544_522_decoder_top/dut/synd_last_i} \
{/tb_rs_544_522_decoder_top/dut/synd_valid_i} \
{/tb_rs_544_522_decoder_top/dut/synd_s_valid_o} \
{/tb_rs_544_522_decoder_top/dut/s_vec\[0:21\]} \
}
wvAddSignal -win $_nWave2 -group {"forney_chien" \
}
wvAddSignal -win $_nWave2 -group {"forney_chien/ribm_imput" \
{/tb_rs_544_522_decoder_top/dut/ribm_result_valid_o} \
{/tb_rs_544_522_decoder_top/dut/sigma_bus\[0:11\]} \
{/tb_rs_544_522_decoder_top/dut/v_bus\[0:10\]} \
{/tb_rs_544_522_decoder_top/dut/sigma_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"forney_chien/ribm_output" \
{/tb_rs_544_522_decoder_top/dut/cw_start_i} \
{/tb_rs_544_522_decoder_top/dut/exceed_o} \
{/tb_rs_544_522_decoder_top/dut/ecc_valid_o} \
{/tb_rs_544_522_decoder_top/dut/forney_den_zero_o} \
{/tb_rs_544_522_decoder_top/dut/forney_s3_rdy_i} \
{/tb_rs_544_522_decoder_top/dut/forney_pos_o\[9:0\]} \
{/tb_rs_544_522_decoder_top/dut/forney_y_o\[9:0\]} \
{/tb_rs_544_522_decoder_top/dut/forney_vld_o} \
{/tb_rs_544_522_decoder_top/dut/recorrect_done_o} \
}
wvAddSignal -win $_nWave2 -group {"ribm" \
{/tb_rs_544_522_decoder_top/dut/syn_bus\[0:22\]} \
{/tb_rs_544_522_decoder_top/dut/synd_s_valid_o} \
{/tb_rs_544_522_decoder_top/dut/ribm_start_i} \
{/tb_rs_544_522_decoder_top/dut/sigma_bus\[0:11\]} \
{/tb_rs_544_522_decoder_top/dut/v_bus\[0:10\]} \
{/tb_rs_544_522_decoder_top/dut/ribm_done_o} \
{/tb_rs_544_522_decoder_top/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"ecc_overcap_checker" \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/clk_i} \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/rst_ni} \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/cw_start_i} \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/sigma_low_i\[0:11\]} \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/sigma_start_i} \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/sigma_valid_i} \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/chien_busy_o} \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/chien_done_o} \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/hit_mask_w\[31:0\]} \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/root_cnt_q\[3:0\]} \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/root_cnt_valid} \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/deg_sigma_now\[3:0\]} \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/exceed_o} \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/result_valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "syndromes" 3 4 5 6 )} 
wvSetPosition -win $_nWave2 {("syndromes" 6)}
wvSetPosition -win $_nWave2 {("syndromes" 6)}
wvSetPosition -win $_nWave2 {("syndromes" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"syndromes" \
{/tb_rs_544_522_decoder_top/dut/clk_i} \
{/tb_rs_544_522_decoder_top/dut/rst_ni} \
{/tb_rs_544_522_decoder_top/dut/cw_start_i} \
{/tb_rs_544_522_decoder_top/dut/synd_data_i\[0:31\]} \
{/tb_rs_544_522_decoder_top/dut/synd_last_i} \
{/tb_rs_544_522_decoder_top/dut/synd_s_valid_o} \
{/tb_rs_544_522_decoder_top/dut/synd_start_i} \
{/tb_rs_544_522_decoder_top/dut/synd_last_i} \
{/tb_rs_544_522_decoder_top/dut/synd_valid_i} \
{/tb_rs_544_522_decoder_top/dut/synd_s_valid_o} \
{/tb_rs_544_522_decoder_top/dut/s_vec\[0:21\]} \
}
wvAddSignal -win $_nWave2 -group {"forney_chien" \
}
wvAddSignal -win $_nWave2 -group {"forney_chien/ribm_imput" \
{/tb_rs_544_522_decoder_top/dut/ribm_result_valid_o} \
{/tb_rs_544_522_decoder_top/dut/sigma_bus\[0:11\]} \
{/tb_rs_544_522_decoder_top/dut/v_bus\[0:10\]} \
{/tb_rs_544_522_decoder_top/dut/sigma_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"forney_chien/ribm_output" \
{/tb_rs_544_522_decoder_top/dut/cw_start_i} \
{/tb_rs_544_522_decoder_top/dut/exceed_o} \
{/tb_rs_544_522_decoder_top/dut/ecc_valid_o} \
{/tb_rs_544_522_decoder_top/dut/forney_den_zero_o} \
{/tb_rs_544_522_decoder_top/dut/forney_s3_rdy_i} \
{/tb_rs_544_522_decoder_top/dut/forney_pos_o\[9:0\]} \
{/tb_rs_544_522_decoder_top/dut/forney_y_o\[9:0\]} \
{/tb_rs_544_522_decoder_top/dut/forney_vld_o} \
{/tb_rs_544_522_decoder_top/dut/recorrect_done_o} \
}
wvAddSignal -win $_nWave2 -group {"ribm" \
{/tb_rs_544_522_decoder_top/dut/syn_bus\[0:22\]} \
{/tb_rs_544_522_decoder_top/dut/synd_s_valid_o} \
{/tb_rs_544_522_decoder_top/dut/ribm_start_i} \
{/tb_rs_544_522_decoder_top/dut/sigma_bus\[0:11\]} \
{/tb_rs_544_522_decoder_top/dut/v_bus\[0:10\]} \
{/tb_rs_544_522_decoder_top/dut/ribm_done_o} \
{/tb_rs_544_522_decoder_top/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"ecc_overcap_checker" \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/clk_i} \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/rst_ni} \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/cw_start_i} \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/sigma_low_i\[0:11\]} \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/sigma_start_i} \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/sigma_valid_i} \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/chien_busy_o} \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/chien_done_o} \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/hit_mask_w\[31:0\]} \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/root_cnt_q\[3:0\]} \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/root_cnt_valid} \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/deg_sigma_now\[3:0\]} \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/exceed_o} \
{/tb_rs_544_522_decoder_top/dut/u_cf/u_eccchk/result_valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "syndromes" 3 4 5 6 )} 
wvSetPosition -win $_nWave2 {("syndromes" 6)}
wvGetSignalClose -win $_nWave2
wvScrollUp -win $_nWave2 6
wvSelectSignal -win $_nWave2 {( "syndromes" 5 )} 
wvSelectSignal -win $_nWave2 {( "syndromes" 4 )} 
wvSaveSignal -win $_nWave2 \
           "/home/EDA/work/IEEE802_3_CZ/Hardware/RS_Decoder/pre_sim/signal.rc"
wvSelectSignal -win $_nWave2 {( "syndromes" 4 )} 
wvSelectSignal -win $_nWave2 {( "syndromes" 4 )} 
wvSetPosition -win $_nWave2 {("syndromes" 4)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("syndromes" 38)}
wvSetCursor -win $_nWave2 130567.651633 -snap {("syndromes" 5)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 6
wvScrollDown -win $_nWave2 2
wvZoom -win $_nWave2 119743.390358 154922.239502
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "syndromes" 36 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
