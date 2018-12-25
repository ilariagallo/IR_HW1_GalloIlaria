# IR_HW1_GalloIlaria

The folder called "run" contains the run results computed with Terrier.
The folder called "eval measures" contains the evaluation metrics from trec_eval, one for each run.
The ANOVA folder contains the source code (Matlab files) to perform the one-way ANOVA statistical test and some results.
In particular the file ir_anova.m takes in input some data extracted from the trec_eval files (with txt_processing_map.m, txt_processing_P10.m, txt_processing_Rprec.m) and gives in output a table with the statistical test results, the boxplot and the Tukey HSD test plot.
The "other statistics" folder contains the source code and plot of the Interpolated Precision-Recall Curves.
