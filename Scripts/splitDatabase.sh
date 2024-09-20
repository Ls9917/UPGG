#!/usr/bin/env bash
#######
# Purpose: Split database list of genomes into multiple chunks to  
#          distribute fastANI execution on multiple compute nodes
# Usage: <this_script>  <file containing genome paths, one per line> <count> <output_directory>
# Ouput: see <count> number of files in <output_directory>

DATABASE=$1
COUNT=$2
OUTPUT_DIR=$3

PREFIX="partition."

######### Split database ##########
TOTAL_COUNT=$( wc -l < $DATABASE )
COUNT_PER_FILE=$( perl -w -e "use POSIX; print ceil($TOTAL_COUNT/$COUNT), qq{\n}" )

echo "Total count of genomes in the given database " $TOTAL_COUNT
cat $DATABASE | shuf > ${OUTPUT_DIR}/.split.tmp
split -dl $COUNT_PER_FILE ${OUTPUT_DIR}/.split.tmp ${OUTPUT_DIR}/${PREFIX}
rm ${OUTPUT_DIR}/.split.tmp

FILE_COUNT=$( ls -1 ${OUTPUT_DIR}/${PREFIX}* | wc -l )
echo "Database is now split into " $FILE_COUNT " files in the folder " $OUTPUT_DIR

#### END OF SCRIPT ###
