#!/bin/sh

# sudo echo -e "deb http://cloud.r-project.org/bin/linux/debian buster-cran40/" >> /etc/apt/sources.list

sudo apt update
sudo apt install -t buster-cran40 r-base

# Launch R for further installation. 
# It can be launched as a normal application in Windows, or by 
# command R within a shell terminal in Linux and FreeBSD. 
# Then, you can see the prompt “>”,which indicates that R is 
# ready for further commands.
#
#
# Install relevant R packages by command: 
#   install.packages("RQDA",dependencies=c("Depends", "Imports")) . 
#
# If you want to use the developer version of RQDA, 
# you can use this command after you have installed 
# RQDA by using the command: 
#   install.packages("RQDA",repos="http://R-Forge.R-project.org", type="source").
#
# Launch RQDA using command library(RQDA) from within R.
# Then you can see the RQDA GUI. 
# For Debian Linux users, there is a apt repositories, you can follow the guidelines there.> 
