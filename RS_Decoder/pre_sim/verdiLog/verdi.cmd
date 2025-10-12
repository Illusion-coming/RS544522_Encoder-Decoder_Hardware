verdiSetActWin -dock widgetDock_<Message>
debImport "-sv" "-f" "rtl_list.f" "-f" "sim_list.f"
debLoadSimResult \
           /home/EDA/work/IEEE802_3_CZ/Hardware/RS_Decoder/pre_sim/dump.fsdb
wvCreateWindow
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 0 0 1718 815
verdiSetActWin -win $_nWave2
wvSetCursor -win $_nWave2 421329.383886
wvRestoreSignal -win $_nWave2 \
           "/home/EDA/work/IEEE802_3_CZ/Hardware/Dec_chien/pre_sim/signal_batch.rc" \
           -overWriteAutoAlias on -appendSignals on
wvResizeWindow -win $_nWave2 0 0 1718 815
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -win $_nWave2
wvTpfCloseForm -win $_nWave2
wvGetSignalClose -win $_nWave2
wvCloseWindow -win $_nWave2
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvCreateWindow
verdiSetActWin -win $_nWave3
verdiWindowBeWindow -win $_nWave3
wvResizeWindow -win $_nWave3 0 0 1718 815
wvSetCursor -win $_nWave3 102625.194401
wvRestoreSignal -win $_nWave3 \
           "/home/EDA/work/IEEE802_3_CZ/Hardware/RS_Decoder/pre_sim/signal_batch.rc" \
           -overWriteAutoAlias on -appendSignals on
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 132871.285213 -snap {("syndromes" 1)}
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvSelectGroup -win $_nWave3 {forney_chien/ribm_imput}
wvSelectGroup -win $_nWave3 {forney_chien/ribm_output}
wvSelectGroup -win $_nWave3 {forney_chien}
wvSelectGroup -win $_nWave3 {forney_chien}
wvScrollDown -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvSelectGroup -win $_nWave3 {syndromes}
wvSelectGroup -win $_nWave3 {syndromes}
wvScrollDown -win $_nWave3 0
wvSelectGroup -win $_nWave3 {forney_chien/ribm_imput}
wvSelectGroup -win $_nWave3 {forney_chien/ribm_imput}
wvSelectGroup -win $_nWave3 {forney_chien/ribm_output}
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvSetCursor -win $_nWave3 766031.844314 -snap {("ribm_output" 9)}
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvSelectSignal -win $_nWave3 {( "forney_chien/ribm_output" 9 )} 
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvSelectGroup -win $_nWave3 {forney_chien/ribm_output}
wvSelectGroup -win $_nWave3 {forney_chien/ribm_output}
wvSelectGroup -win $_nWave3 {forney_chien/ribm_imput}
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvSelectSignal -win $_nWave3 {( "forney_chien/ribm_output" 8 )} 
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
