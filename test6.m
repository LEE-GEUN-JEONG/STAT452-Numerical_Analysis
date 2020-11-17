function out = test6(f,a,b,n,varargin)
x = linspace(a,b,n);
out = f(x,varargin{:});
end
