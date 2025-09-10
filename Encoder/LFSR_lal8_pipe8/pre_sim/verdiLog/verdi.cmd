verdiSetActWin -dock widgetDock_<Decl._Tree>
debImport "-sv" "-f" "rtl_list.f" "-f" "sim_list.f"
debLoadSimResult \
           /home/EDA/work/IEEE802_3_CZ/Hardware/Encoder/LFSR_lal8_pipe8/pre_sim/dump.fsdb
wvCreateWindow
verdiSetActWin -win $_nWave2
verdiWindowResize -win $_Verdi_1 "432" "102" "900" "700"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiDockWidgetSetCurTab -dock widgetDock_<Message>
verdiSetActWin -dock widgetDock_<Message>
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
verdiSetActWin -win $_nWave2
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 -10 20 1785 317
wvResizeWindow -win $_nWave2 -10 20 1785 818
wvSetCursor -win $_nWave2 515755.355544
wvRestoreSignal -win $_nWave2 \
           "/home/EDA/work/IEEE802_3_CZ/Hardware/Encoder/LFSR_lal8_pipe8/pre_sim/signal_l8.rc" \
           -overWriteAutoAlias on -appendSignals on
wvUnknownSaveResult -win $_nWave2 -clear
verdiSetActWin -dock widgetDock_<Message>
verdiSetActWin -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "dut" 4 )} 
wvSetPosition -win $_nWave2 {("dut" 4)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("dut" 4)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSelectSignal -win $_nWave2 {( "dut" 4 )} 
wvSetPosition -win $_nWave2 {("dut" 4)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSelectSignal -win $_nWave2 {( "dut" 4 )} 
wvSetPosition -win $_nWave2 {("dut" 4)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("dut" 4)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSelectSignal -win $_nWave2 {( "dut" 1 )} 
wvSetPosition -win $_nWave2 {("dut" 1)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvScrollUp -win $_nWave2 7
wvScrollDown -win $_nWave2 19
wvScrollUp -win $_nWave2 503
wvSelectSignal -win $_nWave2 {( "dut" 1 )} 
wvSetPosition -win $_nWave2 {("dut" 1)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("dut" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "dut" 4 )} 
wvSetPosition -win $_nWave2 {("dut" 4)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvZoom -win $_nWave2 22013.352073 378629.655657
wvSetCursor -win $_nWave2 55093.711928 -snap {("dut" 13)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 673636.418857 816984.644894
wvSelectSignal -win $_nWave2 {( "dut" 4 )} 
wvSetPosition -win $_nWave2 {("dut" 4)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("dut" 4)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSelectSignal -win $_nWave2 {( "dut" 8 )} 
wvSelectSignal -win $_nWave2 {( "dut" 7 )} 
wvSelectSignal -win $_nWave2 {( "dut" 6 )} 
wvSelectSignal -win $_nWave2 {( "dut" 8 )} 
wvSetPosition -win $_nWave2 {("dut" 8)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("dut" 8)}
wvGetSignalOpen -win $_nWave2
wvGetSignalClose -win $_nWave2
wvSetPosition -win $_nWave2 {("dut" 8)}
wvAddSubGroup -win $_nWave2 {dut-1}
wvRenameGroup -win $_nWave2 {dut/dut-1} {stage1}
wvSelectGroup -win $_nWave2 {dut/stage1}
wvMoveSelected -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_rs544522_lal8_pipe_restruct_frontpad6"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_rs544522_lal8_pipe_restruct_frontpad6/u_ref"
wvGetSignalSetScope -win $_nWave2 "/tb_rs544522_lal8_pipe_restruct_frontpad6/dut"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/G_ST\[1\]"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/u_s0"
wvSetPosition -win $_nWave2 {("dut/stage1" 2)}
wvSetPosition -win $_nWave2 {("dut/stage1" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"dut" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/data_k\[0:521\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/parity_o\[0:21\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/parity_valid_o} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/s_blk_i\[0:7\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/clk} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/start_i} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/last_i} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/valid_i} \
}
wvAddSignal -win $_nWave2 -group {"dut/stage1" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/u_s0/rem_in\[0:21\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/u_s0/s_in\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"chk" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/clk} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/rst_ni} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_en} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_s\[9:0\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/i\[31:0\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_start} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_rem\[0:21\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "dut/stage1" 1 2 )} 
wvSetPosition -win $_nWave2 {("dut/stage1" 2)}
wvSetPosition -win $_nWave2 {("dut/stage1" 2)}
wvSetPosition -win $_nWave2 {("dut/stage1" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"dut" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/data_k\[0:521\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/parity_o\[0:21\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/parity_valid_o} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/s_blk_i\[0:7\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/clk} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/start_i} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/last_i} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/valid_i} \
}
wvAddSignal -win $_nWave2 -group {"dut/stage1" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/u_s0/rem_in\[0:21\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/u_s0/s_in\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"chk" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/clk} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/rst_ni} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_en} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_s\[9:0\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/i\[31:0\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_start} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_rem\[0:21\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "dut/stage1" 1 2 )} 
wvSetPosition -win $_nWave2 {("dut/stage1" 2)}
wvGetSignalClose -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectGroup -win $_nWave2 {dut/stage1}
wvSetPosition -win $_nWave2 {("dut/stage1" 0)}
wvSelectGroup -win $_nWave2 {dut/stage1}
wvSelectSignal -win $_nWave2 {( "dut/stage1" 2 )} 
wvSetPosition -win $_nWave2 {("dut/stage1" 2)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("dut/stage1" 2)}
wvSelectGroup -win $_nWave2 {dut}
wvSetPosition -win $_nWave2 {("dut" 0)}
wvMoveSelected -win $_nWave2
wvGoToGroup -win $_nWave2 "G1"
wvSetPosition -win $_nWave2 {("dut" 0)}
wvAddSubGroup -win $_nWave2 {dut-2}
wvRenameGroup -win $_nWave2 {dut/dut-2} {stage8}
wvSelectGroup -win $_nWave2 {dut/stage8}
wvSetPosition -win $_nWave2 {("dut" 3)}
wvSetPosition -win $_nWave2 {("dut" 4)}
wvSetPosition -win $_nWave2 {("dut" 5)}
wvSetPosition -win $_nWave2 {("dut" 6)}
wvSetPosition -win $_nWave2 {("dut" 7)}
wvSetPosition -win $_nWave2 {("dut" 8)}
wvSetPosition -win $_nWave2 {("dut" 9)}
wvSetPosition -win $_nWave2 {("dut/stage1" 0)}
wvSetPosition -win $_nWave2 {("dut/stage1" 1)}
wvSetPosition -win $_nWave2 {("dut/stage1" 2)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("stage8" 0)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_rs544522_lal8_pipe_restruct_frontpad6"
wvGetSignalSetScope -win $_nWave2 "/tb_rs544522_lal8_pipe_restruct_frontpad6/dut"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/u_s0"
wvGetSignalSetScope -win $_nWave2 "/tb_rs544522_lal8_pipe_restruct_frontpad6/dut"
wvSetPosition -win $_nWave2 {("stage8" 4)}
wvSetPosition -win $_nWave2 {("stage8" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"dut" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/data_k\[0:521\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/parity_o\[0:21\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/parity_valid_o} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/s_blk_i\[0:7\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/clk} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/start_i} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/last_i} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/valid_i} \
}
wvAddSignal -win $_nWave2 -group {"dut/stage1" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/u_s0/rem_in\[0:21\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/u_s0/s_in\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"stage8" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/last_d\[0:7\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/last_i} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/v_d\[0:7\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/valid_i} \
}
wvAddSignal -win $_nWave2 -group {"chk" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/clk} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/rst_ni} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_en} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_s\[9:0\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/i\[31:0\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_start} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_rem\[0:21\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "stage8" 1 2 3 4 )} 
wvSetPosition -win $_nWave2 {("stage8" 4)}
wvSetPosition -win $_nWave2 {("stage8" 4)}
wvSetPosition -win $_nWave2 {("stage8" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"dut" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/data_k\[0:521\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/parity_o\[0:21\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/parity_valid_o} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/s_blk_i\[0:7\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/clk} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/start_i} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/last_i} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/valid_i} \
}
wvAddSignal -win $_nWave2 -group {"dut/stage1" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/u_s0/rem_in\[0:21\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/u_s0/s_in\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"stage8" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/last_d\[0:7\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/last_i} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/v_d\[0:7\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/valid_i} \
}
wvAddSignal -win $_nWave2 -group {"chk" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/clk} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/rst_ni} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_en} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_s\[9:0\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/i\[31:0\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_start} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_rem\[0:21\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "stage8" 1 2 3 4 )} 
wvSetPosition -win $_nWave2 {("stage8" 4)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "stage8" 1 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 602808.000424 757539.465773
wvSelectSignal -win $_nWave2 {( "stage8" 1 )} 
wvSetPosition -win $_nWave2 {("stage8" 1)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("stage8" 12)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "stage8" 1 )} 
wvSetPosition -win $_nWave2 {("stage8" 1)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("stage8" 1)}
wvSetPosition -win $_nWave2 {("stage8" 4)}
wvSelectSignal -win $_nWave2 {( "stage8" 1 )} 
wvSelectSignal -win $_nWave2 {( "stage8" 1 )} 
wvSetPosition -win $_nWave2 {("stage8" 1)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("stage8" 12)}
wvSelectSignal -win $_nWave2 {( "stage8" 1 )} 
wvSetPosition -win $_nWave2 {("stage8" 1)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("stage8" 1)}
wvSetPosition -win $_nWave2 {("stage8" 4)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_rs544522_lal8_pipe_restruct_frontpad6"
wvGetSignalSetScope -win $_nWave2 "/tb_rs544522_lal8_pipe_restruct_frontpad6/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_rs544522_lal8_pipe_restruct_frontpad6/dut"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/G_ST\[7\]"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/G_ST\[7\]/u_si"
wvSetPosition -win $_nWave2 {("stage8" 7)}
wvSetPosition -win $_nWave2 {("stage8" 7)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"dut" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/data_k\[0:521\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/parity_o\[0:21\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/parity_valid_o} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/s_blk_i\[0:7\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/clk} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/start_i} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/last_i} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/valid_i} \
}
wvAddSignal -win $_nWave2 -group {"dut/stage1" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/u_s0/rem_in\[0:21\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/u_s0/s_in\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"stage8" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/last_d\[0:7\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/last_i} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/v_d\[0:7\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/valid_i} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/G_ST\[7\]/u_si/rem_in\[0:21\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/G_ST\[7\]/u_si/rem_out\[0:21\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/G_ST\[7\]/u_si/s_in\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"chk" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/clk} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/rst_ni} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_en} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_s\[9:0\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/i\[31:0\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_start} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_rem\[0:21\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "stage8" 5 6 7 )} 
wvSetPosition -win $_nWave2 {("stage8" 7)}
wvSetPosition -win $_nWave2 {("stage8" 7)}
wvSetPosition -win $_nWave2 {("stage8" 7)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"dut" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/data_k\[0:521\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/parity_o\[0:21\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/parity_valid_o} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/s_blk_i\[0:7\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/clk} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/start_i} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/last_i} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/valid_i} \
}
wvAddSignal -win $_nWave2 -group {"dut/stage1" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/u_s0/rem_in\[0:21\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/u_s0/s_in\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"stage8" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/last_d\[0:7\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/last_i} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/v_d\[0:7\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/valid_i} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/G_ST\[7\]/u_si/rem_in\[0:21\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/G_ST\[7\]/u_si/rem_out\[0:21\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/G_ST\[7\]/u_si/s_in\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"chk" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/clk} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/rst_ni} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_en} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_s\[9:0\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/i\[31:0\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_start} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_rem\[0:21\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "stage8" 5 6 7 )} 
wvSetPosition -win $_nWave2 {("stage8" 7)}
wvGetSignalClose -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "dut" 3 )} 
wvZoom -win $_nWave2 751069.668030 781515.775056
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "stage8" 6 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectGroup -win $_nWave2 {stage8}
wvSetPosition -win $_nWave2 {("stage8" 0)}
wvSelectGroup -win $_nWave2 {dut/stage1}
wvSelectSignal -win $_nWave2 {( "dut" 2 )} 
wvSelectSignal -win $_nWave2 {( "dut" 4 )} 
wvSetPosition -win $_nWave2 {("dut" 4)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("dut" 4)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_rs544522_lal8_pipe_restruct_frontpad6"
wvGetSignalSetScope -win $_nWave2 "/tb_rs544522_lal8_pipe_restruct_frontpad6/dut"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/G_ST\[7\]"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/G_ST\[7\]/u_si"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/G_ST\[7\]"
wvGetSignalSetScope -win $_nWave2 "/tb_rs544522_lal8_pipe_restruct_frontpad6/dut"
wvSetPosition -win $_nWave2 {("dut" 5)}
wvSetPosition -win $_nWave2 {("dut" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"dut" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/data_k\[0:521\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/parity_o\[0:21\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/parity_valid_o} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/s_blk_i\[0:7\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/s_vec\[0:7\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/clk} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/start_i} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/last_i} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/valid_i} \
}
wvAddSignal -win $_nWave2 -group {"dut/stage1" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/u_s0/rem_in\[0:21\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/u_s0/s_in\[9:0\]} \
}
wvCollapseGroup -win $_nWave2 "dut/stage1"
wvAddSignal -win $_nWave2 -group {"stage8" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/last_d\[0:7\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/last_i} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/v_d\[0:7\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/valid_i} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/G_ST\[7\]/u_si/rem_in\[0:21\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/G_ST\[7\]/u_si/rem_out\[0:21\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/G_ST\[7\]/u_si/s_in\[9:0\]} \
}
wvCollapseGroup -win $_nWave2 "stage8"
wvAddSignal -win $_nWave2 -group {"chk" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/clk} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/rst_ni} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_en} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_s\[9:0\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/i\[31:0\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_start} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_rem\[0:21\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "dut" 5 )} 
wvSetPosition -win $_nWave2 {("dut" 5)}
wvSetPosition -win $_nWave2 {("dut" 5)}
wvSetPosition -win $_nWave2 {("dut" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"dut" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/data_k\[0:521\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/parity_o\[0:21\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/parity_valid_o} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/s_blk_i\[0:7\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/s_vec\[0:7\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/clk} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/start_i} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/last_i} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/valid_i} \
}
wvAddSignal -win $_nWave2 -group {"dut/stage1" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/u_s0/rem_in\[0:21\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/u_s0/s_in\[9:0\]} \
}
wvCollapseGroup -win $_nWave2 "dut/stage1"
wvAddSignal -win $_nWave2 -group {"stage8" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/last_d\[0:7\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/last_i} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/v_d\[0:7\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/valid_i} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/G_ST\[7\]/u_si/rem_in\[0:21\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/G_ST\[7\]/u_si/rem_out\[0:21\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/dut/G_ST\[7\]/u_si/s_in\[9:0\]} \
}
wvCollapseGroup -win $_nWave2 "stage8"
wvAddSignal -win $_nWave2 -group {"chk" \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/clk} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/rst_ni} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_en} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_s\[9:0\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/i\[31:0\]} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_start} \
{/tb_rs544522_lal8_pipe_restruct_frontpad6/chk_rem\[0:21\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "dut" 5 )} 
wvSetPosition -win $_nWave2 {("dut" 5)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "dut" 5 )} 
wvExpandBus -win $_nWave2
wvSelectGroup -win $_nWave2 {stage8}
wvSelectGroup -win $_nWave2 {stage8}
wvSelectGroup -win $_nWave2 {stage8}
wvSelectGroup -win $_nWave2 {stage8}
wvSelectGroup -win $_nWave2 {dut/stage1}
wvSelectGroup -win $_nWave2 {dut/stage1}
wvSelectSignal -win $_nWave2 {( "stage8" 5 )} 
wvZoom -win $_nWave2 754498.607281 792839.734330
wvSelectGroup -win $_nWave2 {stage8}
wvSelectSignal -win $_nWave2 {( "dut" 5 )} 
wvSetPosition -win $_nWave2 {("dut" 5)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("dut" 5)}
wvSelectSignal -win $_nWave2 {( "dut" 5 )} 
wvExpandBus -win $_nWave2
wvSelectSignal -win $_nWave2 {( "dut" 3 )} 
wvSelectSignal -win $_nWave2 {( "dut" 15 )} 
wvSetCursor -win $_nWave2 16705.199417 -snap {("dut" 15)}
wvSearchNext -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 52702.209773 65096.389986
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 125143.767599 -snap {("dut" 13)}
wvSetCursor -win $_nWave2 134480.774759 -snap {("dut" 13)}
wvSelectGroup -win $_nWave2 {stage8}
wvSetCursor -win $_nWave2 125422.484231 -snap {("stage8" 6)}
wvSelectSignal -win $_nWave2 {( "stage8" 6 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 318294.393315 -snap {("G1" 0)}
wvSaveSignal -win $_nWave2 \
           "/home/EDA/work/IEEE802_3_CZ/Hardware/Encoder/LFSR_lal8_pipe8/pre_sim/signal_l8.rc"
wvTpfCloseForm -win $_nWave2
wvGetSignalClose -win $_nWave2
wvCloseWindow -win $_nWave2
verdiSetActWin -dock widgetDock_<Message>
debExit
