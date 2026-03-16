#!/bin/bash
# ============================================
# EDA Tool Setup Script
# ============================================
# University: [Your University]
# Server:     [Your Server Name]
# 
# Usage: source setup_eda.sh
# Note:  Must be sourced, not executed (need environment changes in current shell)
# ============================================

# Load base ECE module
module load ece-software

# --------------------------------------------
# Synopsys Tools
# --------------------------------------------
# Design Compiler (synthesis)
source /tools/software/synopsys/syn/latest/bin/environ.sh

# VCS (simulation)
source /tools/software/synopsys/vcs/latest/bin/environ.sh

# Verdi (waveform debug)
source /tools/software/synopsys/verdi/latest/bin/environ.sh

# PrimeTime (static timing analysis)
# Uncomment and update path once confirmed:
# source /tools/software/synopsys/prime/latest/bin/environ.sh

# SpyGlass (linting / CDC)
# Uncomment and update path once confirmed:
# source /tools/software/synopsys/spyglass/latest/bin/environ.sh

# --------------------------------------------
# Cadence Tools
# --------------------------------------------
module load cadence/base

# --------------------------------------------
# Siemens / Mentor Tools
# --------------------------------------------
module load siemens/latest

# --------------------------------------------
# Xilinx Vivado (FPGA)
# --------------------------------------------
module load xilinx/2023.1

# --------------------------------------------
# Verify tools loaded
# --------------------------------------------
echo "=========================================="
echo " EDA Tool Setup Complete"
echo "=========================================="
echo " DC Shell:  $(which dc_shell 2>/dev/null || echo 'NOT FOUND')"
echo " VCS:       $(which vcs 2>/dev/null || echo 'NOT FOUND')"
echo " Verdi:     $(which verdi 2>/dev/null || echo 'NOT FOUND')"
echo " Innovus:   $(which innovus 2>/dev/null || echo 'NOT FOUND')"
echo " Genus:     $(which genus 2>/dev/null || echo 'NOT FOUND')"
echo " Vivado:    $(which vivado 2>/dev/null || echo 'NOT FOUND')"
echo "=========================================="
