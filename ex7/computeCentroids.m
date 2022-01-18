function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m, n] = size(X); %m=300 n=2

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

x_coord = 0;
y_coord = 0;

for k = 1:K %we need K centroids
    [r, ~] = find(idx == k);
    %r
    for i = 1:length(r)
        x_coord = x_coord + X(r(i),1);
        y_coord = y_coord + X(r(i),2);
    end
    centroids(k,1) = (1/length(r)) * x_coord;
    centroids(k,2) = (1/length(r)) * y_coord;
    x_coord = 0;
    y_coord = 0;
end

% =============================================================


end

