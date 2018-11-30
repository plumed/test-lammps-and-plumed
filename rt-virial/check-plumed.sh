# This checks if the virial is passed back correctly from PLUMED to LAMMPS

#!/bin/bash

LAMMPS=$HOME/opt/bin/lammps

# Now run calculations to test virial
$LAMMPS < in.peptide-plumed-npt
$LAMMPS < in.peptide-plumed-npt2	

nlines=`paste plmd_volume_with_restraint plmd_volume_without_restraint | tail -n +2 | awk '{if( $2<$4-0.0001 || $2>$4+0.0001 ) print $0}' | wc -l`
if [ "$nlines" -gt 0 ] ; then
      echo ERROR passing virial from PLUMED back to LAMMPS
fi

rm bck.* log.lammps p.log plmd_volume_without_restraint plmd_volume_with_restraint
