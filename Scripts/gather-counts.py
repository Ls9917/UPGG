import os, os.path
import sys
import csv

def process_quant_file(root, filename, outname):
    
    #Convert individual quant.sf files into .counts files (transcripts\tcount).

    print >>sys.stderr, 'Loading counts from:', root, filename
    outfp = open(outname, 'w')
    print >>outfp, "transcript\tcount"

    d = {}
    full_file = os.path.join(root, filename)
    for line in open(full_file):
        if line.startswith('Name'):
            continue
        name, length, eff_length, tpm, count = line.strip().split('\t')

        print >>outfp, "%s\t%s" % (name, float(tpm))


def main():
    
    #Find all the quant.sf files, convert them into properly named .counts files.
    quantlist = []

    start_dir = '.'
    print >>sys.stderr, 'Starting in:', os.path.abspath(start_dir)
    for root, dirs, files in os.walk('.'):
        for filename in files:
            if filename.endswith('quant.sf'):
                dirname = os.path.basename(root)
                outname = dirname + '.counts'
                process_quant_file(root, filename, dirname + '.counts')
                quantlist.append(outname)
                
                break

    print ",\n".join([ "\"%s\"" % i for i in sorted(quantlist)])
if __name__ == '__main__':
    main()
