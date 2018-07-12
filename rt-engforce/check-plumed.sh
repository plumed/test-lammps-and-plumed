# This checks if we can apply forces on the energy using PLUMED

#!/bin/bash

LAMMPS=/Users/gareth/MD_code/lammps-permanent/lammps/src/lmp_mpi

# Nothing from here works

# Now run calculations to check forces on energy
$LAMMPS < in.peptide-plumed-engforce-ref
$LAMMPS < in.peptide-plumed-eng-force-plumed
