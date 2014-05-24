kegg-reaction-graph-mapper
=========================

A tool to extract reaction graph .mol files from standard [KEGG dataset](http://www.genome.jp/kegg/) .mol files. This implementation was originally done by Markus Heinonen ("Efficient Path Kernels for Reaction Function Prediction" - M Heinonen, N Välimäki, V Mäkinen, J Rousu - 2012).

Contents
--------

* atommapper
* build.sh
* extract-reactiongraphs.py
* feature-generator
* reaction-list
* README.md - This readme

Usage
-----

**Prerequisites**

* python
* java 

** Build ** 

The script `build.sh` compiles everything, namely the the atommapper written in Java.

** Run **

The package uses [KEGG](http://www.genome.jp/kegg/) .mol files as input and computes reaction graph .mol files as mentionend in ("Efficient Path Kernels for Reaction Function Prediction" - M Heinonen, N Välimäki, V Mäkinen, J Rousu - 2012). A script is contained to run all steps automatically: `extract-reactiongraphs.py [-h] -k KEGGPATH [-v]`. The results will be stored in the `results` directory. 

Here are the same steps if run manually:

1. reaction-list: Create KEGG reaction listing with `python reaction-list/extract-reactions.py -k KEGGPATH > RESULTS/kegg-reactions.txt`. 
2. feature-generator: Create atom features from KEGG mol files using `python generator2011.py KEGGPATH/mol/* -k all --output-dir RESULTS/mol-features/`. The optional parameter k specifies the context size, default is all. There are other optional parameters for this script.
3. atommapper: Create reactiongraph mol files with atommapper: `java Mapper2000 -rgraphs -moldir KEGGPATH/mol/ -featdir RESULTS/mol-features/ -reacfile RESULTS/kegg-reactions.txt -output RESULTS/reaction-graphs`. There are further optional parameters for this script.

License: GNU General Public License
-----------------------------------

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.