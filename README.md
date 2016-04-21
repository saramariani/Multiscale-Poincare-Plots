Multiscale-Poincare-Plots
================
#### Overview
Poincaré delay maps are widely used in the analysis of cardiac interbeat interval (RR) dynamics. To facilitate visualization of the structure of these complex time series, we introduced a methodology called  multiscale Poincaré (MSP) plots.
Briefly, the function MsPplots.m (version 1.0) starts with the original time  and series employs a coarse-graining procedure to create a family of time series, each of which represents the system’s dynamics on a different time scale. Next, Poincaré (delay) plots are constructed (using the function [dscatter.m](http://www.mathworks.com/matlabcentral/fileexchange/8430-flow-cytometry-data-reader-and-visualization/content/dscatter.m) by Robert Henson) for the original and the coarse-grained time series. Finally, as an optional adjunct, color can be added to each point to represent its normalized frequency.

For illustrations and further information, please refer to the [Multiscale Poincaré Plots Physionet page](https://physionet.org/physiotools/mpp/).

### Sample Input
Mandatory inputs to the function are:
- The time series vector with one column (X)
- The number of time scales (integer; default: scales = 12)
- Poincaré plots from scale 1 to scales by scstep. (integer; default: scstep = 1)
- The number of rows in the plot montage (integer; default: nrwo = 3)
- The number of columns in the plot montage (integer; default: ncol = 4)
- A option that allows to save the final figure (boolean; default: 1)
- The name of the figure to be saved (default: Figure1.png)

Along with the function, we provide two examples that employ deidentified RR time series from two sources: one from the database for Chaos: Is the Normal Heart Rate Chaotic? and the other from the Normal Sinus Rhythm RR Interval Database, both available at PhysioNet. 

#### Requirements
The functions have been tested on Matlab R2010b, R2014b and R2015a on April 11 2016.
Please note that the first example script requires the text file n2-filtered included in this directory, and the second one requires the [WFDB Matlab toolbox](http://physionet.org/physiotools/matlab/wfdb-app-matlab/) to access data from Physiobank.

#### Acknowledgments
The Multiscale Poincaré Plot (MSP) software package was developed at the Wyss Institute for Biologically Inspired Engineering at Harvard University and Beth Israel Deaconess Medical Center/Harvard Medical School by Teresa S. Henriques, Sara Mariani and Anton Burykin. 

A detailed description can be found at:
[Henriques TS, Mariani S, Burykin A, Rodrigues F, Silva TF, Goldberger AL. Multiscale Poincaré plots for visualizing the structure of heartbeat time series.  BMC Medical Informatics and Decision Making. 2016 Feb 9;16(1):1.]( http://bmcmedinformdecismak.biomedcentral.com/articles/10.1186/s12911-016-0252-0)

#### Licensing
The helper function dscatter.m is written by a separate author and is covered by the BSD License under Mathworks. The rest of the software in this directory is licensed under the GNU Public License 3.

#### More Questions
Please report bugs and questions at teresasarhen@gmail.com.

#### Related links
- [Open Source Publication](http://bmcmedinformdecismak.biomedcentral.com/articles/10.1186/s12911-016-0252-0)
- [National Sleep Research Resource](https://sleepdata.org/)
- [Physionet: Multiscale Poincaré Plots](https://physionet.org/physiotools/mpp/)
