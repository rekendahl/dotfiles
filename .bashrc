test -s ~/.alias && . ~/.alias || true
set -o vi
#export PATH=/sbin:/usr/sbin:/usr/local/sbin
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
export PATH=$PATH:/home/ekendahl/scripts
export EDITOR=vi


# DEALING WITH NX LIBRARY ISSUE
unset LD_PRELOAD

#exporting 256 colors while testing iPAD access
#export TERM=xterm-256color

#PROMPT
export PS1="\u@\h:\W> "

# VCS SETUP - OFFICIAL:
export LM_LICENSE_FILE=27000@192.168.1.139:27000@linux-server:27000@simcomp1:27000@simcomp2:2100@linux-server
export SNPSLMD_LICENSE_FILE=$LM_LICENSE_FILE

#
# SYNOPSYS
#
export VCS_ARCH_OVERRIDE=linux
export VCS_BASE=/usr/eda/synopsys
export VCS_HOME=$VCS_BASE/vcs/latest
export SYNPLIFY_HOME=$VCS_BASE/synplify/latest
#export ARCHITECT_ROOT=$VCS_BASE/arc/ARChitect/latest
export ARCHITECT_ROOT=$VCS_BASE/arc/ARChitect/2.19.4
export METAWARE_HOME=$VCS_BASE/arc/latest/MetaWare
export CORE_TOOLS=$VCS_BASE/coretools/latest/
export PATH=$PATH:$VCS_HOME/bin:$SYNPLIFY_HOME/bin:$ARCHITECT_ROOT/bin/linux:$METAWARE_HOME/ide/:$METAWARE_HOME/arc/bin:$CORE_TOOLS/bin


#Note: Uncommenting this line makes NX stop working :-( But I think it's needed to build cpu cores (hopefully a memory issue)
#export LD_PRELOAD=/opt/Xilinx/13.4/ISE_DS/ISE/lib/lin64/libXst_Core.so

export XILINX_BASE=/usr/eda/xilinx
export XILINX_VERSION=latest
#export XILINX_VERSION=13.4
#export XILINX_VERSION=14.1
export XILINX_PATH=$XILINX_BASE/$XILINX_VERSION
export XILINX=$XILINX_PATH/ISE_DS/ISE
export XILINXD_LICENSE_FILE=27000@linux-server
export XIL_PAR_DESIGN_CHECK_VERBOSE=0
export XILINX_EDK=$XILINX_PATH/ISE_DS/EDK
export XILINX_DSP=$XILINX_PATH/ISE_DS/ISE
export LMC_HOME=$XILINX_PATH/ISE_DS/ISE/smartmodel/lin64/installed_lin64
export XILINX_PLANAHEAD=$XILINX_PATH/ISE_DS/PlanAhead
export LD_LIBRARY_PATH=$XILINX_PATH/ISE_DS/common/lib/lin64:$XILINX_PATH/ISE_DS/ISE/sysgen/lib:$XILINX_PATH/ISE_DS/ISE/lib/lin64:$XILINX_PATH/ISE_DS/ISE/smartmodel/lin64/installed_lin64/lib:$XILINX_PATH/ISE_DS/EDK/lib/lin64
export PATH=$PATH:$XILINX_PATH/ISE_DS/common/bin/lin64:$XILINX_PATH/ISE_DS/ISE/sysgen/bin:$XILINX_PATH/ISE_DS/PlanAhead/bin:$XILINX_PATH/ISE_DS/ISE/bin/lin64:$XILINX_PATH/ISE_DS/ISE/sysgen/util:$XILINX_PATH/ISE_DS/EDK/bin/lin64:$XILINX_PATH/ISE_DS/EDK/gnu/microblaze/lin64/bin:$XILINX_PATH/ISE_DS/EDK/gnu/powerpc-eabi/lin64/bin


#HAPS
export PATH=$PATH:/usr/home/ekendahl/Projects/haps/hapsmap/lin
export HAPSMAP_LIB=/usr/home/ekendahl/Projects/haps/hapsmap/cardlib  


#ARCHITECT Additions:
export LD_LIBRARY_PATH=$ARCHITECT_ROOT/lib/linux

# USB2.0 Design core additions:
# FIXME: Need to update paths here
export VERA_HOME=$VCS_BASE/vera/latest/vera_vD-2009.12-15_linux
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$VERA_HOME/lib:$VERA_HOME/lib/mti:$VERA_HOME/lib/nc_vhdl:$VERA_HOME/lib/sro:$VERA_HOME/lib/vlog
export PATH=$PATH:$VERA_HOME/bin
export DESIGNWARE_HOME=$VCS_BASE/designware

# HSD PROJECT ROOT
export HSD_HOME=/home/ekendahl/Projects/legacy/hsd
export LIB_HOME=/home/ekendahl/Projects/legacy/lib
#Short cut for SVN command
export SVN_BASE=http://linux-server/svn

export PRJ_HOME=/home/ekendahl/Projects/tip_hdmi_tx
#export PRJ_HOME=/home/ekendahl/Projects/usb2.0_tip
# PEX8311 Simulation Models
export LMC_HOME=/home/bcharette/plx_tech/PEX_SIM_MODELS
export LMC_CONFIG=/home/bcharette/plx_tech/PEX_SIM_MODELS/data/linux.lmc
export LMC_LIB_DIR=linux.lib
export LMC_FOUNDRY_HOME=$LMC_HOME
export LMC_PATH=$LMC_HOME/foundry
export LMC_USE_32BIT=1
export LD_LIBRARY_PATH=$LMC_HOME/lib/linux.lib:$LD_LIBRARY_PATH
export PATH=$PATH:$LMC_HOME:$LD_LIBRARY_PATH
export VCS_SWIFT_NOTES=1


# BUGVISE
export PATH=$PATH:$HSD_HOME/verification/scripts
alias bv=$LIB_HOME/verification/scripts/bugvise
alias verify=$LIB_HOME/verification/scripts/verify.pl
alias ls="ls -h --color=auto"
