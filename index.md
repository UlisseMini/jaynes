---
title: "Jaynes"
description: 'Study guide and resources for "Probability Theory: The Logic of Science" by E.T. Jaynes.'
---

\newcommand{\imp}{\Rightarrow}
\renewcommand{\neg}[1]{\overline{#1}}

## Introduction

I recommend reading my summary of each chapter **before reading the chapter**, occasionally Jaynes explains things terribly, and you want to know about that ahead of time.

You should also check out the [Lectures by Aubrey Clayton](https://www.youtube.com/playlist?list=PL9v9IXDsJkktefQzX39wC2YG07vw7DsQ_) which follow Jaynes, they're great, I recommend you watch them all (at 3x speed with occasional rewinding).

## Plausible reasoning

Learning objectives

- Logic and Probability are about _logical causation_ not _physical causation_
- Notation and basic properties of Boolean algebra
- Adequate sets of operations for Boolean algebra
  - All logical functions can be represented as a combination of basic operations
  - Reduction to disjunctive normal form
- Basic desiderata for plausibility

### Boolean algebra

Most of the Boolean algebra identities are inherited from algebra in the case where true and false are $1$ and $0$ respectively.
The only novel identities are about _duality_, converting and's into or's and vise versa

- $\neg{AB} = \neg{A} + \neg{B}$
- $\neg{A+B} = \neg{A}\;\neg{B}$

Keep in mind $\neg{AB} \ne \neg{A}\;\neg{B}$, logical negation is not like complex conjugation.

Jaynes mentions the following theorem (1.13) without explanation

- If $\neg{B} = AD$ then $A\neg{B} = \neg{B}$ and $B\neg{A} = \neg{A}$.

This won't be used until a proof in Chapter 2 which I recommend you skip, hence you may also skip this theorem, unless you want to practice Boolean algebra.

If you want an intuition for (1.13) consider how the statement $A \imp B$ is logically equivalent to saying $A = AB$ meaning we can rewrite (1.13) as

- If $\neg{B} = AD$ then $\neg{B} \imp A$ and $\neg{A} \imp B$

Recall that $P \imp Q$ is false _if and only if_ $P$ is true and $Q$ is false. We can check this for (1.13) by considering the two cases for $\neg{B}$'s truth value.

<!-- TODO: maybe I should spell it out more? I'll be here all day though... -->

### Adequate sets of operations

<!-- TODO: Fill out, maybe python program to disjunctive normal form would be cool -->

### The basic desiderata

Jaynes uses the strange notation $A|B$ to denote the plausibility of $A$ given $B$

## The quantitative rules

Learning objectives

- Cox's theorem (aka: the derivation of probability from our basic desiderata)

I **strongly** recommend you skim most of the proof as it's very hard to follow and understanding all the details isn't worth much.
Aubrey Clayton [agrees](https://youtu.be/xAbU0lHSxcg?list=PL9v9IXDsJkktefQzX39wC2YG07vw7DsQ_) and explains why Jaynes goes to this much trouble.

I also have a [lesswrong post](https://www.lesswrong.com/posts/dnn9WhpRecqeRKYhd/don-t-be-afraid-of-the-thousand-year-old-vampire) with my take on why Cox's theorem is philosophically interesting.
