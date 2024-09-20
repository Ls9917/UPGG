with open('/disk202/lius/catalog/05_cdhit/uniprot/final.protein.faa.90.diamond2uniprot_trembl','r') as file:
    best_hit = {}
    
    
    for line in file:
        fields = line.strip().split('\t')  
        query_id, subject_id, percent_identity, alignment_length, e_value, bit_score = fields[:6]
        
        
        if query_id not in best_hit or float(bit_score) > float(best_hit[query_id]['bit_score']):
            best_hit[query_id] = {
                'subject_id': subject_id,
                'percent_identity': float(percent_identity),
                'alignment_length': int(alignment_length),
                'e_value': float(e_value),
                'bit_score': float(bit_score)
            }
 

for query_id, hit_info in best_hit.items():
    print(f"Query ID: {query_id}")
    print(f"Subject ID: {hit_info['subject_id']}")
    print(f"Percent Identity: {hit_info['percent_identity']}")
    print(f"Alignment Length: {hit_info['alignment_length']}")
    print(f"E-value: {hit_info['e_value']}")
    print(f"Bit Score: {hit_info['bit_score']}")
    print("-------------")