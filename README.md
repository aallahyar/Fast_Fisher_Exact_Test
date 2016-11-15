# Fast_Fisher_Exact_Test
Fast implementation of Fisher exact test (hypergeometric test) in Matlab.

My tests showed that this implementation is about 40 times faster than current implementation in Matlab (ver 2016b).

Note that this code is heavily inspired by an implementation by Jia Meng: 
https://nl.mathworks.com/matlabcentral/fileexchange/34846-fast-algorithm-for-the-log-p-value-of-fisher-s-exact-test-or-hypergeometric-distribution

Usage example:
|              | Men | Women | Row Total
| :-------:    |:---:| :----:|
| Have hat     |  a  |   b   | a+b
| No hat       |  c  |   d   | c+d
| Column Total | a + c | b + d | N
