from collections import Counter

file_path = 'overview.txt' 
output_file = 'cazy_count.txt' 
data = []  


with open(file_path, 'r') as file:
    next(file)  
    for line in file:
        items = line.strip().split('\t')
        tools = items[3].split('+')  
        data.extend(tools)


tool_count = Counter(data)


with open(output_file, 'w') as output:
    for tool, count in tool_count.items():
        output.write(f"{tool}: {count}\n")