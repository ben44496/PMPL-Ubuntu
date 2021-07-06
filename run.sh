#!/bin/bash
# INSTALL PMPL UBUNTU

sudo apt update
# sudo apt upgrade

#### Install packages
sudo apt install build-essential libboost-all-dev make cmake libmpfr-dev libeigen3-dev
# sudo apt upgrade

#### Install Qt4
sudo add-apt-repository ppa:rock-core/qt4
sudo apt-get update
sudo apt-get install qt4-default

#### Inside PMPL/
git clone git@gitlab.engr.illinois.edu:parasol-group/parasol/pmpl.git
cd pmpl/
git checkout ubuntu-20-04
cd ..
git clone git@gitlab.engr.illinois.edu:parasol-group/parasol/pmpl_utils.git
cd pmpl_utils/
# git checkout milp-gurobi ### Only needed because changes not merge to main branch yet
git checkout ubuntu-20-04
cd ..
cd pmpl
ln -s ../pmpl_utils/
cd ..

#### vizmo
git clone git@gitlab.engr.illinois.edu:parasol-group/parasol/vizmo.git
cd vizmo/
git checkout ubuntu-20-04
cd ..
cd vizmo
git clone git@gitlab.engr.illinois.edu:parasol-group/parasol/pmpl.git --depth 1 --branch vizmo
cd pmpl
ln -s ../../pmpl_utils
cd ../src
make -j8 platform=Ubuntu
#### ubuntu problems here
#### Makefile.VizmoDefaults:34: *** Qt moc not found at /usr/lib64/qt4/bin/moc..  Stop.
#### ubuntu problems end

#### Compiling and running the code section 3 PMPL checkout 
#### Add export PATH=~/PMPL/vizmo/src/:$PATH to bashrc?