% 2017117986_이근정
% 테일러 급수를 활용하여 e^-x 함수를 구하여야 한다.
% 테일러 급수는 어떤 점에서의 함수값(rangestore)을 다른 한 점(a)에서의 함수값과 도함수들로 예측한다.
function exp_2017117986(range1,range2,datanumber,a,n) 
% 함수 그래프 파형의 나타낼 범위 : [range1,range2] 폐구간 범위에 datanumber만큼의 point를 찍는다.
% 테일러 급수를 활용하기 위한 a(기준이 되는 다른 한 점), n(테일러급수 전개를 n차항까지 한다.)
rangestore = linspace(range1,range2,datanumber);
% linespace 내장함수를 활용하여 [range1,range2] 범위에 datanumber만큼의 배열을 만들고 rangestore에 저장한다.
fxapp = exp(-a); 
% 테일러급수 전개의 0차항 f(a)를 정의한다.(fx approximation)
for i = 1:n
    fxapp = fxapp + (((-1)^(i))*exp(-a)*(rangestore-a).^i)/factorial(i);
end % 테일러급수 전개에서 f^(n) (<= 도함수 부분)은 fx = e^-x함수이므로 미분을 반복하면 부호만 바뀐다.
    % rangestore는 배열이므로 fxapp도 배열이 되고, fxapp 배열에 각 point에서의 함수값이 저장된다.
    fprintf('    (x,e^-x) = \n');
for k = 1:datanumber
    fprintf('[%d] (%.4f, %.4f)\n',k,rangestore(k),fxapp(k));
end % 결과 출력을 위한 for문과 plot문
plot(rangestore,fxapp,'r--o','linewidth',4),title('e^-x versus x'),xlabel('x'),ylabel('e^-x'),grid;
end 
