# This checks if we can apply forces on the energy using PLUMED

#!/bin/bash

LAMMPS=$HOME/opt/bin/lammps

# Nothing from here works

# Now run calculations to check forces on energy
cd Sim1 
$LAMMPS < start.lmp
cd ../

cd Sim2
$LAMMPS < start.lmp
cd ../

nlines=`paste Sim1/energy1 Sim2/energy2 | tail -n +2 | awk '{if( $2<$4-0.1 || $2>04+0.1 ) print $0}' | wc -l`
if [ "$nlines" -gt 0 ] ; then
   echo ERROR mismatched energies for restrained NPT simuations
   paste Sim1/energy1 Sim2/energy2 | awk '{if( $2<$4-0.1 || $2>04+0.1 ) print $0}'
fi

rm -f Sim1/bck* Sim1/energy1 Sim1/plumed.out Sim1/restart.lmp Sim1/restart2.lmp Sim1/log.lammps Sim1/data.final
rm -f Sim2/bck* Sim2/energy2 Sim2/plumed.out Sim2/restart.lmp Sim2/restart2.lmp Sim2/log.lammps Sim2/data/final
