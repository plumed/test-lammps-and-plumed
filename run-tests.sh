#!/bin/bash

# Run tests on position, mass, charge and so on
cd rt-1 
./check-plumed.sh > log
nlines=`grep ERROR log | wc -l`
if [ "$nlines" -gt 0 ] ; then 
     echo ERROR in rt-1 
     grep ERROR log
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
     grep ERROR log
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
     grep ERROR log
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
     grep ERROR log
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
     grep ERROR log
     exit 1
fi
rm log
cd ../

