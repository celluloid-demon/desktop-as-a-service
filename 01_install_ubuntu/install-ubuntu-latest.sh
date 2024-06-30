#!/bin/bash

# Declare constants
TMP=/mnt/c/tmp
WINGET_PACKAGE_ID=9PDXGNCFSCZV

# Initialize
mkdir -p $TMP

# suppress complaints about UNC paths
cd $TMP

# Install WSL with the latest version of Ubuntu from Microsoft Store
cmd.exe /c winget install $WINGET_PACKAGE_ID
