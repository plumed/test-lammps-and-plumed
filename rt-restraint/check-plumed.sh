# This checks if forces are passed back correctly from PLUMED to LAMMPS

#!/bin/bash

LAMMPS=$HOME/opt/bin/lammps

# Run calculations to test adding restraint on bond
$LAMMPS < in.peptide-plumed-restraint
$LAMMPS < in.peptide-lammps-restraint
# Now compare value of distance when lammps and plumed restraint the distance
nlines=`paste lammps_restraint plumed_restraint | tail -n +2 | awk '{if( $2<$4-0.0001 || $2>$4+0.0001 ) print $0}' | wc -l`
if [ "$nlines" -gt 0 ] ; then
      echo ERROR passing forces from PLUMED back to LAMMPS
fi

rm bck.* p.log lammps_restraint plumed_restraint log.lammps
