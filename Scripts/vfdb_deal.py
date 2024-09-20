from collections import defaultdict

vfg_counts = defaultdict(int)

with open('protein90.vfdb.tab', 'r') as file:
    for line in file:
        vfg_id = line.split()[1]  
        vfg_prefix = vfg_id.split('(')[0]  
        
        if vfg_prefix.startswith('VFG'):  
            vfg_counts[vfg_prefix] += 1  

with open('VFG_count.txt', 'w') as output_file:
    for vfg_id, count in vfg_counts.items():
        output_file.write(f"{vfg_id}: {count}\n")