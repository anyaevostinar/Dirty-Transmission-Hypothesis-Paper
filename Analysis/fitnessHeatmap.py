# importing the modules
from random import randint
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
  
#host_int_vals = [-1, -0.9, -0.8, -0.7, -0.6, -0.5, -0.4, -0.3, -0.2, -0.1, 0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
host_int_vals = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
#sym_int_vals = [-1, -0.9, -0.8, -0.7, -0.6, -0.5, -0.4, -0.3, -0.2, -0.1, 0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
sym_int_vals = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
sym_int_vals
host_int_vals.reverse()


host_res = []
sym_res = []
synergy = 2
res_update = 100

for h in range(len(host_int_vals)):
    host_res.append([None] * len(sym_int_vals))
    sym_res.append([None] * len(sym_int_vals))
    for s in range(len(sym_int_vals)):
        host_donate = res_update * host_int_vals[h]
        host_resources = res_update - host_donate
        sym_donate = host_donate * sym_int_vals[s]
        sym_res[h][s] = host_donate - sym_donate
        host_res[h][s] = host_resources + sym_donate * synergy
        

  
# plotting the heatmap


hm = sns.heatmap(data = sym_res, xticklabels = sym_int_vals, yticklabels = host_int_vals)
  
# displaying the plotted heatmap
plt.show()