# Fast Fisher Exact Test
Fast implementation of Fisher exact test (hypergeometric test) in Matlab. This function requires no toolbox to be installed (tested on Matlab v2016b).

### Description:
One can use fisher exact test to calculate degree of association between two groups. The following is a contingency table for association between being a man (or woman) and wearing hat.

|              | Men | Women | Row Total
| :-------:    |:---:| :----:| :---:
| **Have hat**     |  a  |   b   | a+b
| **No hat**       |  c  |   d   | c+d
| **Column Total** | a + c | b + d | N

P-value of such a table can be calculated by:

<img align="center" src="https://wikimedia.org/api/rest_v1/media/math/render/svg/89491b3e58ce5ba651d3d22217cbbcbf05fbd7f1" alt="FisherExactTest">

### Speed
My tests showed that this implementation is at least 20 times faster than current implementation in Matlab (ver 2016b).

### Citation
This code is heavily inspired by an implementation by Jia Meng: 
[MatWorks FileExchange](https://nl.mathworks.com/matlabcentral/fileexchange/34846-fast-algorithm-for-the-log-p-value-of-fisher-s-exact-test-or-hypergeometric-distribution)

### Usage example
This example calculates "left tail" (i.e. mutual exclusivity) p-value as well as "right tail" (i.e. cooperation) p-value:

`[pval_left_tail, pval_right_tail] = FastFisherExactTest(a, b, c, d)`

### Known Bugs
In my tests, I could identify 1e-10 difference between my implementation and Matlab. I think it is due to round-off errors. A script is provided in "testcode.m" to compare results with Matlab.
