# Fast_Fisher_Exact_Test
Fast implementation of Fisher exact test (hypergeometric test) in Matlab.

My tests showed that this implementation is about 40 times faster than current implementation in Matlab (ver 2016b).

Note that this code is heavily inspired by an implementation by Jia Meng: 
[MatWorks FileExchange](https://nl.mathworks.com/matlabcentral/fileexchange/34846-fast-algorithm-for-the-log-p-value-of-fisher-s-exact-test-or-hypergeometric-distribution)

Usage example:

|              | Men | Women | Row Total
| :-------:    |:---:| :----:| :---:
| Have hat     |  a  |   b   | a+b
| No hat       |  c  |   d   | c+d
| Column Total | a + c | b + d | N

P-value of such a table can be calculated by:
[FisherEquation] https://wikimedia.org/api/rest_v1/media/math/render/svg/89491b3e58ce5ba651d3d22217cbbcbf05fbd7f1 "FisherExactTest"
