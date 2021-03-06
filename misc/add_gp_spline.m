
function [ nlz, dnlz] = add_gp_spline( cov, X, y )
    [N,D] = size(X);
    R = D;  
    
    likfunc = 'likGauss'; sn = 0.1; hyp.lik = log(sn);
    inference = @infExact;
    meanfunc = {'meanConst'}; hyp.mean = 0;

    covfunc = { 'covADD',{1:R,'covPPiso2'} };  % Construct an additive kernel
    hyp.cov = cov;
    [ nlz, dnlz] = gp(hyp, inference, meanfunc, covfunc, likfunc, X, y);
    dnlz = dnlz.cov;
end