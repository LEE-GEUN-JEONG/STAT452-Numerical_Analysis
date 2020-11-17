function [ eig_val, eig_vec ] = power_method(A,es,maxit)  
%%%%%%%%% �Է� ����� n >=3,square,symmetric matrix�� �����ϴ��� �Ǻ� %%%%%%%%%%%
[n,m] = size(A);
if n~=m, error('not square matrix');
elseif n < 3, error('not larger than 3*3');
elseif issymmetric(A) == 0, error('not symmetric matrix');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X = ones(n,1); % �ʱ� eigen vector ����
oldval = 0; % �ʱ� eigen value ����
%%%%%%%%% largest OR smallest eigen value ����ڰ� ���� %%%%%%%%%%%%
choice = input('Eigen value : the 1.largest  2.smallest ?');
%%%%%%%%% choice�� 2�� ��쿡�� ��� A�� ����ķ� �ٲ��ش�.%%%%%%%%%
if choice == 2,  A=inv(A);
elseif choice == 1
else, error('choice 1 or 2!');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for iter = 1:1:maxit % �ִ� �ݺ�Ƚ�� = maxit
        if max(A*X) ~= max(abs(A*X)), eig_val = -max(abs(A*X)); % ��� ����� ���밪�� �ִ밪�� ������ ��쿡 -�� �ٿ��ش�.
        else, eig_val = max(abs(A*X)); % powermethod�� �̿� => eigen value = AX ��� ����� �ִ밪
        end
    X = (A*X)/eig_val;
    eig_vec = X; % eigen vector = AX����� eigen value(scalar) * eigen vector(vector) �� �϶��� vector 
    ea = abs((oldval - eig_val)*100/oldval);
    if ea <= es, break; end % ���������� ������ for���� Ż��
    oldval = eig_val; % ���� eigen value ���� oldval�� ����
    end
    if choice == 2, eig_val = 1 / eig_val; end % choice ==2, �� smallest ��쿡�� eig_val�� ������ �����־�� �Ѵ�.
end