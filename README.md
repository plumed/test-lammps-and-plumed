# test-lammps-and-plumed
Regression tests for checking that LAMMPS and PLUMED can work together.  To run these tests you 
must build lammps with the following options

make yes-manybody
make yes-kspace
make yes-molecule
make yes-rigid
make yes-user-plumed

To compile with cmake

cmake -D PKG_MANYBODY=yes -D PKG_KSPACE=yes -D PKG_MOLECULE=yes -D PKG_RIGID=yes -D PKG_USER-PLUMED=yes ../cmake
