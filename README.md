This repo is for cooperation of CQU's `Management Information System(MIS)` course.

[homewok1](homework1.md)

# score

由于此课程最终小组得分由组员“瓜分”，因此需记取贡献权重。

每次作业每位组员保底 0.1 权重，剩余 0.3 由主力组员根据贡献分配。确保每次作业主力组员不同。

记第 n 次作业权重为 $W_n$

记某人在第 n 次作业中的贡献权重为 $C_n$

$$
score = \frac {total score} {\sum_1^N {Wn}} \cdot \sum_1^N {( W_n\cdot C_n)}
$$

```sh
python score.py
```
