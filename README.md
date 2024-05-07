This repo is for cooperation of CQU's `Management Information System(MIS)` course.

[homewok1](homework1.md)

# score

由于此课程最终小组得分由组员“瓜分”，因此需记取贡献权重。

记第 n 次作业权重为 $W_n$

记某人在第 n 次作业中的贡献权重为 $C_n$

$$
score = \frac {total score} {\sum_1^N {Wn}} \cdot \sum_1^N {( W_n\cdot C_n)}
$$

```sh
python score.py
```
