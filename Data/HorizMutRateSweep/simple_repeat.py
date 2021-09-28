#a script to run several replicates of several treatments locally
#RUN SIMPLE_REPEAT.PY FROM WITHIN THE FOLDER WHERE THE DATA SHOULD GO
#EX: INSIDE OF Data/Treatment1, RUN python3 simple_repeat.py
#Assumes that SymSettings.cfg with the appropriate base settings is already in the data folder
import sys

h_mut_rates = [0.1, 0.5, 1.0]
vert_rates = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
start_range = 10
end_range = 21

import subprocess

def cmd(command):
    '''This wait causes all executions to run in sieries.                          
    For parralelization, remove .wait() and instead delay the                      
    R script calls unitl all neccesary data is created.'''
    return subprocess.Popen(command, shell=True).wait()

def silent_cmd(command):
    '''This wait causes all executions to run in sieries.                          
    For parralelization, remove .wait() and instead delay the                      
    R script calls unitl all neccesary data is created.'''
    return subprocess.Popen(command, shell=True, stdout=subprocess.PIPE).wait()


if(len(sys.argv) > 1):
    start_range = int(sys.argv[1])
    end_range = int(sys.argv[2])

seeds = range(start_range, end_range)

print("Copying executable to current directory")
cmd("cp ../../SymbulationEmp/symbulation .")
print("Using seeds", start_range, "up to", end_range)

for a in seeds:
    for b in h_mut_rates:
        for c in vert_rates:
            file_name = "HMR"+str(b)+"VR"+str(c)+"_Seed"+str(a)
            
            command_str = './symbulation -SEED '+str(a)+  ' -HORIZ_MUTATION_RATE '+str(b) + ' -VERTICAL_TRANSMISSION '+str(c) + ' -FILE_NAME '+ file_name     
            settings_filename = "Output_"+file_name+".data"
            print(command_str)
            cmd(command_str+" > "+settings_filename)
