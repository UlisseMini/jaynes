---
title: "Jaynes solutions"
author: "Ulisse Mini"
description: 'Exercise solutions for "Probability Theory: The Logic of Science" by E.T. Jaynes.'
---

\newcommand{\imp}{\Rightarrow}
\renewcommand{\neg}[1]{\overline{#1}}

# Introduction

I'm writing these for my own benefit, If you can't find a solution here check out [these solutions](https://maksimim.github.io/JaynesProbabilityTheory/).

## 2.1

Impossible, since our only tool to access the "given" part is the product rule

$$
p(AB|C) = p(A)p(B|AC) = p(B)p(A|BC)
$$

But we only have two "atomic" propositions, $A+B$ and $C$. Without a third it's impossible to apply the product rule, hence we cannot find a formula.

We can find a formula for $p(C(A+B)X)$ however, first use Bayes theorem to get

$$
p(C|(A+B)X) = p(C|X)\frac{p(A+B|CX)}{p(A+B|X)}
$$

Then expand with the generalized sum rule

$$
p(C|X)\frac{p(A|CX)+p(B|CX)-p(AB|CX)}{p(A|X)+p(B|X)-p(AB|X)}
$$

## 2.2

Recall Bayes theorem (rearranged product rule)

$$
p(A|BX) = \frac{p(AB|X)}{p(B|X)}
$$

If we let $A = A_1+\dots+A_n$ and apply Bayes theorem we get

$$
p(C|(A_1 + \dots + A_n)X) = \frac{p(AC|X)}{p(A|X)}
$$

Now examine each term, first, since $A_i$ are disjoint given $X$ induction on the generalized product rule shows

$$
p(A_1+\dots+A_n|X) = \sum_i p(A_i|X)
$$

second, notice that $A_i$ being logically disjoint implies $A_iC$ are logically disjoint (proof: $(A_iC)(A_jC)=(A_iA_j)C$) meaning

$$
\begin{aligned}
p(AC|X) &= p(A_1C + \dots + A_nC|X) \\
&= \sum_i p(A_iC|X) \\
&= \sum_i p(A_i|X)p(C|A_iX)
\end{aligned}
$$

Plugging both terms back into the quotient gives

$$
p(C|(A_1+\dots+A_n)X) = \frac{\sum_i p(A_i|X)p(C|A_iX)}{\sum_i p(A_i|X)}
$$

As desired.

## 2.3

Jaynes sets $a = p(A|C)$ and $b = p(B|C)$, I prefer writing everything out but feel free to substitute if you want.

Probability of conjunction cannot exceed the probability of either conjunct (violating this is called the [conjunction fallacy](https://www.lesswrong.com/posts/QAK43nNCTQQycAcYe/conjunction-fallacy))

$$
p(AB|C) = p(A|C)p(B|AC) \le p(A|C)
$$

For the disjunction notice that $p(A|C)-p(AB|C) \ge 0$ so dropping it gives

$$
p(A+B|C) = p(A|C) + p(B|C) - p(AB|C) \ge p(B|C)
$$

Now if $p(A|C)+p(B|C) \gt 1$ then $p(AB|C) \gt 0$ (from the sum rule)

And if $p(A|C)+p(B|C) \lt 1$ then $p(A+B|C) \lt 1$

<!-- TODO: Not sure if there's more to this I'm missing... -->

## 3.1

Our robot is not distinguishing between red and white balls, the events $R_1W_2$ and $R_1W_2$ are the same even if we draw different balls.

If this confuses you, consider the alternate representation where we do distinguish between red and white balls. Let $R^i_1$ denote drawing the $i$th red ball on the first draw, by definition we have

$$
R_1 = R^1_1 + \dots + R^r_i
$$

<!-- TODO: explain more? -->

## 3.2

Let $X$ be our background information and $A$ be the proposition "we draw at least one of each color".
Let $B_i$ be "we don't draw and balls of color $i$", then

$$
\neg{A} = B_1 + \dots + B_k
$$

We can compute $B_i$ easily, it's just urn counting where "success" is drawing a ball of color $\ne i$.

$$
p(B_i|X) = {N \choose M}^{-1}{N-N_i \choose M}
$$

It's just as easy to compute $p(B_iB_j|X)$ ($i \ne j$)

$$
p(B_iB_j|X) = {N \choose M}^{-1}{N-N_i-N_j \choose M}
$$

We can use inclusion-exclusion to compute $P(\neg{A})$

$$
\begin{aligned}
p(\neg{A}|X) =
&+ p(B_1|X) + \dots + p(B_k|X) \\
&- p(B_1B_2|X) - \dots - p(B_{k-1}B_k|X) \\
&+ p(B_1B_2B_3|X) + \dots + p(B_{k-2}B_{k-1}B_k|X) \\
&- \dots
\end{aligned}
$$

In the special case where $k=5$ and $N_i = 10$ for all $i$ we have

$$
\begin{aligned}
p(\neg{A}|X) =
&+ {50 \choose m}^{-1}{5\choose 1}{40\choose m} \\
&- {50 \choose m}^{-1}{5\choose 2}{30\choose m} \\
&+ {50 \choose m}^{-1}{5\choose 3}{20\choose m} \\
&- \dots
\end{aligned}
$$

Using python to evaluate $P(A) = 1 - P(\neg{A})$ we get

```python
import sympy as sp
C = sp.binomial
def PA(m):
  return 1 - (1 / C(50, m)) * (
    + C(5, 1) * C(40, m)
    - C(5, 2) * C(30, m)
    + C(5, 3) * C(20, m)
    - C(5, 4) * C(10, m)
  )
```

Computing a few values we find `PA(m=15) = 0.91` is the first value of $m$ with $P(A) > 0.9$.

## 3.3

Let $X$ denote our background information about the urn, we started knowing nothing about $k$ meaning our prior is

$$
p(k = j|X) = \frac{1}{50}\quad (1 \le j \le 50)
$$

After the data $D$ of finding $S_1,S_2,S_3$ red, green and blue respectively ($S$ stands for sample) we use Bayes rule to get (for $3 \le j \le 33$)

$$
\begin{aligned}
p(k = j|DX)
&= p(k=j|X) \frac{p(D|(k=j)X)}{p(D|X)} \\
&= \frac{1}{50} \cdot \frac{p(D|(k=j)X)}{\sum_i \frac{1}{50} p(D|(k=i)X)} \\
&= \frac{p(D|(k=j)X)}{\sum_i p(D|(k=i)X)}
\end{aligned}
$$

To compute $p(D|(k=j)X)$ first remind yourself of what it's saying, "the probability of picking $3$ distinct colors in a sample of $20$ from an urn with $50$ balls and $j$ distinct colors".

TODO: Finish

## 3.4

TODO

## 3.5

TODO

## 3.6

TODO
