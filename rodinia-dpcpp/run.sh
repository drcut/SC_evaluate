#!/bin/bash
set -e
# make DPCPP_ENV=oneapi DEVICE=CPU time=0

numExecutions=1

echo "Timing dpcpp"

#b+tree
cd b+tree
pwd
for (( i=0; i<$numExecutions; i++ ))
do
    time ./b+tree.out file ../data/b+tree/mil.txt command ../data/b+tree/command.txt
done

cd ../

#backprop
cd backprop
pwd
for (( i=0; i<$numExecutions; i++ ))
do
    time ./backprop 65536
done

cd ../

#bfs
cd bfs
pwd
for (( i=0; i<$numExecutions; i++ ))
do
    time ./bfs ../data/bfs/graph1MW_6.txt
done

cd ../


#gaussian
cd gaussian
pwd
for (( i=0; i<$numExecutions; i++ ))
do
    time ./gaussianElimination -f ../data/gaussian/matrix1024.txt -q
done


cd ../

#hotspot
cd hotspot
pwd
for (( i=0; i<$numExecutions; i++ ))
do
    time ./hotspot 1024 2 2 ../data/hotspot/temp_1024 ../data/hotspot/power_1024 output.out
done

cd ../

#hotspot3D
cd hotspot3D
pwd
for (( i=0; i<$numExecutions; i++ ))
do
    time ./3D 512 8 100 ../data/hotspot3D/power_512x8 ../data/hotspot3D/temp_512x8 output.out
done

cd ../

# #huffman
# cd huffman
# pwd
# for (( i=0; i<$numExecutions; i++ ))
# do
#     time ./pavle ../data/huffman/test1024_H2.206587175259.in
# done

# cd ../

# #lavaMD
# cd lavaMD
# pwd
# for (( i=0; i<$numExecutions; i++ ))
# do
#     time ./lavaMD -boxes1d 10
# done

# cd ../

#lud
cd lud
pwd
for (( i=0; i<$numExecutions; i++ ))
do
    time cuda/lud_cuda -s 2048
done

cd ../

#myocyte
cd myocyte
pwd
for (( i=0; i<$numExecutions; i++ ))
do
    time ./myocyte.out 1024 1 0
done

cd ../

#nn
cd nn
pwd
for (( i=0; i<$numExecutions; i++ ))
do
    time ./nn /nethome/rhan38/Intel_PPoPP_evaluate/SC_evaluate/rodinia-dpcpp/data/nn/filelist.txt -r 5 -lat 30 -lng 90
done

cd ../

#nw
cd nw
pwd
for (( i=0; i<$numExecutions; i++ ))
do
    time ./needleman_wunsch 8000 10
done

cd ../

#particlefilter
cd particlefilter
pwd
#naive 
for (( i=0; i<$numExecutions; i++ ))
do
    time ./particlefilter_naive -x 128 -y 128 -z 10 -np 20000
done

cd ../

#pathfinder
cd pathfinder
pwd
for (( i=0; i<$numExecutions; i++ ))
do
    time ./pathfinder 100000 1000 20
done

cd ../

#srad

cd srad/srad_v2
pwd
for (( i=0; i<$numExecutions; i++ ))
do
    time ./srad 8192 8192 0 127 0 127 0.5 2
done

cd ../..

#streamcluster
cd streamcluster
pwd
for (( i=0; i<$numExecutions; i++ ))
do
    time ./sc_gpu 10 20 256 65536 65536 1000 none output.txt 1
done

cd ../