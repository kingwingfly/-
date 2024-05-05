%{
第一次作业：
淘宝“女王节”，某电商计划同往年一样销售某品牌的化妆品。依据往年实际销量情况，若销路
好，可按预期价格卖出10万套；若销路一般，尚可卖出5万套；但若销路差，则只能卖出1万套
了。已知正常情况下每卖出一套可赚50元，但如果进货过量，则多余部分只好降价转手处理，
每套反而要亏损30元。以往销路情况统计概率为：好为30%，中为50%，差为20%。为了获得最
大利润，公司准备花钱先进行一下市场调查，以便尽可能摸清市场行情按需组织货源，那么问
题来了：最多花费多少是值得的？
%}
%% 读取表格
filename = 'MIS1.xlsx';
table = readtable(filename,'ReadVariableNames',false,'ReadRowNames',false);
gain = str2double(cell2mat(table{1,1}));  %读取正常卖出时的盈利值
loss = table{1,2};  %读取降价转手处理的盈利值
prob = table{1,5:end};  %读取每种销路状态的概率
stock = table{2:end,4}; %读取每种销路状态的销量（库存、进货量）
stock = stock(~isnan(stock));
prob = prob(~isnan(prob));
%% 计算
n1 = length(prob);  %市场销路状态数量1
n2 = length(stock);  %市场销路状态数量2
if n1 ~= n2    %检查表格输入是否正确，销量数和概率数应一致，否则报错退出程序
    error('invalid table input! ');
end
res = ones(n1,n1);  %收益矩阵
EMV = ones(n1,1);   %平均期望收益
for i = 1:n1
    for j = 1:n1
        if stock(i) <= stock(j) %判断能否卖完
            res(i,j) = stock(i) * gain;
        else
            res(i,j) = stock(j) * gain + (stock(i)-stock(j))*loss;
        end
    EMV(i,1) = res(i,:)*prob';   %计算平均期望收益
    end
end
T = [res EMV];
EMVmax = max(EMV);  %最大平均期望收益
Emax = 0;
for j = 1:n1
    Emax = Emax + max(res(:,j)) * prob(j);  %计算最大全情报收益
end
EVPI = Emax - EMVmax;
%% 写入表格
writematrix(T,filename,'Range','E3');
writematrix(EMVmax,filename,'Range','B4');
writematrix(Emax,filename,'Range','B5');
writematrix(EVPI,filename,'Range','B6');