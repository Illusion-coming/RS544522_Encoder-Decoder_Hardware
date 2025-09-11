# 说明：
# 1) 你遇到的 “遗漏分隔符” 是因为 Make 的【配方行】必须以 TAB 开头；被编辑器换成空格就会报错。
# 2) 为避免 TAB 被误改，这里使用 GNU make 的 .RECIPEPREFIX 改成可见字符 '>'，
#    从而所有配方行以 '>' 开头即可，无需 TAB（行首不能有空格）。
# 3) 变量/续行等非配方部分按你的要求使用 4 个空格缩进。

SHELL := /bin/bash
.RECIPEPREFIX := >

# ------------------------------------
# 顶层/文件列表/工具变量（保持原有风格）
# ------------------------------------
    top_name       ?= tb_syndrome_lal32_ref_math_negedge
    rtl_list       ?= rtl_list
    sim_list       ?= sim_list
    simv_name      ?= simv
    vpdpluse_name  ?= vcdpluse
    cov_file_name  ?= coverage
    vdb_name       ?= vdbfl
    my_incdir      ?= ../script

# 运行时参数（可通过 make 覆盖）
    CW_FILE   ?= ./codeword_from_spec_543_to_0_L7.txt
    LOG_FILE  ?= ./dut_syndromes.log
    plusargs  ?= DUMP_FSDB

# 新增：批量目录参数（默认扫描 ../raw_data，输出至 ../logs）
    RAW_DIR   ?= ../raw_data
    LOGS_DIR  ?= ../logs

# 编译选项
    NOR_VCS = vcs -full64 -sverilog +v2k -timescale=1ns/1ns \
        -debug_acc+all -debug_region+cell+encrypt \
        +notimingcheck \
        +nospecify \
        +vcs+flush+all \
        -o $(simv_name) \
        -l compile.log \
        -f $(rtl_list).f \
        -f $(sim_list).f \
        +incdir+$(my_incdir) \
        -top $(top_name) \
        +delay_mode_path

    VERDI_SW = -P \
        ${VERDI_HOME}/share/PLI/VCS/LINUX64/novas.tab \
        ${VERDI_HOME}/share/PLI/VCS/LINUX64/pli.a

# 运行配置（提供两种传参方式）
# A) plusargs：+CW=... +OUT_LOG=...
    RUN_PLUSARGS = -R +fsdb+autoflush+plusargs \
        +$(plusargs) \
        +CW=$(CW_FILE) +OUT_LOG=$(LOG_FILE) \
        -l run.log

# B) -pvalue 覆盖 TB 参数（字符串更安全）
    RUN_PVALUE   = -R \
        -pvalue+$(top_name).P_CODEWORD_FILE+"$(CW_FILE)" \
        -pvalue+$(top_name).P_OUT_LOG_FILE+"$(LOG_FILE)" \
        -l run.log

# 其它运行模式（保留）
    RUN_GUI = -R -gui -l run.log
    RUN_VPD = -R +vpdfile+$(vpdpluse_name).vpd -l run.log
    RUN_COV = -R $(COV_SW) -cm_name $(vdb_name) -cm_dir $(cov_dir)/$(cov_file_name) -l run.log -cm_hier ./covfl

# 默认运行（采用 plusargs）
    RUN_VER = $(RUN_PLUSARGS)

.PHONY: fl clean build run_vcs vd versim run_plusargs run_pvalue run_batch

# 生成文件列表（注意：配方行以 '>' 开头，且 **行首不能有空格**）
fl:
>    rm -f $(rtl_list).f $(sim_list).f
>    find ../rtl \
>        -type f \
>        \( -name "*.v" -o -name "*.h" -o -name "*.sv" -o -name "*.svh" \) \
>        -print > $(rtl_list).f
>    find ../testbench \
>        -type f \
>        \( -name "*.v" -o -name "*.h" -o -name "*.sv" -o -name "*.svh" \) \
>        -print > $(sim_list).f

# 清理
clean:
>    rm -rf csrc simv.daidir ucli.key *.log *.conf $(simv_name) *.fsdb *.vpd

# 仅编译（生成 ./simv 可复用）
build: fl
>    $(NOR_VCS) $(VERDI_SW)

# 编译+运行（默认用 plusargs 单例）
run_vcs:
>    $(NOR_VCS) $(VERDI_SW) $(RUN_VER)

# 打开 GUI（可选）
vd:
>    verdi -sv -f $(rtl_list).f -f $(sim_list).f -ssf *.fsdb -rcFile ~/dark.rc -nologo &

# 旧的一键流程：刷新列表 → 编译运行 → 开 GUI
versim: fl run_vcs vd

# 显式使用 plusargs 方式传路径
run_plusargs:
>    $(NOR_VCS) $(VERDI_SW) $(RUN_PLUSARGS)

# 显式使用 -pvalue 方式传路径
run_pvalue:
>    $(NOR_VCS) $(VERDI_SW) $(RUN_PVALUE)

# -----------------------------
# 批量运行：遍历 $(RAW_DIR)/*.txt，逐个喂给 TB，并将 DUT 输出写入 $(LOGS_DIR)
# 依赖：testbench 支持 +CW=<file> 与 +OUT_LOG=<file>
# 步骤：先 build（编译一次），再多次 ./simv 以不同 plusargs 运行
# -----------------------------
run_batch: build
>    mkdir -p $(LOGS_DIR)
>    shopt -s nullglob
>    for f in $(RAW_DIR)/*.txt; do \
>        b=$$(basename $$f .txt); \
>        echo "[BATCH] run $$f → $(LOGS_DIR)/$${b}_dut.log"; \
>        ./$(simv_name) +fsdb+autoflush+plusargs +$(plusargs) \
>            +CW=$$f +OUT_LOG=$(LOGS_DIR)/$${b}_dut.log \
>            -l $(LOGS_DIR)/$${b}.run.log || exit $$?; \
>    done
>    echo "[BATCH] all done. logs at $(LOGS_DIR)"

# 使用示例：
#   make run_vcs CW_FILE=../raw_data/codeword_from_spec_543_to_0V1.txt LOG_FILE=../logs/dut.log
#   make run_plusargs CW_FILE=../raw_data/codeword_from_spec_543_to_0V1.txt LOG_FILE=../logs/dut.log
#   make run_pvalue  CW_FILE=../raw_data/codeword_from_spec_543_to_0V1.txt LOG_FILE=../logs/dut.log
#   make run_batch RAW_DIR=../raw_data LOGS_DIR=../logs
#   make RUN_VER='$(RUN_PLUSARGS) -gui' run_vcs
