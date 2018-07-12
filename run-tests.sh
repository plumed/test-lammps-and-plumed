#!/bin/bash

# Run tests on position, mass, charge and so on
cd rt-1 
./check-plumed.sh > log
grep ERROR log
rm log
cd ../

# Run test on restraint
cd rt-restraint
./check-plumed.sh > log
grep ERROR log
rm log
cd ../

# Run tests on virial
cd rt-virial 
./check-plumed.sh > log
grep ERROR log
rm log
cd ../

