#!/bin/bash
#
###############################################################################################################################################
#
# ABOUT THIS PROGRAM
#
#	Do5Do5Do5Do5Do.sh
#	https://github.com/Headbolt/Do5Do5Do5Do5Do
#
#   This Script is designed for use in JAMF as a Login Script in a policy run at login,
#		
#   - This script will ...
#		Run a specified policy Trigger
#		Pause for a defined number of seconds
#		Run an Inventory
#		Pause for another defined number of seconds
#		Run a specified policy Trigger
#
###############################################################################################################################################
#
# HISTORY
#
#	Version: 1.0 - 19/02/2023
#
#	- 19/02/2023 - V1.0 - Created by Headbolt
#
###############################################################################################################################################
#
# DEFINE VARIABLES & READ IN PARAMETERS
#
###############################################################################################################################################
#
# Variables used by this script.
#
Trigger1=${4} # Grab the First Policy Trigger to Execute JAMF variable #4 eg POLICYTRIGGER
Trigger2=${5} # Grab the Second Policy Trigger to Execute JAMF variable #5 eg POLICYTRIGGER
Trigger3=${6} # Grab the Third Policy Trigger to Execute JAMF variable #6 eg POLICYTRIGGER
Trigger4=${7} # Grab the Third Policy Trigger to Execute JAMF variable #7 eg POLICYTRIGGER
Trigger5=${8} # Grab the Third Policy Trigger to Execute JAMF variable #8 eg POLICYTRIGGER
elevate=${9} # Grab whether to run this Policy Trigger usinf SUDO from JAMF variable #9 eg YES
ForeBack=${10} # Grab whether to run theis Policy trigger in the ForeGround or Backgroup (Must be in CAPS) from JAMF variable #10 eg FOREGROUND
#
ExitCode=0 # Set Initial ExitCode
ScriptName="MacOS | Trigger - Pause 5 - Trigger - Pause 5 - Trigger - Pause 5 - Trigger - Pause 5 - Trigger"
#
Stamp=$(date) # Grab The Current Time so we can output it for Reporting Purposes
#
###############################################################################################################################################
# 
# SCRIPT CONTENTS - DO NOT MODIFY BELOW THIS LINE
#
###############################################################################################################################################
#
# Defining Functions
#
###############################################################################################################################################
#
# Section End Function
#
SectionEnd(){
#
/bin/echo # Outputting a Blank Line for Reporting Purposes
/bin/echo  ----------------------------------------------- # Outputting a Dotted Line for Reporting Purposes
/bin/echo # Outputting a Blank Line for Reporting Purposes
#
}
#
###############################################################################################################################################
#
# Script End Function
#
ScriptEnd(){
#
/bin/echo Ending Script '"'$ScriptName'"'
#
/bin/echo # Outputting a Blank Line for Reporting Purposes
/bin/echo  ----------------------------------------------- # Outputting a Dotted Line for Reporting Purposes
/bin/echo # Outputting a Blank Line for Reporting Purposes
exit $ExitCode
#
}
#
###############################################################################################################################################
#
# End Of Function Definition
#
###############################################################################################################################################
#
# Beginning Processing
#
###############################################################################################################################################
#
SectionEnd
#
/bin/echo "$Stamp" # Display Current Time
/bin/echo # Outputting a Blank Line for Reporting Purposes
#
/bin/echo "Running all Policies with the Trigger $Trigger1"
/bin/echo "Then Pausing for 5 Seconds"
/bin/echo "Then running all Policies with the Trigger $Trigger2"
/bin/echo "Then Pausing for 5 Seconds"
/bin/echo "Then running all Policies with the Trigger $Trigger3"
/bin/echo "Then Pausing for 5 Seconds"
/bin/echo "Then running all Policies with the Trigger $Trigger4"
/bin/echo "Then Pausing for 5 Seconds"
/bin/echo "Then running all Policies with the Trigger $Trigger5"
#
/bin/echo # Outputting a Blank Line for Reporting Purposes
#
if [ "${elevate}" == YES ]
	then
		Elevate=sudo
		/bin/echo "Running Commands Elevated"
		/bin/echo # Outputs a blank line for reporting purposes
	else
		Elevate=""    
fi
#
if [ "${ForeBack}" == "FOREGROUND" ]
	then
		FB=""
		/bin/echo "Running Commands in the Foreground"
		/bin/echo # Outputs a blank line for reporting purposes
	else
		FB='&'
		/bin/echo "Running Commands in the Background"
fi
#
Command=$(/bin/echo $Elevate /usr/local/bin/jamf policy -trigger '"'$Trigger1'"' '&&' sleep 5 '&&' $Elevate /usr/local/bin/jamf policy -trigger '"'$Trigger2'"' '&&' sleep 5 '&&' $Elevate /usr/local/bin/jamf policy -trigger '"'$Trigger3'"' '&&' sleep 5 '&&' $Elevate /usr/local/bin/jamf policy -trigger '"'$Trigger4'"' '&&' sleep 5 '&&' $Elevate /usr/local/bin/jamf policy -trigger '"'$Trigger5'"' $FB)
#
/bin/echo "$Command"
eval "$Command"
#
SectionEnd
ScriptEnd
