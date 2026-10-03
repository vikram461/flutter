import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_math_fork/flutter_math.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
final String mathematicsContent = r'''
# Mathematics

![Circle](https://petapixel.com/assets/uploads/2024/01/High-resolution-image-of-sun.jpg)

**Mathematics** already existed in nature as patterns and symmetry. Humans developed mathematics according to their needs, such as farming, husbandry, calendars, trade, construction, science, etc.

**Count** : The first mathematical idea. Later developed into comparison and then into measurement.

---

## Concrete Counting

**Concrete Counting** used one-to-one correspondence between one **object** and one **count**.

- Body parts were used for counting. This is why most civilizations used **Base 10 Systems** (10 figures).
- **Lebombo Bone** with 29 marks (LB29) — possibly used to measure lunar/menstrual cycles [35,000–44,000 BCE].
- **Ishango Bone** with tally marks — used for counting (Abstract Counting) [20,000 BCE].

---

## Abstract Counting

**Abstract Counting** used numbers as an independent concept.

- **Sumerians** had a better **Base 60 (Sexagesimal) Positional System**. (Cuneiform Tablet) [4500–1900 BCE]
- **Egyptians** had better symbol representation (Hieroglyphs), fractions, and geometry. (Rhind Papyrus Manuscript) [3000–500 BCE]
- **Babylonians** inherited Sumerian mathematics and developed advanced arithmetic, tables, notions of algebra, and astronomy [1900–500 BCE].

**Defined**: One, Two, Three

**Combination**: One-One, One-Two, Two-Two

**Undefined**: Heard, Swarm, Forest

**Pronoun**: Singular, Plural

Repeated addition is **Multiplication** and equal parts is **Division**.

Humans had vocabulary for numbers long before written mathematics.

The language of science is mathematics. Its grammar is represented by several kinds of numbers and the ways we use them.

---

# NUMBER SYSTEM

**NUMBER SYSTEM:** Study of the representation and classification of numbers.

### Digits

**Digits** are specific symbols used to denote unique numbers.

- Hindu-Arabic: \(0,1,2,3,4,5,6,7,8,9\)
- Roman: \(I,V,X,L,C,D,M\)

### Numeral

**Numeral** is a combination of digits that represents values larger than the highest digit.

Examples:

\[
235
\]

\[
CCXXXV
\]

### Number

**Number** describes quantity (**Cardinal**) or position (**Ordinal**).

- Cardinal: \(1,2,3,\ldots,n\)
- Ordinal: \(1^{st},2^{nd},3^{rd},\ldots,n^{th}\)

---

# Number Sets

## Natural Numbers \(N\)

**Natural (N):** Numbers used in counting.

\[
N = \{1,2,3,\ldots,n,n+1,\ldots\}
\]

The largest natural number is not defined.

---

## Whole Numbers \(W\)

**Whole (W):** Natural numbers starting with zero.

\[
W = \{0,1,2,3,\ldots\}
\]

---

## Even Numbers

**Even:** Numbers that are divisible by 2.

\[
\text{Even numbers} = \{2m \mid m \in I\}
\]

Examples:

\[
\{\ldots,-4,-2,0,2,4,\ldots\}
\]

---

## Odd Numbers

**Odd:** Numbers that are not divisible by 2.

\[
\text{Odd numbers} = \{2m-1 \mid m \in I\}
\]

> Though \(m \in N\) is sometimes used, the definition can be expressed for all integers.

---

# Prime Numbers

**Prime (P):** A number greater than 1 that is divisible only by 1 and itself.

A number \(n>1\) is prime if it is not divisible by any prime number less than or equal to its square root.

\[
p \leq \sqrt{n}
\]

- \(2\) is the only even prime number.
- There are **25 prime numbers up to 100**.

\ {2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97\}

---

# Coprime Numbers

**Coprime (Relative Primes):** Two numbers whose GCF is 1.

\[
\gcd(x,y)=1
\]

If \(N\) is divisible by coprime numbers \(x\) and \(y\), then \(N\) is divisible by \(xy\).

\[
x\mid N,\quad y\mid N,\quad \gcd(x,y)=1
\]

therefore,

\[
xy\mid N
\]

---

# Twin Prime

**Twin Prime:** A pair of prime numbers that differ by 2.

Examples:

\[
(3,5),\quad(5,7),\quad(11,13),\quad(17,19)
\]

---

# Composite Numbers

**Composite:** A number greater than 1 that is **not prime**.

\[
n>1 \quad \text{and} \quad n\notin P
\]

- \(1\) is neither prime nor composite.

---

# Integers

**Integer (I):** Whole numbers that can be positive, negative, or zero.

\[
I = \{\ldots,-3,-2,-1,0,1,2,3,\ldots\}
\]

- \(0\) is neither positive nor negative.

---

# Rational Numbers

**Rational (Q):** A number that can be represented in the form \(p/q\), where:

\[
\gcd(p,q)=1
\]

\[
p,q\in I
\]

\[
q\neq0
\]

Therefore,

\[
Q=\left\{\frac{p}{q}\mid p,q\in I,\ q\neq0\right\}
\]

- Decimal expansion is **terminating** or **non-terminating repeating**.
- The number-set relationship is:

\[
N\subset W\subset I\subset Q
\]

- \(0\) is rational because:

\[
0=\frac{0}{1}
\]

---

# Irrational Numbers

**Irrational (\(R\setminus Q\)):** Real numbers that cannot be represented in the form \(p/q\), where \(p,q\in I\) and \(q\neq0\).

- Decimal expansion is **non-terminating and non-repeating**.
- \(e\) and \(\pi\) are irrational.
- \(\frac{22}{7}\approx\pi\), but \(\frac{22}{7}\) is rational.

For example:

\[
a+\sqrt{b}=x+\sqrt{y}
\]

where

\[
a,x\in Q
\]

and

\[
b,y\notin Q
\]

Some useful relationships are:

\[
Q\times(R\setminus Q)=R\setminus Q
\]

\[
\frac{0}{R\setminus Q}=Q
\]

because \(0\) is rational.

The product of two irrational numbers can be rational or irrational:

\[
(R\setminus Q)\times(R\setminus Q)
\subseteq Q\cup(R\setminus Q)
\]

---

# Real Numbers

**Real (R):** Numbers that can be represented on the number line.

\[
R=N\cup W\cup I\cup Q\cup(R\setminus Q)
\]

More precisely:

\[
R=Q\cup(R\setminus Q)
\]

---

# General Properties of Real Numbers

For real numbers \(x\) and \(y\), one of the following is true:

\[
x>y
\]

\[
y>x
\]

\[
x=y
\]

For multiplication by a positive number \(a\):

\[
x>y\Rightarrow ax>ay,\qquad a>0
\]

For multiplication by a negative number \(a\):

\[
x>y\Rightarrow ax<ay,\qquad a<0
\]

For non-zero real numbers:

\[
xy=0\Rightarrow x=0\ \text{or}\ y=0
\]

---

# Operative Properties of Real Numbers

Let:

\[
a,b,c\in R
\]

### Closure

\[
a+b\in R
\]

\[
a\times b\in R
\]

### Commutative Property

\[
a\times b=b\times a
\]

### Associative Property

\[
a\times(b\times c)=(a\times b)\times c
\]

### Distributive Property

\[
a\times(b+c)=a\times b+a\times c
\]

### Identity Elements

Multiplicative identity:

\[
a\times1=a
\]

Additive identity:

\[
a+0=a
\]

Therefore:

\[
I_m=1,\qquad I_a=0
\]

### Inverse Elements

Multiplicative inverse:

\[
a\times a' = 1
\]

where

\[
a'=\frac{1}{a},\qquad a\neq0
\]

Additive inverse:

\[
a+a'=0
\]

where

\[
a'=-a
\]

Also:

\[
a-b\in R
\]

---

# Absolute Value Properties of Real Numbers

The absolute value of \(x\) is defined as:

\[
|x|=
\begin{cases}
x, & x>0\\
0, & x=0\\
-x, & x<0
\end{cases}
\]

For example:

\[
|x-2|=
\begin{cases}
x-2, & x>2\\
0, & x=2\\
2-x, & x<2
\end{cases}
\]

Square-root property:

\[
\sqrt{x^2}=|x|
\]

---

# Factors & Multiples

The notation

\[
a\mid b
\]

means **a divides b**, i.e. the remainder is \(0\).

If:

\[
b=ax+r
\]

then \(a\) is a **factor** of \(b\) when:

\[
r=0
\]

and \(b\) is a **multiple** of \(a\).

### Transitivity Law

\[
a\mid b,\quad b\mid c\Rightarrow a\mid c
\]

### Reflexivity Law

\[
a\mid a,\qquad \forall a\in I
\]

### Division Algorithm

\[
\text{Dividend}
=
\text{Divisor}\times\text{Quotient}
+
\text{Remainder}
\]

or

\[
b=ax+r
\]

where:

\[
0\leq r<a
\]

---

# Identity Element

An **identity element** \(I\) is a special value that **does not change another value when an operation is performed**.

For addition:

\[
a+0=a
\]

Therefore, \(0\) is the **additive identity**.

For multiplication:

\[
a\times1=a
\]

Therefore, \(1\) is the **multiplicative identity**.

---

# Closure of a Set

A set is **closed** under an operation if the result of that operation belongs to the same set to which the operands belong.

For example, real numbers are closed under addition:

\[
a,b\in R\Rightarrow a+b\in R
\]

and multiplication:

\[
a,b\in R\Rightarrow ab\in R
\]

---

# Mathematical Symbols

\[
\forall
\]

means **"for all"** or **"for every"**.

\[
\in
\]

means **"belongs to"** or **"is an element of"**.

\[
\notin
\]

means **"does not belong to"**.

\[
\setminus
\]

means **"excluding"** or **"set difference"**.

---

# NUMBER THEORY

**NUMBER THEORY:** Study of the properties and relationships of numbers.

---

# Reference

1. *Mathematics From the Birth of Numbers* — Jan Gullberg
2. *Arihant CDS*
''';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Math Question'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: QuestionRenderer(
            question: mathematicsContent,
          ),
        ),
      ),
    );
  }
}

