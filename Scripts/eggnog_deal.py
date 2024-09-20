import os
os.chdir("/disk202/lius/microbiome/13.MAG_annoation/eggnog/total.protein.eggout.emapper.annotations")
 
def eggNOG_COG_count(eggnog):
    f1 = open("%s" % (eggnog), "r", encoding='utf-8')
    db={}
    for line in f1.readlines():
        if "#query" not in line:
            COG = line.split("\t")[6].strip("")
            print(COG)
 
            if COG in db:
                db[COG] += 1
            if COG not in db:
                db[COG] = 1
    output = str(eggnog)+"COG_result.txt"
    print(db)
    f2 = open("%s" % (output), "a")
    for ID, seq in db.items():
        print(ID, end="\t", file=f2)
        print(seq, file=f2)
 
for eggnog in os.listdir(os.getcwd()):
    if ("_eggnog.txt" in eggnog) and ("_result.txt" not in eggnog):
        eggNOG_COG_count(eggnog)
