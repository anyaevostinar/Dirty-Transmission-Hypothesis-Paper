import os.path
import gzip

folder = "../../Data/02.13.2022-NoIntValMut/"

treatment_postfixes_HMR = ["HMR0.1", "HMR0.5", "HMR1.0"]
vert_postfixes = ["VR0.1", "VR0.2", "VR0.3", "VR0.4", "VR0.5", "VR0.6", "VR0.7", "VR0.8", "VR0.9", "VR1.0"]
partners = ["Host", "Sym"]
reps = range(10, 40)
#reps = range(1001, 1021)
header = "uid HMR VR rep update donate partner\n"

outputFileName = "munged_average.dat"

outFile = open(outputFileName, 'w')
outFile.write(header)

for t in treatment_postfixes_HMR:
    for v in vert_postfixes:
        for r in reps:
            for p in partners:
                fname = folder +p+"Vals"+t+v+"_Seed" + str(r) +"_SEED"+str(r) + ".data"
                uid = t + "_" + str(r)
                curFile = open(fname, 'r')
                for line in curFile:
                    if (line[0] != "u"):
                        splitline = line.split(',')
                        #if int(splitline[0]) == final_update:
                        outstring1 = "{} {} {} {} {} {} {}\n".format(uid, t, v, r, splitline[0], splitline[1], p)
                        outFile.write(outstring1)
                curFile.close()
outFile.close()
