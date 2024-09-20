output_file="~/lius/salmon_counts/transcript_counts_summary.txt"
echo -e "filename\tcount" > $output_file
for file in /disk213/lius/salmon_counts/*_counts; do
    if [[ -f "$file" ]]; then
        count=$(awk '$2 > 0 {count++} END {print count+0}' "$file")
        echo -e "$file\t$count" >> $output_file
    fi
done
