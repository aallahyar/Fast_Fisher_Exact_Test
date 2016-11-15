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
My tests showed that this implementation is about 40 times faster than current implementation in Matlab (ver 2016b).

### Citation
This code is heavily inspired by an implementation by Jia Meng: 
[MatWorks FileExchange](https://nl.mathworks.com/matlabcentral/fileexchange/34846-fast-algorithm-for-the-log-p-value-of-fisher-s-exact-test-or-hypergeometric-distribution)

### Usage example
This example calculates "left tail" log_2(p-value) (i.e. mutual exclusivity) as well as "right tail" log_2(p-value) (i.e. cooperation):

`[log_pval_left_tail, log_pval_right_tail] = FastFisherExactTest(a, b, c, d)`

In order to get the exact p-values simply use:

`pval_left_tail = exp(logp_left_tail)`

### Known Bugs
In my test, I could identify (Real Pval)/1e-10 difference between my implementation and Matlab. I think it is due to round-off errors. You can use 
