verdiSetActWin -dock widgetDock_<Message>
debImport "-sv" "-f" "rtl_list.f" "-f" "sim_list.f"
debLoadSimResult \
           /home/EDA/work/IEEE802_3_CZ/Hardware/Dec_forney/pre_sim/dump.fsdb
wvCreateWindow
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiDockWidgetSetCurTab -dock widgetDock_<Message>
verdiSetActWin -dock widgetDock_<Message>
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
verdiSetActWin -win $_nWave2
verdiDockWidgetSetCurTab -dock widgetDock_<Message>
verdiSetActWin -dock widgetDock_<Message>
nsMsgSelect -range {0 34-34}
nsMsgSelect -range {0 5-5}
nsMsgSelect -range {0 7-7}
nsMsgSelect -range {0 9-9}
nsMsgSelect -range {0 3-3}
nsMsgSelect -range {0 4-4}
nsMsgSelect -range {0 5-5}
nsMsgSelect -range {0 6-6}
nsMsgSelect -range {0 7-7}
nsMsgSelect -range {0 24-24}
nsMsgSelect -range {0 25-25}
nsMsgSelect -range {0 26-26}
nsMsgSelect -range {0 27-27}
nsMsgSelect -range {0 28-28}
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
verdiSetActWin -win $_nWave2
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 0 0 1718 815
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/chien_consts_pkg"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut"
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave2 {("G1" 8)}
wvGetSignalClose -win $_nWave2
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
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 )} 
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 8)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 57950928.677563 120359621.099554
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectGroup -win $_nWave2 {G2}
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 5)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/chien_consts_pkg"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut"
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "G1" 6 7 8 )} 
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "G1" 6 7 8 )} 
wvSetPosition -win $_nWave2 {("G1" 8)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
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
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 104014487.369985 689467459.138187
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
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/chien_consts_pkg"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut"
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSetPosition -win $_nWave2 {("G1" 9)}
wvGetSignalClose -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 59436849.925706
wvZoom -win $_nWave2 0.000000 927320.838365
wvSetCursor -win $_nWave2 59938.271128 -snap {("G1" 9)}
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSetCursor -win $_nWave2 78539.803547 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 59938.271128 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 251465.160478 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 213573.149995 -snap {("G3" 0)}
wvSetCursor -win $_nWave2 58560.379837 -snap {("G1" 9)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSetCursor -win $_nWave2 63382.999353 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 429213.136925 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSaveSignal -win $_nWave2 \
           "/home/EDA/work/IEEE802_3_CZ/Hardware/Dec_forney/pre_sim/signal_chien_forney.rc"
wvSetCursor -win $_nWave2 277645.094993 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
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
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 54977.711738 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 66121.842496 -snap {("G1" 1)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSetPosition -win $_nWave2 {("G2" 1)}
wvExpandBus -win $_nWave2
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
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSetPosition -win $_nWave2 {("G2" 1)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetCursor -win $_nWave2 85958.395245 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 95616.641902 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 106723.625557 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 114933.135215 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 126040.118871 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 135215.453195 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 143424.962853 -snap {("G2" 2)}
wvSelectSignal -win $_nWave2 {( "G2" 1 2 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectGroup -win $_nWave2 {G3}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_chien"
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/tb_chien_search_forney_ref/dut/u_chien/hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_chien/pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_chien/u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 )} 
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/tb_chien_search_forney_ref/dut/u_chien/hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_chien/pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_chien/u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 )} 
wvSetPosition -win $_nWave2 {("G3" 3)}
wvGetSignalClose -win $_nWave2
wvSetCursor -win $_nWave2 60364.041605 -snap {("G1" 9)}
wvSetCursor -win $_nWave2 64710.252600 -snap {("G1" 1)}
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 2 3 )} 
wvSetCursor -win $_nWave2 84992.570579 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 64710.252600 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 75334.323923 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 64710.252600 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 73402.674591 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 84992.570579 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 96099.554235 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 103826.151560 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 65676.077266 -snap {("G1" 1)}
verdiSetActWin -dock widgetDock_<Message>
verdiSetActWin -win $_nWave2
wvSelectGroup -win $_nWave2 {G3}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/chien_consts_pkg"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_chien"
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/tb_chien_search_forney_ref/dut/u_chien/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_chien/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_chien/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/u_chien/start_i} \
{/tb_chien_search_forney_ref/dut/u_chien/hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_chien/pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_chien/u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 4 )} 
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/tb_chien_search_forney_ref/dut/u_chien/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_chien/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_chien/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/u_chien/start_i} \
{/tb_chien_search_forney_ref/dut/u_chien/hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_chien/pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_chien/u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 4 )} 
wvSetPosition -win $_nWave2 {("G3" 4)}
wvGetSignalClose -win $_nWave2
wvSetCursor -win $_nWave2 85475.482912 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 63744.427935 -snap {("G1" 1)}
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 4)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/chien_consts_pkg"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_chien"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_chien"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_chien/g_lane\[0\]"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_chien/g_lane\[0\]/u_lane"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_chien/g_lane\[0\]/u_lane/g_mul\[1\]"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_chien/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_chien/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul_u"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_chien/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul"
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/tb_chien_search_forney_ref/dut/u_chien/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_chien/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_chien/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/u_chien/start_i} \
{/tb_chien_search_forney_ref/dut/u_chien/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/a_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_chien/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/b_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_chien/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/p_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_chien/hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_chien/pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_chien/u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G3" 5 6 7 )} 
wvSetPosition -win $_nWave2 {("G3" 7)}
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_chien/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul_u"
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/tb_chien_search_forney_ref/dut/u_chien/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_chien/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_chien/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/u_chien/start_i} \
{/tb_chien_search_forney_ref/dut/u_chien/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/a_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_chien/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/b_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_chien/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/p_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_chien/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul_u/a_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_chien/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul_u/b_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_chien/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul_u/p_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_chien/hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_chien/pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_chien/u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G3" 8 9 10 )} 
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/tb_chien_search_forney_ref/dut/u_chien/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_chien/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_chien/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/u_chien/start_i} \
{/tb_chien_search_forney_ref/dut/u_chien/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/a_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_chien/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/b_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_chien/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/p_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_chien/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul_u/a_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_chien/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul_u/b_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_chien/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul_u/p_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_chien/hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_chien/pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_chien/u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G3" 8 9 10 )} 
wvSetPosition -win $_nWave2 {("G3" 10)}
wvGetSignalClose -win $_nWave2
wvZoom -win $_nWave2 62778.603269 76783.060921
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 70750.603295 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectGroup -win $_nWave2 {G3}
wvSelectGroup -win $_nWave2 {G3}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 4 5 6 7 8 9 10 11 12 13 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetCursor -win $_nWave2 225037.147103 -snap {("G2" 1)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectGroup -win $_nWave2 {G1}
wvRenameGroup -win $_nWave2 {G1} {chien}
wvSelectGroup -win $_nWave2 {G2}
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectGroup -win $_nWave2 {G2}
wvRenameGroup -win $_nWave2 {G2} {debug}
wvSelectGroup -win $_nWave2 {G3}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney"
wvSetPosition -win $_nWave2 {("G3" 12)}
wvSetPosition -win $_nWave2 {("G3" 12)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 4 5 6 7 8 9 10 11 12 )} 
wvSetPosition -win $_nWave2 {("G3" 12)}
wvSetPosition -win $_nWave2 {("G3" 12)}
wvSetPosition -win $_nWave2 {("G3" 12)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 4 5 6 7 8 9 10 11 12 )} 
wvSetPosition -win $_nWave2 {("G3" 12)}
wvGetSignalClose -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 11 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 4 )} 
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 11)}
wvSetPosition -win $_nWave2 {("G3" 12)}
wvSetPosition -win $_nWave2 {("G3" 11)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 3 )} 
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetCursor -win $_nWave2 65676.077266 -snap {("G3" 1)}
wvResizeWindow -win $_nWave2 0 0 1718 815
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetCursor -win $_nWave2 223710.957036 -snap {("G3" 7)}
wvSelectGroup -win $_nWave2 {G3}
wvRenameGroup -win $_nWave2 {G3} {forney}
wvSelectSignal -win $_nWave2 {( "forney" 9 )} 
wvSelectGroup -win $_nWave2 {G4}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvMoveSelected -win $_nWave2
wvSaveSignal -win $_nWave2 \
           "/home/EDA/work/IEEE802_3_CZ/Hardware/Dec_forney/pre_sim/signal_chien_forney.rc"
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/chien_consts_pkg"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s0"
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G4" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G4" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave2 {("G4" 6)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvZoom -win $_nWave2 0.000000 16911.195456
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 5575.697413 -snap {("G4" 1)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "forney" 12 )} 
wvSetPosition -win $_nWave2 {("forney" 12)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("forney" 12)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/chien_consts_pkg"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s0"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney"
wvSetPosition -win $_nWave2 {("forney" 13)}
wvSetPosition -win $_nWave2 {("forney" 13)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "forney" 13 )} 
wvSetPosition -win $_nWave2 {("forney" 13)}
wvSetPosition -win $_nWave2 {("forney" 13)}
wvSetPosition -win $_nWave2 {("forney" 13)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "forney" 13 )} 
wvSetPosition -win $_nWave2 {("forney" 13)}
wvGetSignalClose -win $_nWave2
wvScrollDown -win $_nWave2 0
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/chien_consts_pkg"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s0"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney"
wvSetPosition -win $_nWave2 {("forney" 15)}
wvSetPosition -win $_nWave2 {("forney" 15)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "forney" 14 15 )} 
wvSetPosition -win $_nWave2 {("forney" 15)}
wvSetPosition -win $_nWave2 {("forney" 15)}
wvSetPosition -win $_nWave2 {("forney" 15)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "forney" 14 15 )} 
wvSetPosition -win $_nWave2 {("forney" 15)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "forney" 14 )} 
wvSetPosition -win $_nWave2 {("forney" 14)}
wvSetPosition -win $_nWave2 {("forney" 15)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("forney" 15)}
wvSelectSignal -win $_nWave2 {( "forney" 15 )} 
wvSaveSignal -win $_nWave2 \
           "/home/EDA/work/IEEE802_3_CZ/Hardware/Dec_forney/pre_sim/signal_chien_forney.rc"
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
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
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
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
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 133740.279938 -snap {("forney" 1)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 4
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 226329.704510 -snap {("forney" 5)}
wvSetCursor -win $_nWave2 225377.138414 -snap {("forney" 6)}
wvSetCursor -win $_nWave2 155268.273717 -snap {("forney" 1)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvSelectGroup -win $_nWave2 {G4}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvRenameGroup -win $_nWave2 {G4} {s1}
wvRenameGroup -win $_nWave2 {s1} {s0}
wvSelectGroup -win $_nWave2 {s0}
wvSetPosition -win $_nWave2 {("s0" 0)}
wvMoveSelected -win $_nWave2
wvScrollDown -win $_nWave2 0
wvGetSignalOpen -win $_nWave2
wvSetPosition -win $_nWave2 {("s0" 1)}
wvSetPosition -win $_nWave2 {("s0" 1)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "s0" 1 )} 
wvSetPosition -win $_nWave2 {("s0" 1)}
wvSetPosition -win $_nWave2 {("s0" 1)}
wvSetPosition -win $_nWave2 {("s0" 1)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "s0" 1 )} 
wvSetPosition -win $_nWave2 {("s0" 1)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "s0" 1 2 3 )} 
wvSelectSignal -win $_nWave2 {( "s0" 1 )} 
wvSetPosition -win $_nWave2 {("s0" 2)}
wvSetPosition -win $_nWave2 {("s0" 3)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("s0" 3)}
wvSetPosition -win $_nWave2 {("s0" 2)}
wvSetPosition -win $_nWave2 {("s0" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("s0" 1)}
wvSetPosition -win $_nWave2 {("s0" 2)}
wvSelectSignal -win $_nWave2 {( "s0" 7 )} 
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/chien_consts_pkg"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s0"
wvSetPosition -win $_nWave2 {("s0" 5)}
wvSetPosition -win $_nWave2 {("s0" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "s0" 3 4 5 )} 
wvSetPosition -win $_nWave2 {("s0" 5)}
wvSetPosition -win $_nWave2 {("s0" 5)}
wvSetPosition -win $_nWave2 {("s0" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "s0" 3 4 5 )} 
wvSetPosition -win $_nWave2 {("s0" 5)}
wvGetSignalClose -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 244237.947123 -snap {("s0" 3)}
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvSetCursor -win $_nWave2 117165.629860 -snap {("s0" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
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
wvSelectSignal -win $_nWave2 {( "s0" 9 )} 
wvSelectSignal -win $_nWave2 {( "s0" 9 )} 
wvSetPosition -win $_nWave2 {("s0" 9)}
wvExpandBus -win $_nWave2
wvScrollDown -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "s0" 9 )} 
wvSetPosition -win $_nWave2 {("s0" 9)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("s0" 9)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "s0" 8 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "s0" 8 )} 
wvSetCursor -win $_nWave2 255443.234837 -snap {("s0" 10)}
wvSetCursor -win $_nWave2 275388.802488 -snap {("s0" 10)}
wvSetCursor -win $_nWave2 254393.468118 -snap {("s0" 10)}
wvSelectSignal -win $_nWave2 {( "debug" 3 )} 
wvSetPosition -win $_nWave2 {("debug" 3)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("s0" 9)}
wvSelectSignal -win $_nWave2 {( "debug" 3 )} 
wvSetPosition -win $_nWave2 {("debug" 3)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("debug" 3)}
wvSetPosition -win $_nWave2 {("s0" 9)}
wvSelectSignal -win $_nWave2 {( "debug" 1 )} 
wvSetPosition -win $_nWave2 {("debug" 1)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("s0" 9)}
wvSelectSignal -win $_nWave2 {( "debug" 1 )} 
wvSetPosition -win $_nWave2 {("debug" 1)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("debug" 1)}
wvSetPosition -win $_nWave2 {("s0" 9)}
wvSelectSignal -win $_nWave2 {( "debug" 2 )} 
wvSetPosition -win $_nWave2 {("debug" 2)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("s0" 9)}
wvSelectSignal -win $_nWave2 {( "debug" 2 )} 
wvSetPosition -win $_nWave2 {("debug" 2)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("debug" 2)}
wvSetPosition -win $_nWave2 {("s0" 9)}
wvSetCursor -win $_nWave2 275388.802488 -snap {("s0" 10)}
wvSelectSignal -win $_nWave2 {( "s0" 10 )} 
wvScrollDown -win $_nWave2 0
wvSelectGroup -win $_nWave2 {s0}
wvSelectGroup -win $_nWave2 {G5}
wvSaveSignal -win $_nWave2 \
           "/home/EDA/work/IEEE802_3_CZ/Hardware/Dec_forney/pre_sim/signal_chien_forney.rc"
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectGroup -win $_nWave2 {G5}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvMoveSelected -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s1"
wvSetPosition -win $_nWave2 {("G5" 9)}
wvSetPosition -win $_nWave2 {("G5" 9)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s1_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s2_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvSelectSignal -win $_nWave2 {( "G5" 1 2 3 4 5 6 7 8 9 )} 
wvSetPosition -win $_nWave2 {("G5" 9)}
wvSetPosition -win $_nWave2 {("G5" 9)}
wvSetPosition -win $_nWave2 {("G5" 9)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s1_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s2_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvSelectSignal -win $_nWave2 {( "G5" 1 2 3 4 5 6 7 8 9 )} 
wvSetPosition -win $_nWave2 {("G5" 9)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 8 )} 
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvSelectSignal -win $_nWave2 {( "G5" 3 4 5 )} 
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 265940.902022 -snap {("G5" 8)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectGroup -win $_nWave2 {G5}
wvRenameGroup -win $_nWave2 {G5} {s1}
wvSelectGroup -win $_nWave2 {G6}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvMoveSelected -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/chien_consts_pkg"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s1"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s2"
wvSetPosition -win $_nWave2 {("G6" 12)}
wvSetPosition -win $_nWave2 {("G6" 12)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"s1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s1_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s2_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_zero_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/num_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/phase_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s2_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/y_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 4 5 6 7 8 9 10 11 12 )} 
wvSetPosition -win $_nWave2 {("G6" 12)}
wvSetPosition -win $_nWave2 {("G6" 12)}
wvSetPosition -win $_nWave2 {("G6" 12)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"s1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s1_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s2_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_zero_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/num_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/phase_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s2_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/y_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 4 5 6 7 8 9 10 11 12 )} 
wvSetPosition -win $_nWave2 {("G6" 12)}
wvGetSignalClose -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G6" 7 )} 
wvSetPosition -win $_nWave2 {("G6" 7)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSelectSignal -win $_nWave2 {( "G6" 4 )} 
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 7)}
wvSetPosition -win $_nWave2 {("G6" 8)}
wvSetPosition -win $_nWave2 {("G6" 9)}
wvSetPosition -win $_nWave2 {("G6" 12)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 12)}
wvSelectSignal -win $_nWave2 {( "G6" 9 )} 
wvSelectSignal -win $_nWave2 {( "G6" 9 10 )} 
wvSetPosition -win $_nWave2 {("G6" 10)}
wvSetPosition -win $_nWave2 {("G6" 11)}
wvSetPosition -win $_nWave2 {("G6" 12)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 12)}
wvSelectSignal -win $_nWave2 {( "G6" 8 )} 
wvSelectSignal -win $_nWave2 {( "G6" 7 )} 
wvSelectSignal -win $_nWave2 {( "G6" 8 )} 
wvSelectSignal -win $_nWave2 {( "G6" 3 )} 
wvSelectSignal -win $_nWave2 {( "G6" 5 )} 
wvSelectSignal -win $_nWave2 {( "G6" 6 )} 
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 8)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 8)}
wvSetCursor -win $_nWave2 285186.625194 -snap {("G6" 11)}
wvSelectSignal -win $_nWave2 {( "G6" 10 )} 
wvSelectSignal -win $_nWave2 {( "G6" 10 )} 
wvSelectSignal -win $_nWave2 {( "G6" 7 )} 
wvSelectSignal -win $_nWave2 {( "s1" 5 )} 
wvSetCursor -win $_nWave2 266290.824261 -snap {("s1" 8)}
wvSelectSignal -win $_nWave2 {( "G6" 8 )} 
wvSetCursor -win $_nWave2 285536.547434 -snap {("G6" 11)}
wvSelectSignal -win $_nWave2 {( "G6" 9 )} 
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G6" 3 )} 
wvSelectSignal -win $_nWave2 {( "G6" 12 )} 
wvSetPosition -win $_nWave2 {("G6" 12)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 12)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/chien_consts_pkg"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s2"
wvSetPosition -win $_nWave2 {("G6" 13)}
wvSetPosition -win $_nWave2 {("G6" 13)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"s1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s1_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s2_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/num_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/phase_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_zero_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s2_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/inv_q\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvSelectSignal -win $_nWave2 {( "G6" 13 )} 
wvSetPosition -win $_nWave2 {("G6" 13)}
wvSetPosition -win $_nWave2 {("G6" 13)}
wvSetPosition -win $_nWave2 {("G6" 13)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"s1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s1_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s2_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/num_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/phase_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_zero_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s2_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/inv_q\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvSelectSignal -win $_nWave2 {( "G6" 13 )} 
wvSetPosition -win $_nWave2 {("G6" 13)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 13 )} 
wvSetPosition -win $_nWave2 {("G6" 12)}
wvSetPosition -win $_nWave2 {("G6" 9)}
wvSetPosition -win $_nWave2 {("G6" 8)}
wvSetPosition -win $_nWave2 {("G6" 7)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetCursor -win $_nWave2 265241.057543 -snap {("G6" 3)}
wvSelectSignal -win $_nWave2 {( "G6" 3 )} 
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "s1" 5 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 284836.702955 -snap {("s1" 8)}
wvSelectSignal -win $_nWave2 {( "s1" 5 )} 
wvSetCursor -win $_nWave2 265590.979782 -snap {("s1" 8)}
wvSetCursor -win $_nWave2 286586.314152 -snap {("s1" 8)}
wvSelectGroup -win $_nWave2 {G6}
wvRenameGroup -win $_nWave2 {G6} {s2}
wvSelectGroup -win $_nWave2 {G7}
wvSetPosition -win $_nWave2 {("G7" 0)}
wvMoveSelected -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/chien_consts_pkg"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s2"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s2"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_forney/u_s2/u_mul_inv"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_forney/u_s2/u_mul_inv/u_mul"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_forney/u_s2/u_mul_inv"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_forney/u_s2/u_inv_rom"
wvSetPosition -win $_nWave2 {("G7" 1)}
wvSetPosition -win $_nWave2 {("G7" 1)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"s1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s1_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s2_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"s2" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/inv_q\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/num_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/phase_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_zero_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s2_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s3_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/u_inv_rom/rom\[0:1023\]} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvSelectSignal -win $_nWave2 {( "G7" 1 )} 
wvSetPosition -win $_nWave2 {("G7" 1)}
wvSetPosition -win $_nWave2 {("G7" 1)}
wvSetPosition -win $_nWave2 {("G7" 1)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"s1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s1_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s2_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"s2" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/inv_q\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/num_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/phase_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_zero_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s2_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s3_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/u_inv_rom/rom\[0:1023\]} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvSelectSignal -win $_nWave2 {( "G7" 1 )} 
wvSetPosition -win $_nWave2 {("G7" 1)}
wvGetSignalClose -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G7" 1 )} 
wvExpandBus -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 18
wvScrollUp -win $_nWave2 998
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 3
wvScrollDown -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G7" 1 )} 
wvSetPosition -win $_nWave2 {("G7" 1)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 1)}
wvSelectSignal -win $_nWave2 {( "s1" 9 )} 
wvSetPosition -win $_nWave2 {("s1" 9)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("s1" 9)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/chien_consts_pkg"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s2"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_forney/u_s2/u_inv_rom"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s2"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s1"
wvSetPosition -win $_nWave2 {("s1" 10)}
wvSetPosition -win $_nWave2 {("s1" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"s1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s1_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s2_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_comb\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"s2" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/inv_q\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/num_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/phase_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_zero_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s2_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s3_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/u_inv_rom/rom\[0:1023\]} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvSelectSignal -win $_nWave2 {( "s1" 10 )} 
wvSetPosition -win $_nWave2 {("s1" 10)}
wvSetPosition -win $_nWave2 {("s1" 10)}
wvSetPosition -win $_nWave2 {("s1" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"s1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s1_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s2_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_comb\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"s2" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/inv_q\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/num_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/phase_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_zero_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s2_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s3_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/u_inv_rom/rom\[0:1023\]} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvSelectSignal -win $_nWave2 {( "s1" 10 )} 
wvSetPosition -win $_nWave2 {("s1" 10)}
wvGetSignalClose -win $_nWave2
wvSetCursor -win $_nWave2 265940.902022 -snap {("s1" 8)}
wvSelectSignal -win $_nWave2 {( "s1" 10 )} 
wvSelectSignal -win $_nWave2 {( "s1" 9 )} 
wvSetPosition -win $_nWave2 {("s1" 9)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("s1" 9)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/chien_consts_pkg"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s1"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s1"
wvSetPosition -win $_nWave2 {("s1" 10)}
wvSetPosition -win $_nWave2 {("s1" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"s1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s1_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s2_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_mul_coef\[1:5\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_comb\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"s2" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/inv_q\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/num_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/phase_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_zero_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s2_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s3_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/u_inv_rom/rom\[0:1023\]} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvSelectSignal -win $_nWave2 {( "s1" 10 )} 
wvSetPosition -win $_nWave2 {("s1" 10)}
wvSetPosition -win $_nWave2 {("s1" 10)}
wvSetPosition -win $_nWave2 {("s1" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"s1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s1_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s2_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_mul_coef\[1:5\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_comb\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"s2" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/inv_q\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/num_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/phase_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_zero_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s2_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s3_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/u_inv_rom/rom\[0:1023\]} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvSelectSignal -win $_nWave2 {( "s1" 10 )} 
wvSetPosition -win $_nWave2 {("s1" 10)}
wvGetSignalClose -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "s1" 9 )} 
wvSetPosition -win $_nWave2 {("s1" 9)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("s1" 9)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/chien_consts_pkg"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s1"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s1"
wvSetPosition -win $_nWave2 {("s1" 11)}
wvSetPosition -win $_nWave2 {("s1" 11)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"s1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s1_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s2_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_passthru\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sigma_reg\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_mul_coef\[1:5\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_comb\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"s2" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/inv_q\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/num_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/phase_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_zero_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s2_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s3_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/u_inv_rom/rom\[0:1023\]} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvSelectSignal -win $_nWave2 {( "s1" 10 11 )} 
wvSetPosition -win $_nWave2 {("s1" 11)}
wvSetPosition -win $_nWave2 {("s1" 11)}
wvSetPosition -win $_nWave2 {("s1" 11)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"s1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s1_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s2_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_passthru\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sigma_reg\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_mul_coef\[1:5\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_comb\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"s2" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/inv_q\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/num_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/phase_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_zero_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s2_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s3_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/u_inv_rom/rom\[0:1023\]} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvSelectSignal -win $_nWave2 {( "s1" 10 11 )} 
wvSetPosition -win $_nWave2 {("s1" 11)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "s1" 10 )} 
wvSetPosition -win $_nWave2 {("s1" 10)}
wvSetPosition -win $_nWave2 {("s1" 11)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("s1" 11)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "s2" 4 )} 
wvSetCursor -win $_nWave2 275388.802488 -snap {("s2" 4)}
wvSaveSignal -win $_nWave2 \
           "/home/EDA/work/IEEE802_3_CZ/Hardware/Dec_forney/pre_sim/signal_chien_forney.rc"
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 284836.702955 -snap {("s2" 12)}
wvSetCursor -win $_nWave2 284136.858476 -snap {("s2" 8)}
wvSetCursor -win $_nWave2 265241.057543 -snap {("s2" 5)}
wvSelectSignal -win $_nWave2 {( "s2" 6 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 272939.346812 -snap {("s0" 9)}
wvSetCursor -win $_nWave2 255443.234837 -snap {("s0" 9)}
wvSelectSignal -win $_nWave2 {( "s2" 5 )} 
wvSelectSignal -win $_nWave2 {( "s2" 5 )} 
wvSetCursor -win $_nWave2 273639.191291 -snap {("s0" 9)}
wvSetCursor -win $_nWave2 263491.446345 -snap {("s2" 4)}
wvScrollDown -win $_nWave2 5
wvSelectSignal -win $_nWave2 {( "s2" 6 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "s1" 11 )} 
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 8
wvScrollDown -win $_nWave2 6
wvScrollDown -win $_nWave2 5
wvSelectSignal -win $_nWave2 {( "s1" 10 )} 
wvSelectSignal -win $_nWave2 {( "s1" 10 11 12 )} 
wvSelectSignal -win $_nWave2 {( "s1" 10 11 12 13 )} 
wvSetPosition -win $_nWave2 {("s1" 13)}
wvSetPosition -win $_nWave2 {("s2" 0)}
wvSetPosition -win $_nWave2 {("s2" 2)}
wvSetPosition -win $_nWave2 {("s2" 3)}
wvSetPosition -win $_nWave2 {("s2" 4)}
wvSetPosition -win $_nWave2 {("s2" 5)}
wvSetPosition -win $_nWave2 {("s2" 6)}
wvSetPosition -win $_nWave2 {("s2" 7)}
wvSetPosition -win $_nWave2 {("s2" 8)}
wvSetPosition -win $_nWave2 {("s2" 9)}
wvSetPosition -win $_nWave2 {("s2" 10)}
wvSetPosition -win $_nWave2 {("s2" 11)}
wvSetPosition -win $_nWave2 {("s2" 12)}
wvSetPosition -win $_nWave2 {("s2" 13)}
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("s2" 13)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("s2" 17)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "s2" 16 )} 
wvSelectSignal -win $_nWave2 {( "s2" 15 )} 
wvSelectSignal -win $_nWave2 {( "s2" 16 )} 
wvSelectSignal -win $_nWave2 {( "s2" 17 )} 
wvSelectSignal -win $_nWave2 {( "s2" 16 )} 
wvSelectSignal -win $_nWave2 {( "s2" 17 )} 
wvSelectSignal -win $_nWave2 {( "s2" 16 )} 
wvSelectSignal -win $_nWave2 {( "s2" 15 )} 
wvSelectSignal -win $_nWave2 {( "s2" 16 )} 
wvSelectSignal -win $_nWave2 {( "s2" 17 )} 
wvSelectSignal -win $_nWave2 {( "s2" 16 )} 
wvSelectSignal -win $_nWave2 {( "s2" 15 )} 
wvSelectSignal -win $_nWave2 {( "s2" 16 )} 
wvSelectSignal -win $_nWave2 {( "s2" 17 )} 
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s2"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s1"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s2"
wvSelectSignal -win $_nWave2 {( "s2" 14 )} 
wvSelectSignal -win $_nWave2 {( "s2" 14 15 16 17 )} 
wvSetPosition -win $_nWave2 {("s2" 14)}
wvSetPosition -win $_nWave2 {("s2" 13)}
wvSetPosition -win $_nWave2 {("s2" 7)}
wvSetPosition -win $_nWave2 {("s2" 6)}
wvSetPosition -win $_nWave2 {("s2" 5)}
wvSetPosition -win $_nWave2 {("s2" 3)}
wvSetPosition -win $_nWave2 {("s2" 2)}
wvSetPosition -win $_nWave2 {("s2" 1)}
wvSetPosition -win $_nWave2 {("s2" 0)}
wvSetPosition -win $_nWave2 {("s1" 9)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("s1" 9)}
wvSetPosition -win $_nWave2 {("s1" 13)}
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s1"
wvSetPosition -win $_nWave2 {("s1" 14)}
wvSetPosition -win $_nWave2 {("s1" 14)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"s1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s1_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s2_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sigma_reg\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_passthru\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_mul_coef\[1:5\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_comb\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_comb\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"s2" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/inv_q\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/num_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/phase_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_zero_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s2_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s3_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/u_inv_rom/rom\[0:1023\]} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvSelectSignal -win $_nWave2 {( "s1" 14 )} 
wvSetPosition -win $_nWave2 {("s1" 14)}
wvSetPosition -win $_nWave2 {("s1" 14)}
wvSetPosition -win $_nWave2 {("s1" 14)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"s1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s1_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s2_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sigma_reg\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_passthru\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_mul_coef\[1:5\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_comb\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_comb\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"s2" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/inv_q\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/num_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/phase_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_zero_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s2_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s3_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/u_inv_rom/rom\[0:1023\]} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvSelectSignal -win $_nWave2 {( "s1" 14 )} 
wvSetPosition -win $_nWave2 {("s1" 14)}
wvGetSignalClose -win $_nWave2
wvSetCursor -win $_nWave2 254393.468118 -snap {("s1" 14)}
wvSetCursor -win $_nWave2 265241.057543 -snap {("s1" 7)}
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 5
wvSelectSignal -win $_nWave2 {( "s1" 14 )} 
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/chien_consts_pkg"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s2"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s1"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v"
wvSetPosition -win $_nWave2 {("s1" 17)}
wvSetPosition -win $_nWave2 {("s1" 17)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"s1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s1_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s2_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sigma_reg\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_passthru\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_mul_coef\[1:5\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_comb\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_comb\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/a\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/b\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/p\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"s2" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/inv_q\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/num_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/phase_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_zero_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s2_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s3_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/u_inv_rom/rom\[0:1023\]} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvSelectSignal -win $_nWave2 {( "s1" 15 16 17 )} 
wvSetPosition -win $_nWave2 {("s1" 17)}
wvSetPosition -win $_nWave2 {("s1" 17)}
wvSetPosition -win $_nWave2 {("s1" 17)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"s1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s1_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s2_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sigma_reg\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_passthru\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_mul_coef\[1:5\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_comb\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_comb\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/a\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/b\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/p\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"s2" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/inv_q\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/num_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/phase_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_zero_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s2_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s3_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/u_inv_rom/rom\[0:1023\]} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvSelectSignal -win $_nWave2 {( "s1" 15 16 17 )} 
wvSetPosition -win $_nWave2 {("s1" 17)}
wvGetSignalClose -win $_nWave2
wvMoveToSubgroup -win $_nWave2 -group "s1-1"
wvSelectSignal -win $_nWave2 {( "s1" 14 )} 
wvSelectGroup -win $_nWave2 {s1/s1-1}
wvRenameGroup -win $_nWave2 {s1/s1-1} {s1num1-1}
wvSetCursor -win $_nWave2 256143.079316 -snap {("s1num1-1" 2)}
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "s1/s1num1-1" 3 )} 
wvSelectSignal -win $_nWave2 {( "s1/s1num1-1" 2 )} 
wvSelectSignal -win $_nWave2 {( "s1/s1num1-1" 1 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "s1/s1num1-1" 2 )} 
wvSelectSignal -win $_nWave2 {( "s1/s1num1-1" 1 )} 
wvSelectSignal -win $_nWave2 {( "s1" 14 )} 
wvSelectGroup -win $_nWave2 {s1/s1num1-1}
wvRenameGroup -win $_nWave2 {s1/s1num1-1} {s1_num1_1}
wvSelectSignal -win $_nWave2 {( "s1/s1_num1_1" 1 )} 
wvSelectGroup -win $_nWave2 {s1/s1_num1_1}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/chien_consts_pkg"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s1"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s2"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/u_mul"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v"
wvGetSignalClose -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/chien_consts_pkg"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s1"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s2"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s1"
wvSetPosition -win $_nWave2 {("s1/s1_num1_1" 4)}
wvSetPosition -win $_nWave2 {("s1/s1_num1_1" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"s1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s1_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s2_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sigma_reg\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_passthru\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_mul_coef\[1:5\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_comb\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_comb\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"s1/s1_num1_1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/a\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/b\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/p\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[0:10\]} \
}
wvAddSignal -win $_nWave2 -group {"s2" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/inv_q\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/num_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/phase_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_zero_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s2_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s3_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/u_inv_rom/rom\[0:1023\]} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvSelectSignal -win $_nWave2 {( "s1/s1_num1_1" 4 )} 
wvSetPosition -win $_nWave2 {("s1/s1_num1_1" 4)}
wvSetPosition -win $_nWave2 {("s1/s1_num1_1" 4)}
wvSetPosition -win $_nWave2 {("s1/s1_num1_1" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"s1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s1_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s2_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sigma_reg\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_passthru\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_mul_coef\[1:5\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_comb\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_comb\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"s1/s1_num1_1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/a\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/b\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/p\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[0:10\]} \
}
wvAddSignal -win $_nWave2 -group {"s2" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/inv_q\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/num_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/phase_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_zero_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s2_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s3_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/u_inv_rom/rom\[0:1023\]} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvSelectSignal -win $_nWave2 {( "s1/s1_num1_1" 4 )} 
wvSetPosition -win $_nWave2 {("s1/s1_num1_1" 4)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "s1/s1_num1_1" 4 )} 
wvSetPosition -win $_nWave2 {("s1/s1_num1_1" 3)}
wvSetPosition -win $_nWave2 {("s1/s1_num1_1" 2)}
wvSetPosition -win $_nWave2 {("s1/s1_num1_1" 1)}
wvSetPosition -win $_nWave2 {("s1/s1_num1_1" 0)}
wvSetPosition -win $_nWave2 {("s1" 14)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("s1" 14)}
wvSetPosition -win $_nWave2 {("s1" 15)}
wvScrollUp -win $_nWave2 6
wvSelectSignal -win $_nWave2 {( "s0" 9 )} 
wvSetPosition -win $_nWave2 {("s0" 9)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("s1" 15)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "s1" 1 )} 
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/chien_consts_pkg"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s1"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s2"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s1"
wvSetPosition -win $_nWave2 {("s1" 16)}
wvSetPosition -win $_nWave2 {("s1" 16)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[1\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[2\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[3\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[4\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[5\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[6\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[7\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[8\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[9\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[10\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[11\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"s1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s1_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s2_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sigma_reg\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_passthru\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_mul_coef\[1:5\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_comb\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_comb\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[0:11\]} \
}
wvAddSignal -win $_nWave2 -group {"s1/s1_num1_1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/a\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/b\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/p\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"s2" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/inv_q\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/num_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/phase_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_zero_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s2_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s3_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/u_inv_rom/rom\[0:1023\]} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvSelectSignal -win $_nWave2 {( "s1" 16 )} 
wvSetPosition -win $_nWave2 {("s1" 16)}
wvSetPosition -win $_nWave2 {("s1" 16)}
wvSetPosition -win $_nWave2 {("s1" 16)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[1\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[2\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[3\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[4\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[5\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[6\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[7\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[8\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[9\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[10\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[11\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"s1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s1_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s2_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sigma_reg\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_passthru\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_mul_coef\[1:5\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_comb\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_comb\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[0:11\]} \
}
wvAddSignal -win $_nWave2 -group {"s1/s1_num1_1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/a\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/b\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/p\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"s2" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/inv_q\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/num_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/phase_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_zero_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s2_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s3_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/u_inv_rom/rom\[0:1023\]} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvSelectSignal -win $_nWave2 {( "s1" 16 )} 
wvSetPosition -win $_nWave2 {("s1" 16)}
wvGetSignalClose -win $_nWave2
wvScrollUp -win $_nWave2 9
wvSetPosition -win $_nWave2 {("s1" 15)}
wvSetPosition -win $_nWave2 {("s1" 14)}
wvSetPosition -win $_nWave2 {("s1" 13)}
wvSetPosition -win $_nWave2 {("s1" 12)}
wvSetPosition -win $_nWave2 {("s1" 11)}
wvSetPosition -win $_nWave2 {("s1" 10)}
wvSetPosition -win $_nWave2 {("s1" 9)}
wvSetPosition -win $_nWave2 {("s1" 8)}
wvSetPosition -win $_nWave2 {("s1" 7)}
wvSetPosition -win $_nWave2 {("s1" 6)}
wvSetPosition -win $_nWave2 {("s1" 5)}
wvSetPosition -win $_nWave2 {("s1" 4)}
wvSetPosition -win $_nWave2 {("s1" 3)}
wvSetPosition -win $_nWave2 {("s1" 2)}
wvSetPosition -win $_nWave2 {("s1" 1)}
wvSetPosition -win $_nWave2 {("s1" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("s1" 0)}
wvSetPosition -win $_nWave2 {("s1" 1)}
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 4
wvScrollDown -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "s1" 1 )} 
wvExpandBus -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 8
wvSetCursor -win $_nWave2 285186.625194 -snap {("s1" 20)}
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 265940.902022 -snap {("s1" 21)}
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
wvSelectSignal -win $_nWave2 {( "s1" 1 )} 
wvSetPosition -win $_nWave2 {("s1" 1)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("s1" 1)}
wvSetPosition -win $_nWave2 {("s1" 2)}
wvSetPosition -win $_nWave2 {("s1" 4)}
wvSetPosition -win $_nWave2 {("s1" 5)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("s1" 5)}
wvSetCursor -win $_nWave2 254743.390358 -snap {("s1" 4)}
wvSelectSignal -win $_nWave2 {( "s1" 16 )} 
wvSetPosition -win $_nWave2 {("s1" 16)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("s1" 16)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/chien_consts_pkg"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s1"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s2"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s1"
wvSetPosition -win $_nWave2 {("s1" 17)}
wvSetPosition -win $_nWave2 {("s1" 17)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[1\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[2\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[3\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[4\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[5\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[6\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[7\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[8\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[9\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[10\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[11\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"s1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s1_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s2_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sigma_reg\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_passthru\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_mul_coef\[1:5\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_comb\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_comb\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_mul_p\[1:10\]} \
}
wvAddSignal -win $_nWave2 -group {"s1/s1_num1_1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/a\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/b\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/p\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"s2" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/inv_q\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/num_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/phase_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_zero_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s2_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s3_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/u_inv_rom/rom\[0:1023\]} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvSelectSignal -win $_nWave2 {( "s1" 17 )} 
wvSetPosition -win $_nWave2 {("s1" 17)}
wvSetPosition -win $_nWave2 {("s1" 17)}
wvSetPosition -win $_nWave2 {("s1" 17)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[1\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[2\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[3\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[4\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[5\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[6\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[7\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[8\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[9\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[10\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[11\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"s1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s1_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s2_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sigma_reg\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_passthru\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_mul_coef\[1:5\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_comb\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_comb\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_mul_p\[1:10\]} \
}
wvAddSignal -win $_nWave2 -group {"s1/s1_num1_1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/a\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/b\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/p\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"s2" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/inv_q\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/num_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/phase_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_zero_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s2_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s3_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/u_inv_rom/rom\[0:1023\]} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvSelectSignal -win $_nWave2 {( "s1" 17 )} 
wvSetPosition -win $_nWave2 {("s1" 17)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "s1" 16 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "s1" 17 )} 
wvSelectSignal -win $_nWave2 {( "s1" 16 )} 
wvSelectSignal -win $_nWave2 {( "s1" 17 )} 
wvSelectSignal -win $_nWave2 {( "s1" 16 )} 
wvSelectSignal -win $_nWave2 {( "s1" 5 )} 
wvSetPosition -win $_nWave2 {("s1" 5)}
wvSetPosition -win $_nWave2 {("s1" 6)}
wvSetPosition -win $_nWave2 {("s1" 7)}
wvSetPosition -win $_nWave2 {("s1" 8)}
wvSetPosition -win $_nWave2 {("s1" 9)}
wvSetPosition -win $_nWave2 {("s1" 10)}
wvSetPosition -win $_nWave2 {("s1" 11)}
wvSetPosition -win $_nWave2 {("s1" 13)}
wvSetPosition -win $_nWave2 {("s1" 14)}
wvSetPosition -win $_nWave2 {("s1" 15)}
wvSetPosition -win $_nWave2 {("s1" 16)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("s1" 16)}
wvSelectSignal -win $_nWave2 {( "s1" 16 )} 
wvExpandBus -win $_nWave2
wvSelectSignal -win $_nWave2 {( "s1" 29 )} 
wvSetPosition -win $_nWave2 {("s1" 29)}
wvExpandBus -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 274688.958009 -snap {("s1" 30)}
wvSelectSignal -win $_nWave2 {( "s1" 28 )} 
wvSelectSignal -win $_nWave2 {( "s1" 29 )} 
wvSetPosition -win $_nWave2 {("s1" 29)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("s1" 29)}
wvSelectSignal -win $_nWave2 {( "s1" 16 )} 
wvSetPosition -win $_nWave2 {("s1" 16)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("s1" 16)}
wvSetPosition -win $_nWave2 {("s1" 17)}
wvSelectSignal -win $_nWave2 {( "s1" 16 )} 
wvSetPosition -win $_nWave2 {("s1" 16)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("s1" 29)}
wvSelectSignal -win $_nWave2 {( "s1" 29 )} 
wvExpandBus -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "s1" 15 )} 
wvSetPosition -win $_nWave2 {("s1" 15)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("s1" 50)}
wvSelectSignal -win $_nWave2 {( "s1" 28 )} 
wvSelectSignal -win $_nWave2 {( "s1" 29 )} 
wvSelectSignal -win $_nWave2 {( "s1" 28 )} 
wvScrollUp -win $_nWave2 6
wvScrollUp -win $_nWave2 23
wvSelectSignal -win $_nWave2 {( "s0" 9 )} 
wvSetPosition -win $_nWave2 {("s0" 9)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("s0" 9)}
wvSetPosition -win $_nWave2 {("s1" 50)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 62
wvSelectSignal -win $_nWave2 {( "chien" 9 )} 
wvSetPosition -win $_nWave2 {("chien" 9)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("chien" 9)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/chien_consts_pkg"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s1"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s2"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s1"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_chien"
wvSetPosition -win $_nWave2 {("chien" 10)}
wvSetPosition -win $_nWave2 {("chien" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_chien/u_bus\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"s1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s1_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s2_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sigma_reg\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_passthru\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_mul_coef\[1:5\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_comb\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_comb\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[0\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[1\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[2\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[3\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[4\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[5\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[6\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[7\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[8\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[9\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[10\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[0\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[1\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[2\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[3\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[4\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[5\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[6\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[7\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[8\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[9\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[10\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[11\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_mul_p\[1:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_mul_p\[1\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_mul_p\[2\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_mul_p\[3\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_mul_p\[4\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_mul_p\[5\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_mul_p\[6\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_mul_p\[7\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_mul_p\[8\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_mul_p\[9\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_mul_p\[10\]\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"s1/s1_num1_1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/a\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/b\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/p\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"s2" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/inv_q\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/num_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/phase_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_zero_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s2_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s3_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/u_inv_rom/rom\[0:1023\]} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvSelectSignal -win $_nWave2 {( "chien" 10 )} 
wvSetPosition -win $_nWave2 {("chien" 10)}
wvSetPosition -win $_nWave2 {("chien" 10)}
wvSetPosition -win $_nWave2 {("chien" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"chien" \
{/tb_chien_search_forney_ref/dut/clk_i} \
{/tb_chien_search_forney_ref/dut/rst_ni} \
{/tb_chien_search_forney_ref/dut/sigma_low_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/sigma_valid_i} \
{/tb_chien_search_forney_ref/dut/chien_busy_o} \
{/tb_chien_search_forney_ref/dut/chien_done_o} \
{/tb_chien_search_forney_ref/dut/chien_start_i} \
{/tb_chien_search_forney_ref/dut/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_chien/u_bus\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"debug" \
{/tb_chien_search_forney_ref/dut/chien_dbg_hit_mask_o\[31:0\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_pos_bus_o\[0:31\]} \
{/tb_chien_search_forney_ref/dut/chien_dbg_u_vec_o\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"forney" \
{/tb_chien_search_forney_ref/dut/u_forney/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/sigma_bus_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/v_bus_i\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/ribm_valid_i} \
{/tb_chien_search_forney_ref/dut/u_forney/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_vec_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/den_s1\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/s3_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/s2_rdy} \
{/tb_chien_search_forney_ref/dut/u_forney/s0_rdy} \
}
wvAddSignal -win $_nWave2 -group {"s0" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/flush_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/hit_mask_i\[31:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_bus_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_i\[0:31\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/s1_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/u_vec_o\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s0/vld_o} \
}
wvAddSignal -win $_nWave2 -group {"s1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s0_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s1_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/s2_rdy_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sigma_reg\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_passthru\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/sd_mul_coef\[1:5\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/den_comb\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/num_comb\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[0:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[0\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[1\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[2\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[3\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[4\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[5\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[6\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[7\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[8\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[9\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_reg\[10\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[0:11\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[0\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[1\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[2\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[3\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[4\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[5\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[6\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[7\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[8\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[9\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[10\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/u_vec_i\[11\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_mul_p\[1:10\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_mul_p\[1\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_mul_p\[2\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_mul_p\[3\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_mul_p\[4\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_mul_p\[5\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_mul_p\[6\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_mul_p\[7\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_mul_p\[8\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_mul_p\[9\]\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/v_mul_p\[10\]\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"s1/s1_num1_1" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/a\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/b\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v/p\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"s2" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/clk_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/rst_ni} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/inv_q\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/num_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/phase_i\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_rdy_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s1_vld_i} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/pos_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/y_o\[9:0\]} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/den_zero_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s2_vld_o} \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/s3_rdy_i} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/tb_chien_search_forney_ref/dut/u_forney/u_s2/u_inv_rom/rom\[0:1023\]} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvSelectSignal -win $_nWave2 {( "chien" 10 )} 
wvSetPosition -win $_nWave2 {("chien" 10)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "chien" 10 )} 
wvExpandBus -win $_nWave2
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
wvSelectSignal -win $_nWave2 {( "chien" 10 )} 
wvSetPosition -win $_nWave2 {("chien" 10)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("chien" 10)}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("debug" 0)}
wvSetPosition -win $_nWave2 {("chien" 9)}
wvSelectSignal -win $_nWave2 {( "debug" 3 )} 
wvSetPosition -win $_nWave2 {("debug" 3)}
wvExpandBus -win $_nWave2
wvScrollUp -win $_nWave2 12
wvSelectSignal -win $_nWave2 {( "debug" 3 )} 
wvSetPosition -win $_nWave2 {("debug" 3)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("debug" 3)}
wvSetCursor -win $_nWave2 226049.766719 -snap {("debug" 1)}
wvSelectSignal -win $_nWave2 {( "debug" 3 )} 
wvExpandBus -win $_nWave2
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "debug" 6 )} 
wvSelectSignal -win $_nWave2 {( "debug" 7 )} 
wvSetPosition -win $_nWave2 {("debug" 7)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("debug" 47)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "debug" 7 )} 
wvSetPosition -win $_nWave2 {("debug" 7)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("debug" 7)}
wvSetPosition -win $_nWave2 {("debug" 35)}
wvSelectSignal -win $_nWave2 {( "debug" 1 )} 
wvSetPosition -win $_nWave2 {("debug" 1)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("debug" 67)}
wvSelectSignal -win $_nWave2 {( "debug" 1 )} 
wvSetPosition -win $_nWave2 {("debug" 1)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("debug" 1)}
wvSetPosition -win $_nWave2 {("debug" 35)}
wvSelectSignal -win $_nWave2 {( "debug" 2 )} 
wvSetPosition -win $_nWave2 {("debug" 2)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("debug" 67)}
wvScrollUp -win $_nWave2 7
wvSelectSignal -win $_nWave2 {( "debug" 2 )} 
wvSetPosition -win $_nWave2 {("debug" 2)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("debug" 2)}
wvSetPosition -win $_nWave2 {("debug" 35)}
wvSelectSignal -win $_nWave2 {( "debug" 3 )} 
wvSetPosition -win $_nWave2 {("debug" 3)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("debug" 3)}
wvSelectGroup -win $_nWave2 {forney}
wvSelectSignal -win $_nWave2 {( "forney" 11 )} 
wvSelectSignal -win $_nWave2 {( "forney" 3 )} 
wvSelectSignal -win $_nWave2 {( "forney" 3 )} 
wvSetPosition -win $_nWave2 {("forney" 3)}
wvExpandBus -win $_nWave2
wvSelectSignal -win $_nWave2 {( "forney" 3 )} 
wvSetPosition -win $_nWave2 {("forney" 3)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("forney" 3)}
wvSelectGroup -win $_nWave2 {forney}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/chien_consts_pkg"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s1"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_chien_search_forney_ref/dut/u_forney/u_s1/GEN_V_MUL\[1\]/u_mul_v"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney/u_s2"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_chien"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search_forney_ref/dut/u_forney"
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "forney" 8 )} 
wvSetPosition -win $_nWave2 {("forney" 8)}
wvExpandBus -win $_nWave2
wvSelectSignal -win $_nWave2 {( "forney" 12 )} 
wvSetPosition -win $_nWave2 {("forney" 12)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("forney" 52)}
wvSelectSignal -win $_nWave2 {( "forney" 12 )} 
wvSetPosition -win $_nWave2 {("forney" 12)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("forney" 12)}
wvSetPosition -win $_nWave2 {("forney" 40)}
wvScrollUp -win $_nWave2 11
wvSelectGroup -win $_nWave2 {forney}
wvSetPosition -win $_nWave2 {("forney" 0)}
wvSelectGroup -win $_nWave2 {forney}
wvSelectSignal -win $_nWave2 {( "forney" 8 )} 
wvSetPosition -win $_nWave2 {("forney" 8)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("forney" 8)}
wvSelectSignal -win $_nWave2 {( "forney" 8 )} 
wvExpandBus -win $_nWave2
wvSelectSignal -win $_nWave2 {( "forney" 12 )} 
wvSetPosition -win $_nWave2 {("forney" 12)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("forney" 52)}
wvSelectSignal -win $_nWave2 {( "forney" 12 )} 
wvSetPosition -win $_nWave2 {("forney" 12)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("forney" 12)}
wvSetPosition -win $_nWave2 {("forney" 40)}
wvScrollUp -win $_nWave2 5
wvScrollUp -win $_nWave2 6
wvSelectGroup -win $_nWave2 {forney}
wvSetPosition -win $_nWave2 {("forney" 0)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 48
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 6
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "s1" 27 )} 
wvSelectSignal -win $_nWave2 {( "s1" 27 )} 
wvSetPosition -win $_nWave2 {("s1" 27)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("s1" 27)}
wvSelectSignal -win $_nWave2 {( "s1" 15 )} 
wvSetPosition -win $_nWave2 {("s1" 15)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("s1" 15)}
wvSetPosition -win $_nWave2 {("s1" 16)}
wvSelectSignal -win $_nWave2 {( "s1" 17 )} 
wvSetPosition -win $_nWave2 {("s1" 17)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("s1" 17)}
wvSaveSignal -win $_nWave2 \
           "/home/EDA/work/IEEE802_3_CZ/Hardware/Dec_forney/pre_sim/signal_chien_forney.rc"
wvSetCursor -win $_nWave2 261741.835148 -snap {("s2" 8)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
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
wvSelectGroup -win $_nWave2 {s1/s1_num1_1}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 48
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 64
wvScrollUp -win $_nWave2 68
wvSelectGroup -win $_nWave2 {s0}
wvSelectGroup -win $_nWave2 {s1}
wvSetPosition -win $_nWave2 {("s1" 0)}
wvSelectGroup -win $_nWave2 {s2}
wvSelectGroup -win $_nWave2 {forney}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "forney" 8 )} 
wvSetPosition -win $_nWave2 {("forney" 8)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("forney" 8)}
wvSetPosition -win $_nWave2 {("s1" 0)}
wvSelectSignal -win $_nWave2 {( "forney" 12 )} 
wvSelectSignal -win $_nWave2 {( "forney" 11 )} 
wvSetCursor -win $_nWave2 285186.625194 -snap {("forney" 11)}
wvSetCursor -win $_nWave2 303732.503888 -snap {("forney" 11)}
wvSetCursor -win $_nWave2 284486.780715 -snap {("forney" 11)}
wvSelectSignal -win $_nWave2 {( "forney" 10 )} 
wvSetPosition -win $_nWave2 {("forney" 10)}
wvSetPosition -win $_nWave2 {("forney" 11)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("forney" 11)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 307931.570762 -snap {("forney" 11)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
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
wvSetCursor -win $_nWave2 59136.858476 -snap {("chien" 5)}
wvSetCursor -win $_nWave2 304082.426128 -snap {("forney" 10)}
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 333825.816485 -snap {("forney" 10)}
wvSetCursor -win $_nWave2 325427.682737 -snap {("chien" 1)}
wvSetCursor -win $_nWave2 336275.272162 -snap {("chien" 1)}
wvSetCursor -win $_nWave2 194206.842924 -snap {("forney" 10)}
wvSetCursor -win $_nWave2 216251.944012 -snap {("chien" 1)}
wvSelectSignal -win $_nWave2 {( "debug" 1 )} 
wvSetPosition -win $_nWave2 {("debug" 1)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("forney" 11)}
wvSelectSignal -win $_nWave2 {( "debug" 1 )} 
wvSetPosition -win $_nWave2 {("debug" 1)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("debug" 1)}
wvSetPosition -win $_nWave2 {("forney" 11)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 278188.180404 -snap {("forney" 15)}
wvSetCursor -win $_nWave2 157465.007776 -snap {("forney" 11)}
wvSetCursor -win $_nWave2 159214.618974 -snap {("s0" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectGroup -win $_nWave2 {s0}
wvScrollDown -win $_nWave2 7
wvSelectSignal -win $_nWave2 {( "s0" 9 )} 
wvSelectSignal -win $_nWave2 {( "s0" 9 )} 
wvSetPosition -win $_nWave2 {("s0" 9)}
wvExpandBus -win $_nWave2
wvSetCursor -win $_nWave2 165513.219285 -snap {("s0" 10)}
wvSetCursor -win $_nWave2 274339.035770 -snap {("s0" 11)}