class QuestionRenderer extends StatelessWidget {
  final String question;

  const QuestionRenderer({
    super.key,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    final parts = _parseQuestion(question);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: parts.map((part) {
          if (part.isMath) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Center(
                child: Math.tex(
                  part.content,
                  mathStyle: MathStyle.display,
                  textStyle: const TextStyle(
                    fontSize: 16,
                  ),
                  onErrorFallback: (error) {
                    return Text(
                      'Invalid formula: ${part.content}',
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    );
                  },
                ),
              ),
            );
          }

          return MarkdownBody(
            data: part.content,
            selectable: true,
            styleSheet: MarkdownStyleSheet(
              p: const TextStyle(
                fontSize: 18,
                height: 1.5,
              ),
              listBullet: const TextStyle(
                fontSize: 18,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  List<_QuestionPart> _parseQuestion(String text) {
    final parts = <_QuestionPart>[];

    final regex = RegExp(
      r'\\\[(.*?)\\\]',
      dotAll: true, 
    );

    int lastIndex = 0;

    for (final match in regex.allMatches(text)) {
      // Normal Markdown before formula
      if (match.start > lastIndex) {
        parts.add(
          _QuestionPart(
            content: text.substring(lastIndex, match.start),
            isMath: false,
          ),
        );
      }

      // LaTeX formula
      parts.add(
        _QuestionPart(
          content: match.group(1)!.trim(),
          isMath: true,
        ),
      );

      lastIndex = match.end;
    }

    // Remaining Markdown
    if (lastIndex < text.length) {
      parts.add(
        _QuestionPart(
          content: text.substring(lastIndex),
          isMath: false,
        ),
      );
    }

    return parts;
  }
}

class _QuestionPart {
  final String content;
  final bool isMath;

  _QuestionPart({
    required this.content,
    required this.isMath,
  });
}