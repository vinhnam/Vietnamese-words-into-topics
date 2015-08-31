#!/bin/sh
cd ~
# What is my home folder, using pwd can be a dynamic option
myhome=`/home/training/Downloads/playground`
# This file stores analysis results
resultFile=`$myhome/testTextOut.txt`
# Folder containing Wikipedia articles
textFolder=`$myhome/nam/`
# Folder on hadoop wherein other folders
hdfsFolder=`/user/`

export HADOOP_CLASSPATH="/usr/lib/hadoop/*:/usr/lib/hadoop/client-0.20/*:$HADOOP_CLASSPATH"

# Copy now your Wiki text folder to hdfs folder
# Sample:
# mahout seqdirectory  -i  /user/nam/text -o  /user/nam/text-seq -c  UTF-8 -chunk 5

hdfs dfs -put  $textFolder/  $hdfsFolder/

# Convert text files in the hadoop folder to sequence format:

mahout seqdirectory  -i  $hdfsFolder/text -o  $hdfsFolder/text-seq -c  UTF-8 -chunk 5

#    Convert sequence format to sparse vector format
#    Output stored in text-vectors
# mahout seq2sparse  -nv   -i  /user/nam/text-seq/ -o   /user/nam/text-vectors
mahout seq2sparse  -nv   -i  $hdfsFolder/text-seq/ -o   $hdfsFolder/text-vectors

# Create 20 k-means cluster now:
#mahout kmeans -i /user/nam/text-vectors/tfidf-vectors/ -c /user/nam/text-kmeansSeed -o /user/nam/text-clusters -dm org.apache.mahout.common.distance.CosineDistanceMeasure -cl  -cd  0.5   -k  20  -ow

mahout kmeans -i $hdfsFolder/text-vectors/tfidf-vectors/  \
-c $hdfsFolder/text-kmeansSeed  \
-o $hdfsFolder/text-clusters   \
-dm org.apache.mahout.common.distance.CosineDistanceMeasure  \
 -cl  -cd  0.5  -x  10  -k  20  -ow

# dump the output to a text file:
# mahout clusterdump  -i  /user/nam/text-clusters/clusters-0 -o  testTextOut.txt -d  /user/nam/text-vectors/dictionary.file-0 -b  100 -p  /user/nam/text-clusters/clusteredPoints -dt  sequencefile   -n  200 > result.txt

mahout clusterdump  -i  $hdfsFolder/text-clusters/clusters-0   \
-o  $resultFile   \
-d  $hdfsFolder/text-vectors/dictionary.file-0 \
-b  100   \
-p  $hdfsFolder/text-clusters/clusteredPoints    \
-dt  sequencefile   -n  20 > result.txt
