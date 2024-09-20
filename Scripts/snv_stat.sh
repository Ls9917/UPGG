input_file="~/lius/Catalog/script/snv_file.list"
output_file="~/lius/Catalog/01.assemble/10.snv/information/snv_summary.csv"


echo "Folder,Variant-COMPLEX,Variant-DEL,Variant-INS,Variant-SNP,VariantTotal" > "$output_file"

while IFS= read -r folder_path; do
  if [ -d "$folder_path" ]; then
    snv_file="${folder_path}snv.txt"
    if [ -f "$snv_file" ]; then
      last_5_lines=$(tail -n 5 "$snv_file")
      
      variant_complex=$(echo "$last_5_lines" | grep 'Variant-COMPLEX' | awk '{print $2}')
      variant_del=$(echo "$last_5_lines" | grep 'Variant-DEL' | awk '{print $2}')
      variant_ins=$(echo "$last_5_lines" | grep 'Variant-INS' | awk '{print $2}')
      variant_snp=$(echo "$last_5_lines" | grep 'Variant-SNP' | awk '{print $2}')
      variant_total=$(echo "$last_5_lines" | grep 'VariantTotal' | awk '{print $2}')
      
      echo "$folder_path,$variant_complex,$variant_del,$variant_ins,$variant_snp,$variant_total" >> "$output_file"
    else
      echo "File $snv_file not found." >&2
    fi
  else
    echo "Folder $folder_path not found." >&2
  fi
done < "$input_file"
