This folder contains the configuration and scripts for generating the data. The data itself is too much to fit onto GitHub, but with these two files for each treatment, you should be able to regenerate all data.

To regenerate the data in a folder, first make the executable of Symbulation in SymbulationEmp, then go into the folder of interest and run
```
python3 simple_repeat.py
```

## HorizMutRateSweep 
Started on 8/8/21, sweeping three settings for the horizontal transmission mutation rate at a vertical transmission rate of 30% to determine the effect of increasing mutation rate during horizontal transmission. The rates are 10%, 50% and 100% rate of mutation.
