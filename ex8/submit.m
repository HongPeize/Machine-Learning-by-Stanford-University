function submit()
  addpath('../lib','../lib/jsonlab');

  conf.assignmentKey = 'gkyVYM98RcWlmQ9s84QNKA';
  conf.itemName = 'Anomaly Detection and Recommender Systems';
  conf.partArrays = { ...
    { ...
      'WGzrg', ...
      { 'estimateGaussian.m' }, ...
      'Estimate Gaussian Parameters', ...
    }, ...
    { ...
      '80Tcg', ...
      { 'selectThreshold.m' }, ...
      'Select Threshold', ...
    }, ...
    { ...
      'KDzSh', ...
      { 'cofiCostFunc.m' }, ...
      'Collaborative Filtering Cost', ...
    }, ...
    { ...
      'wZud3', ...
      { 'cofiCostFunc.m' }, ...
      'Collaborative Filtering Gradient', ...
    }, ...
    { ...
      'BP3th', ...
      { 'cofiCostFunc.m' }, ...
      'Regularized Cost', ...
    }, ...
    { ...
      'YF0u1', ...
      { 'cofiCostFunc.m' }, ...
      'Regularized Gradient', ...
    }, ...
  };
  conf.output = @output;

  submitWithConfiguration(conf);
  rmpath('../lib/jsonlab', '../lib');
end

function out = output(partId, auxstring)
  % Random Test Cases
  n_u = 3; n_m = 4; n = 5;
  X = reshape(sin(1:n_m*n), n_m, n);
  Theta = reshape(cos(1:n_u*n), n_u, n);
  Y = reshape(sin(1:2:2*n_m*n_u), n_m, n_u);
  R = Y > 0.5;
  pval = [abs(Y(:)) ; 0.001; 1];
  Y = (Y .* double(R));  % set 'Y' values to 0 for movies not reviewed
  yval = [R(:) ; 1; 0];
  params = [X(:); Theta(:)];
  if partId == 'WGzrg'
    [mu, sigma2] = estimateGaussian(X);
    out = sprintf('%0.5f ', [mu(:); sigma2(:)]);
  elseif partId == '80Tcg'
    [bestEpsilon, bestF1] = selectThreshold(yval, pval);
    out = sprintf('%0.5f ', [bestEpsilon(:); bestF1(:)]);
  elseif partId == 'KDzSh'
    [J] = cofiCostFunc(params, Y, R, n_u, n_m, ...
                       n, 0);
    out = sprintf('%0.5f ', J(:));
  elseif partId == 'wZud3'
    [J, grad] = cofiCostFunc(params, Y, R, n_u, n_m, ...
                             n, 0);
    out = sprintf('%0.5f ', grad(:));
  elseif partId == 'BP3th'
    [J] = cofiCostFunc(params, Y, R, n_u, n_m, ...
                       n, 1.5);
    out = sprintf('%0.5f ', J(:));
  elseif partId == 'YF0u1'
    [J, grad] = cofiCostFunc(params, Y, R, n_u, n_m, ...
                             n, 1.5);
    out = sprintf('%0.5f ', grad(:));
  end 
end
