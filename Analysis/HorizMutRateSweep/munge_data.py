import os.path
import gzip

folder = "../../Data/HorizMutRateSweep/"

treatment_postfixes = ["HMR0.1", "HMR0.5", "HMR1.0"]
partners = ["Host", "Sym"]
reps = range(10, 21)
#reps = range(1001, 1021)
header = "uid treatment rep update donate partner\n"

outputFileName = "munged_average.dat"

outFile = open(outputFileName, 'w')
outFile.write(header)

for t in treatment_postfixes:
    for r in reps:
        for p in partners:
            fname = folder +p+"Vals"+t+"_Seed" + str(r) + ".data"
            uid = t + "_" + str(r)
            curFile = open(fname, 'r')
            for line in curFile:
                if (line[0] != "u"):
                    splitline = line.split(',')
                    #if int(splitline[0]) == final_update:
                    outstring1 = "{} {} {} {} {} {}\n".format(uid, t, r, splitline[0], splitline[1], p)
                    outFile.write(outstring1)
            curFile.close()
outFile.close()
