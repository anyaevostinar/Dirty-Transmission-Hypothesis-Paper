import os.path
import gzip

folder = '../../Data/12.17.2021-HorizMutSweep/'

treatment_prefixes = ["HMR0.1VR0.3", "HMR0.5VR0.3", "HMR1.0VR0.3"]
mut_sizes = ['']
reps = range(10,40)
p="Sym"

#reps = range(1001, 1021)
header = "uid treatment rep update interval count partner\n"

outputFileName = "munged_histogram_sym.dat"

outFile = open(outputFileName, 'w')
outFile.write(header)

for t in treatment_prefixes:
    for r in reps:
        for m in mut_sizes:
            fname = folder +p+"Vals"+t+"_Seed" + str(r) +"_SEED"+str(r) + ".data"
            uid = t+m + "_" + str(r)
            curFile = open(fname, 'r')
            for line in curFile:
                if (line[0] != "u"):
                    splitline = line.strip().split(',')
                    
                    outstring1 = "{} {} {} {} {} {} {}\n".format(uid, t+m, r, splitline[0], "-1_-.9", splitline[3], p)
                    outFile.write(outstring1)
                    outstring1 = "{} {} {} {} {} {} {}\n".format(uid, t+m, r, splitline[0], "-.9_-.8", splitline[4], p)
                    outFile.write(outstring1)
                    outstring1 = "{} {} {} {} {} {} {}\n".format(uid, t+m, r, splitline[0], "-.8_-.7", splitline[5], p)
                    outFile.write(outstring1)
                    outstring1 = "{} {} {} {} {} {} {}\n".format(uid, t+m, r, splitline[0], "-.7_-.6", splitline[6], p)
                    outFile.write(outstring1)
                    outstring1 = "{} {} {} {} {} {} {}\n".format(uid, t+m, r, splitline[0], "-.6_-.5", splitline[7], p)
                    outFile.write(outstring1)
                    outstring1 = "{} {} {} {} {} {} {}\n".format(uid, t+m, r, splitline[0], "-.5_-.4", splitline[8], p)
                    outFile.write(outstring1)
                    outstring1 = "{} {} {} {} {} {} {}\n".format(uid, t+m, r, splitline[0], "-.4_-.3", splitline[9], p)
                    outFile.write(outstring1)
                    outstring1 = "{} {} {} {} {} {} {}\n".format(uid, t+m, r, splitline[0], "-.3_-.2", splitline[10], p)
                    outFile.write(outstring1)
                    outstring1 = "{} {} {} {} {} {} {}\n".format(uid, t+m, r, splitline[0], "-.2_-.1", splitline[11], p)
                    outFile.write(outstring1)
                    outstring1 = "{} {} {} {} {} {} {}\n".format(uid, t+m, r, splitline[0], "-.1_0", splitline[12], p)
                    outFile.write(outstring1)
                    outstring1 = "{} {} {} {} {} {} {}\n".format(uid, t+m, r, splitline[0], "0_.1", splitline[13], p)
                    outFile.write(outstring1)
                    outstring1 = "{} {} {} {} {} {} {}\n".format(uid, t+m, r, splitline[0], ".1_.2", splitline[14], p)
                    outFile.write(outstring1)
                    outstring1 = "{} {} {} {} {} {} {}\n".format(uid, t+m, r, splitline[0], ".2_.3", splitline[15], p)
                    outFile.write(outstring1)
                    outstring1 = "{} {} {} {} {} {} {}\n".format(uid, t+m, r, splitline[0], ".3_.4", splitline[16], p)
                    outFile.write(outstring1)
                    outstring1 = "{} {} {} {} {} {} {}\n".format(uid, t+m, r, splitline[0], ".4_.5", splitline[17], p)
                    outFile.write(outstring1)
                    outstring1 = "{} {} {} {} {} {} {}\n".format(uid, t+m, r, splitline[0], ".5_.6", splitline[18], p)
                    outFile.write(outstring1)
                    outstring1 = "{} {} {} {} {} {} {}\n".format(uid, t+m, r, splitline[0], ".6_.7", splitline[19], p)
                    outFile.write(outstring1)
                    outstring1 = "{} {} {} {} {} {} {}\n".format(uid, t+m, r, splitline[0], ".7_.8", splitline[20], p)
                    outFile.write(outstring1)
                    outstring1 = "{} {} {} {} {} {} {}\n".format(uid, t+m, r, splitline[0], ".8_.9", splitline[21], p)
                    outFile.write(outstring1)
                    outstring1 = "{} {} {} {} {} {} {}\n".format(uid, t+m, r, splitline[0], ".9_1", splitline[22], p)
                    outFile.write(outstring1)
            curFile.close()
outFile.close()
