% Probability density function
function yax = pdf(obj, xax)

z=((xax(1,:)-obj.Mean(1))/sqrt(obj.Covariance(1,1))).^2-...
    2*obj.Correlation*...
    ((xax(1,:)-obj.Mean(1))/sqrt(obj.Covariance(1,1))).*...
    ((xax(2,:)-obj.Mean(2))/sqrt(obj.Covariance(2,2)))+...
    ((xax(2,:)-obj.Mean(2))/sqrt(obj.Covariance(2,2))).^2;

knl=exp(-0.5*z/(1-obj.Correlation.^2));

yax=obj.ScalingConstant/...
    sqrt(obj.Covariance(1,1))/...
    sqrt(obj.Covariance(2,2))/...
    sqrt(1-obj.Correlation.^2)*...
    knl;
end
