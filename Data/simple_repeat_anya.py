#a script to run several replicates of several treatments locally

directory = "HorizMutRateSweepHost0VT05/"
seeds = range(10, 21)
#mut_rates = [0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
mut_rates = [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
#mut_sizes = [0.002, 0.06, 0.14, 1]
#verts = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
#sym_ints = [-1, -0.9, -0.8, -0.7, -0.6, -0.5, -0.4, -0.3, -0.2, -0.1, 0]

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

print("Copying SymSettings.cfg to "+directory)
cmd("cp SymSettings.cfg "+directory)

for a in seeds:
    for b in mut_rates:
        #for c in mut_sizes:
        command_str = './symbulation -SEED '+str(a)+' -MUTATION_RATE 0.1 -HORIZ_MUTATION_RATE '+str(b)+' -FILE_PATH '+directory+' -FILE_NAME HMR'+str(b)+'_Seed'+str(a) + ' -VERTICAL_TRANSMISSION 0.5 -HOST_INT 0 -SYM_INT -0.1 -UPDATES 10001'
#            command_str = './symbulation -SEED '+str(a)+' -START_MOI '+str(b)+' -FILE_PATH '+directory+' -FILE_NAME SM'+str(b)+'_Seed'+str(a)+'_VT'+str(c)+' -VERTICAL_TRANSMISSION '+str(c)
#            command_str = './symbulation -SEED '+str(a)+' -START_MOI '+str(b)+' -FILE_PATH '+directory+' -FILE_NAME SM'+str(b)+'_Seed'+str(a)+'_SINT'+str(c)+' -SYM_INT '+str(c)
#        command_str = './symbulation -SEED '+str(a)+' -VERTICAL_TRANSMISSION '+str(b)+' -FILE_NAME _VT'+str(b)+'_Seed'+str(a) + " -FILE_PATH "+directory
            
        print(command_str)
        cmd(command_str)
