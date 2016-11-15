# Fast Fisher Exact Test
Fast implementation of Fisher exact test (hypergeometric test) in Matlab. 

## Description:
One can use fisher exact test to calculate degree of association between two groups. The following is a contingency table for association between being a man (or woman) and wearing hat.

|              | Men | Women | Row Total
| :-------:    |:---:| :----:| :---:
| **Have hat**     |  a  |   b   | a+b
| **No hat**       |  c  |   d   | c+d
| **Column Total** | a + c | b + d | N

P-value of such a table can be calculated by:

<img align="center" src="https://wikimedia.org/api/rest_v1/media/math/render/svg/89491b3e58ce5ba651d3d22217cbbcbf05fbd7f1" alt="FisherExactTest">

# Speed
My tests showed that this implementation is about 40 times faster than current implementation in Matlab (ver 2016b).

# Citation
Note that this code is heavily inspired by an implementation by Jia Meng: 
[MatWorks FileExchange](https://nl.mathworks.com/matlabcentral/fileexchange/34846-fast-algorithm-for-the-log-p-value-of-fisher-s-exact-test-or-hypergeometric-distribution)

# Usage example:
`[logp_left, logp_right] = FastFisherExactTest(a, b, c, d)`
