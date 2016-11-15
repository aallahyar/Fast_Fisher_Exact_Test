function [pval_left, pval_right] = FastFisherExactTest(a, b, c, d)
% Calculate the natural log p-value of hypergeometric distribution (Fisher exact test)
% Amin Allahyar A.Allahyar@TUDelft.nl
%
% Based on original implementation of:
% Jia Meng, jmeng@mit.edu
% please cite: Meng, J., S. J. Gao, et al. (2009). "Enrichment constrained
% time-dependent clustering analysis for finding meaningful temporal
% transcription modules." Bioinformatics 25(12): 1521-1527.

%% Params:
% logp_left  = Left tail of distribution (Mutual Exclusive)
% logp_right = Right tail of distribution (Cooperation)

PosC1 = a+b;
PosC2 = a+c;
Total = a+b+c+d;

if a>=PosC1
	pval_left = 1;
else
	x_left = 0:a;
	lst = -log_f(x_left)-log_f(PosC2-x_left)-log_f(PosC1-x_left)-log_f(Total+x_left-PosC2-PosC1);
	lst_max = max(lst);
	pval_left = exp(log_f(PosC2)+log_f(Total-PosC2)+log_f(PosC1)+log_f(Total-PosC1)-log_f(Total)+lst_max+log(sum(exp(lst-lst_max))));
end

if nargout>1
	if a*Total*PosC1*PosC2 == 0
		pval_right = 1;
	else
		minCT = min(PosC1,PosC2);
		n_lst = minCT-a+1;
		x_right = a:n_lst+a-1;
		lst = -log_f(x_right)-log_f(PosC2-x_right)-log_f(PosC1-x_right)-log_f(Total+x_right-PosC2-PosC1);
		lst_max = max(lst);
		pval_right = exp(log_f(PosC2)+log_f(Total-PosC2)+log_f(PosC1)+log_f(Total-PosC1)-log_f(Total)+lst_max+log(sum(exp(lst-lst_max))));
	end
end
end

function logfactoria = log_f(x)
% compile a table
persistent logftable

if isempty(logftable)
	logftable = log(0:100000);
	logftable(1) = 0;
	logftable = cumsum(logftable);
end

% refer to table
x(x<0) = 1;
logfactoria = logftable(x+1);
end
