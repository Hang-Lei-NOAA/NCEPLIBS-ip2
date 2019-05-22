#!/bin/ksh

#---------------------------------------------------------------------------------
# Driver script to run the IPOLATES2 (ip2lib) 'C' wrapper unit test.
#
# This script calls a 'C' program which calls routine 'gdswzd' to
# compute the grid specs for a rotated lat/lon 'B'-grid.  The output is 
# sent to standard output.
#
# To run this script interactively, type "run_unit_test.sh".
# On WCOSS Phase 1/2, this script may be submitted to the compute nodes
# using "run_wcoss.lsf".  On Theia, use "run_theia.ksh"
# On WCOSS-Cray, use "run_wcoss-cray.lsf".  On WCOSS-Dell (phase 3),
# use "run_wcoss-dell.sh".
#
# The source code for the 'C' program is located in ../sorc.
# There are separate versions for the single ("4"), mixed ("d"), and
# double ("8") versions of ip2lib.  After compilation, the executables
# are in ../exec.
#
# For more details, please see the ../README file.
#---------------------------------------------------------------------------------

#set -x

APRUN=${APRUN:-" "}

for  precision in "4" "d" "8"  # test all three precision versions of library
do

  echo
  echo "********************************************************"
  echo "*** TEST $precision BYTE VERSION OF LIBRARY ***"
  echo "********************************************************"
  echo

  EXEC="../exec/test_gdswzd_${precision}.exe"

  $APRUN $EXEC

done

echo
echo "**************"
echo "**** DONE ****"
echo "**************"

exit 0
