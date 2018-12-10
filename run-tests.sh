#!/bin/bash

# Check that lammps executible is created
if [ ! -f $HOME/opt/bin/lammps ]; then 
     echo ERROR no lammps executible has been created
     exit 1 
fi

# Run tests on position, mass, charge and so on
cd rt-1 
./check-plumed.sh > log
nlines=`grep ERROR log | wc -l`
if [ "$nlines" -gt 0 ] ; then 
     echo ERROR in rt-1 
     cat log
     exit 1
fi
rm log
cd ../

# Run test on restraint
cd rt-restraint
./check-plumed.sh > log
nlines=`grep ERROR log | wc -l`
if [ "$nlines" -gt 0 ] ; then 
     echo ERROR in rt-restraint 
     cat log
     exit 1
fi
rm log
cd ../

# Run tests on virial
cd rt-virial 
./check-plumed.sh > log
nlines=`grep ERROR log | wc -l`
if [ "$nlines" -gt 0 ] ; then
     echo ERROR in rt-virial
     cat log
     exit 1
fi
rm log
cd ../

# Run tests on restraint on energy
cd rt-engforce
./check-plumed.sh > log
nlines=`grep ERROR log | wc -l`
if [ "$nlines" -gt 0 ] ; then
     echo ERROR in rt-engforce
     cat log
     exit 1
fi
rm log
cd ../

# Run tests on restraint on energy with npt
cd rt-engforce-npt
./check-plumed.sh > log
nlines=`grep ERROR log | wc -l`
if [ "$nlines" -gt 0 ] ; then
     echo ERROR in rt-engforce-npt
     cat log
     exit 1
fi
rm log
cd ../

