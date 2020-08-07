#!/bin/bash -l

#$ -P riseprac

#$ -pe omp 1

#$ -l h_rt=2:00:00

#$ -m ea

#$ -N alz_sim1_nrn76

#$ -j y
#$ -o control_results.qlog

echo "============================================"
echo "Start date : $(date)"
echo "Job name : $JOB_NAME"
echo "Job ID: $JOB_ID $SGE_TASK_ID"
echo "============================================"

module purge
module load python3/3.6.5
module load openmpi
module load neuron/7.6.7

mpirun -np 1 ./mod/x86_64/special -mpi -c "strdef RunName" -c "RunName = \"sim1\"" sim.hoc
