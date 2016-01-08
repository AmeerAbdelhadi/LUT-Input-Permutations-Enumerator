# setup cad  tools
# Ameer  Abdelhadi
# ameer@ece.ubc.ca
# June, 2011

######################
# Set Synopsys tools #
######################

# unset variable to enable sourcing tools setup scripts
unsetenv CMC_SNPS_SOURCED
unsetenv CMC_SOURCED

# Synopsys DC (run: dc_shell-xg-t)
source /CMC/scripts/synopsys.2010.12-SP2.csh

# Synopsys PrimeTime (run: pt_shell)
setenv CMC_SNPS_PT_ARCH $CMC_SNPS_ARCH
setenv PATH ${CMC_HOME}/tools/synopsys/pts_vZ-2007.06-SP3/${CMC_SNPS_PT_ARCH}/syn/bin:${PATH}

# Synopsys VCS-MX (run: dve)
setenv CMC_SNPS_VCS_ARCH $CMC_SNPS_ARCH2
setenv VCS_HOME $CMC_HOME/tools/synopsys/vcs-mx_vB-2008.12
setenv PATH ${VCS_HOME}/bin:${PATH}

#####################
# Set Cadence tools #
#####################

# Cadence Encouter (temporal)
source /CMC/scripts/setenv.cadence.edi.912.csh

# Cadence NC-SIM
source /CMC/scripts/setenv.cadence.ius.82.csh 

