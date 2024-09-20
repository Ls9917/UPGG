echo -e "MAGID\torganism\tcontigs\tbases\tCDS\trRNA\ttRNA\ttmRNA"
for file in *.txt; do
    
    echo -ne "$file\t" 
    while IFS=: read -r key value; do
        case $key in
            organism) organism=$value ;;
            contigs) contigs=$value ;;
            bases) bases=$value ;;
            CDS) CDS=$value ;;
			rRNA) rRNA=$value ;;
            tRNA) tRNA=$value ;;    
        esac
    done < "$file"
    echo -e "$organism\t$contigs\t$bases\t$CDS\t$rRNA\t$tRNA\t$tmRNA"
done
