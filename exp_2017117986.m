% 2017117986_�̱���
% ���Ϸ� �޼��� Ȱ���Ͽ� e^-x �Լ��� ���Ͽ��� �Ѵ�.
% ���Ϸ� �޼��� � �������� �Լ���(rangestore)�� �ٸ� �� ��(a)������ �Լ����� ���Լ���� �����Ѵ�.
function exp_2017117986(range1,range2,datanumber,a,n) 
% �Լ� �׷��� ������ ��Ÿ�� ���� : [range1,range2] �󱸰� ������ datanumber��ŭ�� point�� ��´�.
% ���Ϸ� �޼��� Ȱ���ϱ� ���� a(������ �Ǵ� �ٸ� �� ��), n(���Ϸ��޼� ������ n���ױ��� �Ѵ�.)
rangestore = linspace(range1,range2,datanumber);
% linespace �����Լ��� Ȱ���Ͽ� [range1,range2] ������ datanumber��ŭ�� �迭�� ����� rangestore�� �����Ѵ�.
fxapp = exp(-a); 
% ���Ϸ��޼� ������ 0���� f(a)�� �����Ѵ�.(fx approximation)
for i = 1:n
    fxapp = fxapp + (((-1)^(i))*exp(-a)*(rangestore-a).^i)/factorial(i);
end % ���Ϸ��޼� �������� f^(n) (<= ���Լ� �κ�)�� fx = e^-x�Լ��̹Ƿ� �̺��� �ݺ��ϸ� ��ȣ�� �ٲ��.
    % rangestore�� �迭�̹Ƿ� fxapp�� �迭�� �ǰ�, fxapp �迭�� �� point������ �Լ����� ����ȴ�.
    fprintf('    (x,e^-x) = \n');
for k = 1:datanumber
    fprintf('[%d] (%.4f, %.4f)\n',k,rangestore(k),fxapp(k));
end % ��� ����� ���� for���� plot��
plot(rangestore,fxapp,'r--o','linewidth',4),title('e^-x versus x'),xlabel('x'),ylabel('e^-x'),grid;
end 
