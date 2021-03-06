#!/bin/bash
############################################################################################
## Copyright 2003, 2015 IBM Corp                                                          ##
##                                                                                        ##
## Redistribution and use in source and binary forms, with or without modification,       ##
## are permitted provided that the following conditions are met:                          ##
##      1.Redistributions of source code must retain the above copyright notice,          ##
##        this list of conditions and the following disclaimer.                           ##
##      2.Redistributions in binary form must reproduce the above copyright notice, this  ##
##        list of conditions and the following disclaimer in the documentation and/or     ##
##        other materials provided with the distribution.                                 ##
##                                                                                        ##
## THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS AND ANY EXPRESS       ##
## OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF        ##
## MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL ##
## THE AUTHOR OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,    ##
## EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF     ##
## SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) ##
## HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,  ##
## OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS  ##
## SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.                           ##
############################################################################################
#
# File :        python-dateutil.sh
#
# Description:  This Testcase tests python-dateutil package
#
# Author:       Ramya<ramyabs1@in.ibm.com>
#
# History:      Mar 16 2015 - Initial Version
################################################################################

# source the utility functions
#cd `dirname $0`
#LTPBIN=${LTPBIN%/shared}/python_dateutil
source $LTPBIN/tc_utils.source
REQUIRED="python rpm"
TESTDIR=${LTPBIN%/shared}/python_dateutil
################################################################################
#  Utility functions
################################################################################
#
#
# local setup
#
function tc_local_setup(){
	tc_exec_or_break $REQUIRED || return
      tc_check_package python-dateutil
	tc_break_if_bad $? "python-dateutil package is not installed properly"
}


################################################################################
# testcase functions
################################################################################

# Function:             runtests
#
# Description:          - test python-dateutil
#
# Parameters:           - none
#
# Return                - zero on success
#                       - return value from commands on failure
#
function runtest(){
	pushd $TESTDIR >$stdout 2>$stderr
        tc_register "python-dateutil unittest test.py"
        python test.py 1> result.txt 2>&1
        tc_pass_or_fail $? "python-dateutil unittest is failed"
        popd >$stdout 2>$stderr

}
####################################################################################
#MAIN
####################################################################################
# Function:     main
#
# Description:  - Execute all tests, report results
#
# Exit:         - zero on success
#               - non-zero on failure
#
TST_TOTAL=1
tc_setup
runtest

