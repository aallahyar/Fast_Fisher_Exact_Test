function [logp_left, logp_right] = FastFisherExactTest(a, b, c, d)
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

C = a+b;
T = a+c;
N = a+b+c+d;

minCT = min(C,T);

x_left = 0:a;
lst = -log_f(x_left)-log_f(T-x_left)-log_f(C-x_left)-log_f(N+x_left-T-C);
lst_max = max(lst);
logp_left = log_f(T)+log_f(N-T)+log_f(C)+log_f(N-C)-log_f(N)+lst_max+log(sum(exp(lst-lst_max)));

if nargout>1
	if a*N*C*T == 0
		logp_right = 0;
	else
		n_lst = minCT-a+1;
		x_right = a:n_lst+a-1;
		lst = -log_f(x_right)-log_f(T-x_right)-log_f(C-x_right)-log_f(N+x_right-T-C);
		lst_max = max(lst);
		logp_right = log_f(T)+log_f(N-T)+log_f(C)+log_f(N-C)-log_f(N)+lst_max+log(sum(exp(lst-lst_max)));
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
logfactoria = logftable(x+1);
end
