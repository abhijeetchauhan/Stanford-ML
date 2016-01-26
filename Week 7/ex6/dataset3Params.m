function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;
error=100000;
% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
%{
model=svmTrain(X,y,C,@(x1,x2) gaussianKernel(x1,x2,sigma));
predictions=svmPredict(model,Xval);
error=mean(double(predictions ~= yval));
fprintf("C-%f,sigma-%f,error-%f\n",C,sigma,error);
guess=[0.01;.03;.1;.3;1;3;10;30];
for i=1:8
  for j=1:8
    %[model]=svmTrain(X,y,guess(i),@gaussianKernel);
    model=svmTrain(X,y,guess(i),@(x1,x2) gaussianKernel(x1,x2,guess(j)));
    predictions=svmPredict(model,Xval);
    me=mean(double(predictions ~= yval));
    fprintf("C-%f,sigma-%f,error-%f,mean-%f\n",C,sigma,error,me);
    if(me<error)
      error=me;
      C=guess(i);
      sigma=guess(j);
      fprintf("C-%f,sigma-%f,error-%f\n",C,sigma,error);
    endif
  endfor
endfor
%}
% After running above code answers came C=1 sigma=0.1
C=1;sigma=0.1;





% =========================================================================

end
