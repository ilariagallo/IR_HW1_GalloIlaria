# IR_HW1_GalloIlaria

The folder called "run" contains the run results computed with Terrier.
The folder called "eval measures" contains the evaluation metrics from trec_eval, one for each run.
The ANOVA folder contains some code in Matlab in order to perform the one-way ANOVA statistical test.
In particular the file ir_anova.m, which takes in input some data extracted from the trec_eval files (with txt_processing_map.m, txt_processing_P10.m, txt_processing_Rprec.m) and gives in output the boxplot and the Tukey HSD test plot.
The "other statistics" folder contains the source code and plot of the Interpolated Precision-Recall Curves.
