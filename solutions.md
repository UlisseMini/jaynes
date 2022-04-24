---
title: "Jaynes solutions"
author: "Ulisse Mini"
description: 'Exercise solutions for "Probability Theory: The Logic of Science" by E.T. Jaynes.'
---

\newcommand{\imp}{\Rightarrow}
\renewcommand{\neg}[1]{\overline{#1}}

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
