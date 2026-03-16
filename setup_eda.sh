#!/bin/bash
# ============================================
# EDA Tool Setup Script
# ============================================
# University: Goergia Tech
# Server:     ece-rschsrv.ece.gatech.edu
# 
# Usage: source setup_eda.sh
# Note:  Must be sourced, not executed. Clean setup and prep environment adapted to university server.
# ============================================

# Load base ECE module (exposes tool modulefiles)
module load ece-software

# --------------------------------------------
# Synopsys Tools
# --------------------------------------------
# dc_shell, vcs, verdi, icc2_shell, pt_shell, starrc, hspice, lc_shell
module load synopsys/latest

# VCS additional environment setup
source /tools/software/synopsys/vcs/latest/bin/environ.sh

# --------------------------------------------
# Cadence Tools
# --------------------------------------------
module load cadence/base

# xcelium, spectre, quantus, virtuoso, liberate
# Adding tool binaries to PATH
export PATH="/tools/software/cadence/xcelium/latest/tools/bin:$PATH"
export PATH="/tools/software/cadence/spectre/latest/bin:$PATH"
export PATH="/tools/software/cadence/quantus/latest/bin:$PATH"
export PATH="/tools/software/cadence/ic/latest/bin:$PATH"
export PATH="/tools/software/cadence/liberate/latest/bin:$PATH"

# --------------------------------------------
# Siemens / Mentor Tools
# --------------------------------------------
# calibre
module load siemens/latest

# --------------------------------------------
# Xilinx Vivado (FPGA)
# --------------------------------------------
# TODO: Vivado not found via module
module load xilinx/latest

# --------------------------------------------
# Verify tools loaded
# --------------------------------------------
echo "=========================================="
echo " EDA Tool Setup Complete"
echo "=========================================="
echo ""
echo " --- Synopsys (Digital Flow) ---"
echo " DC Shell:    $(which dc_shell 2>/dev/null || echo 'NOT FOUND')"
echo " ICC2:        $(which icc2_shell 2>/dev/null || echo 'NOT FOUND')"
echo " PrimeTime:   $(which pt_shell 2>/dev/null || echo 'NOT FOUND')"
echo " StarRC:      $(which StarXtract 2>/dev/null || echo 'NOT FOUND')"
echo " VCS:         $(which vcs 2>/dev/null || echo 'NOT FOUND')"
echo " Verdi:       $(which verdi 2>/dev/null || echo 'NOT FOUND')"
echo " HSPICE:      $(which hspice 2>/dev/null || echo 'NOT FOUND')"
echo " LC Shell:    $(which lc_shell 2>/dev/null || echo 'NOT FOUND')"
echo ""
echo " --- Cadence ---"
echo " Xcelium:     $(which xrun 2>/dev/null || echo 'NOT FOUND')"
echo " Spectre:     $(which spectre 2>/dev/null || echo 'NOT FOUND')"
echo " Quantus:     $(which quantus 2>/dev/null || echo 'NOT FOUND')"
echo " Virtuoso:    $(which virtuoso 2>/dev/null || echo 'NOT FOUND')"
echo " Liberate:    $(which liberate 2>/dev/null || echo 'NOT FOUND')"
echo ""
echo " --- Siemens ---"
echo " Calibre:     $(which calibre 2>/dev/null || echo 'NOT FOUND')"
echo ""
echo " --- FPGA ---"
echo " Vivado:      $(which vivado 2>/dev/null || echo 'NOT FOUND')"
echo "=========================================="