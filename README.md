# test-lammps-and-plumed
Regression tests for checking that LAMMPS and PLUMED can work together.  To run these tests you 
must build lammps with the following options

make yes-kspace
make yes-molecule
make yes-rigid
make yes-user-plumed
