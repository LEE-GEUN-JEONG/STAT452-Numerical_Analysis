function [ eig_val, eig_vec ] = power_method(A,es,maxit)  
%%%%%%%%% 입력 행렬이 n >=3,square,symmetric matrix를 만족하는지 판별 %%%%%%%%%%%
[n,m] = size(A);
if n~=m, error('not square matrix');
elseif n < 3, error('not larger than 3*3');
elseif issymmetric(A) == 0, error('not symmetric matrix');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X = ones(n,1); % 초기 eigen vector 설정
oldval = 0; % 초기 eigen value 설정
%%%%%%%%% largest OR smallest eigen value 사용자가 선택 %%%%%%%%%%%%
choice = input('Eigen value : the 1.largest  2.smallest ?');
%%%%%%%%% choice가 2인 경우에만 행렬 A를 역행렬로 바꿔준다.%%%%%%%%%
if choice == 2,  A=inv(A);
elseif choice == 1
else, error('choice 1 or 2!');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for iter = 1:1:maxit % 최대 반복횟수 = maxit
        if max(A*X) ~= max(abs(A*X)), eig_val = -max(abs(A*X)); % 행렬 요소의 절대값의 최대값이 음수인 경우에 -를 붙여준다.
        else, eig_val = max(abs(A*X)); % powermethod를 이용 => eigen value = AX 행렬 요소의 최대값
        end
    X = (A*X)/eig_val;
    eig_vec = X; % eigen vector = AX행렬을 eigen value(scalar) * eigen vector(vector) 꼴 일때의 vector 
    ea = abs((oldval - eig_val)*100/oldval);
    if ea <= es, break; end % 허용오차보다 작으면 for문을 탈출
    oldval = eig_val; % 기존 eigen value 값을 oldval에 저장
    end
    if choice == 2, eig_val = 1 / eig_val; end % choice ==2, 즉 smallest 경우에는 eig_val에 역수를 취해주어야 한다.
end