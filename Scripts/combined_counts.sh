
folder_path="~/lius/salmon_counts"
result_file="$folder_path/merged_counts.csv"
files=($(ls $folder_path | grep '_counts$'))


if [ ${#files[@]} -eq 0 ]; then
    echo "without file"
    exit 1
fi

echo "Initializes the result file: $result_file"
echo -n "transcript" > $result_file


for file in "${files[@]}"; do
    echo -n ",$file" >> $result_file
done
echo >> $result_file

temp_file="$folder_path/temp_counts.csv"

first_file="${files[0]}"
awk 'NR>1 {print $1}' "$folder_path/$first_file" > $temp_file

for file in "${files[@]}"; do
    awk 'NR>1 {print $2}' "$folder_path/$file" > "$folder_path/temp_counts_col.csv"
    paste -d, $temp_file "$folder_path/temp_counts_col.csv" > "$folder_path/temp_counts_merged.csv"
    mv "$folder_path/temp_counts_merged.csv" $temp_file
done

paste -d, <(echo "transcript" && awk 'NR>1 {print $1}' "$folder_path/$first_file") <(cat $temp_file) > $result_file

rm $temp_file "$folder_path/temp_counts_col.csv"

