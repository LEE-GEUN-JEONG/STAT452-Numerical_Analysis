function test1()
a = input('first value ? ');
b = input('second value ? ');
fprintf('first value : %d \nsecond value : %d\n',sub1(a,b),sub2(a,b));
end
function o1 = sub1(x,y)
o1 = x + y;
end
function o2 = sub2(x,y)
o2 = x - y;
end

