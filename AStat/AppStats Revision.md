# __Goodness of fit tests__
## __Introduction__
* __Type of data__
  * Nominal: labels, qualitative
  * Ordinal: the categories are ordered
  * Interval: requirements of ordinal, measured in equal units
  * Ratio: interval, zero is naturally defined, unit is still arbitrary, can be subjected to + - $\times$ $\div$
* __Multinomial distribution__
  * $k$: # of outcomes
  
    $O_i$: # of obs. in outcome $i$, $i=1,2,...,k$
    
    $p_i$: the probability that any given trial results in outcome $i$
    $$O_1 + O_2 + ... + O_k =n$$
    $$(O_1, ..., O_k) \sim MN(n; p_1,...,p_k)$$ 
  * Properties:
    $$\mathbb E (O_i) = np_i$$
    $$E_1 + ... + E_k = n, \text{where } E_i = \mathbb E (O_i), \text{the expected frequencies}$$
  * Binomial distribution is a special case with $k=2$
    $$Y \sim Bin(n,p) \Leftrightarrow (Y, n-Y) \sim MN(n; p, 1-p)$$


## __$\chi^2$ goodness of fit test (Pearson test)__
* Hypothesis
  $$H_0: (O_1, ..., O_k) \sim MN(n; p_1,...,p_k)$$
  $$H_1: (O_1, ..., O_k) \nsim MN(n; p_1,...,p_k)$$
  * The probabilities $p_1,...,p_k$ can be $p_1(\boldsymbol{\theta}),...,p_k(\boldsymbol{\theta})$, where $\boldsymbol \theta$ is a vector of parameters.
  $$E_i=\begin{cases}
  np_i & \text{if } p_1,...,p_k \text{ are specified fully}\\
  np_i(\boldsymbol{\hat\theta}) & \text{if } \boldsymbol{\theta} \text{ has to be estimated}
  \end{cases}$$
* Test statistic
  $$X^2= \sum_{i=1}^k \frac{(O_i-E_i)^2}{E_i}$$
  * If the parameters are known: $X^2 \dot \sim \chi^2_{k-1}$ under $H_0$
  
    If $q$ independent parameters $\boldsymbol{\theta} = (\theta_1,...,\theta_q)$ have to be estimated: $X^2 \dot \sim \chi^2_{k-q-1}$ under $H_0$
  * They are reasonalbe if $E_i \geq 5$ for $i=1,...,k$
  * $1$-tailed test, $H_0$ is rejected for 'large' values of $X^2$



## __Contigency table__

$$\begin{array}{|c|c|c|}  & y_1 \ \ y_2 \ \ \dots \ \ y_c & \text{row total} \\
\hline
x_1 & O_{11} \ O_{12} \dots \ O_{1c} & R_1 \\
x_2 & O_{21} \ O_{22} \dots \ O_{2c} & R_2 \\
\dots & \dots & \dots \\
x_r & O_{r1} \ O_{r2} \dots \ O_{rc}  & R_r \\
\hline
\text{column total} & C_1 \ \  C_2 \dots \ \ C_c  & n \\
\end{array}$$


* Hypothesis
  * Test of __independence__ (fixed total)
 
  $H_0: X \text{ and } Y \text{are independent} \Leftrightarrow p_{ij}= p_{i\cdot}p_{\cdot j}$
  
  $H_1: X \text{ and } Y \text{are dependent} \Leftrightarrow p_{ij} \neq p_{i\cdot}p_{\cdot j}$
  * Test of __homogeneity__ (fixed marginal) 
  
  $H_0: p_{i|j}= p_{i|k}= p_{i \cdot} \text{ for all } j,k=1,...,c \text{ and } i=1,...,r$
  
  $H_1: p_{i|j} \neq p_{i|k} \text{ for all } j,k=1,...,c \text{ and } i=1,...,r$
* Test statistic
  $$X^2= \sum_{i=1}^r \sum_{j=1}^c \frac{(O_{ij}-E_{ij})^2}{E_{ij}} $$
  $$\begin{array}{|c|c|c|}  & y_1 \ \ y_2 \ \ \dots \ \ y_c & \text{row total} \\
    \hline
    x_1 & C_1R_1/n \ \  C_2R_1/n \ \dots \ C_cR_1/n & R_1 \\
    x_2 & C_1R_2/n \ \  C_2R_2/n \ \dots \ C_cR_2/n & R_2\\
    \dots & \dots & \dots \\
    x_r & C_1R_r/n \ \  C_2R_r/n \ \dots \ C_cR_r/n & R_r \\
    \hline
    \text{column total} & C_1 \ \  C_2 \dots \ \ C_c  & n \\
    \end{array}$$
    * $X^2 \dot \sim \chi^2_{k-q+1} = \chi^2_{(r-1)(c-1)}$ under $H_0$
      
      $k$: # of outcomes or categories $=r \times c$.
  
      $q$: # of independent parameters to estimate $=(r-1)+(c-1)=r+c-2$
* Yates' continuity correction (for 2 $\times$ 2 table)
  $$X^2= \sum_{i=1}^r \sum_{j=1}^c \frac{(|O_{ij}-E_{ij}|-\mathbf{1/2})^2}{E_{ij}} $$

## __The Kolmogorov-Smirnov test__
### __The Kolmogorov-Smirnov one-sample test__
* Assumption
  * the obs ${x_1,x_2,...,x_n}$ form an independent random sample from some distribution
  * data should be at least ordinal, should not be nominal
  * the underlying distribution is continuous
* Hypothesis
  
  $H_0$: the set of obs $\{x_1,x_2,...,x_n\}$ forms a random sample from a distribution with continuous distribution function $F_0(x)$. 
* Definition
  
  If $x_{(1)}, x_{(2)},...,x_{(n)}$ denote the order statistics of a random sample of size $n$, the __empirical distribution function (edf)__ $S_n(x)$ of the sample is
  $$P(X \leq x)=S_n(x)=\begin{cases}
  0 & x < x_{(1)} \\
  k/n & x_{(k)} \leq x \leq x_{(k+1)}, k=1,2,...,n-1 \\
  1 & x \geq x_{(n)}
  \end{cases}$$
* Test statistic (reject $H_0$ when $D$ is large)
  
  $D = \max_x |S_n(x)-F_0(x)|$
  
  $D = \max_i \left\{ |S_n(x_{(i)})-F_0(x_{(i)})|, |S_n(x_{(i-1)})-F_0(x_{(i)})| \right\}$
* Comparison
   ||$\chi^2$ goodness of fit test|KS test|
   |---|---|---|
   |Sensitivity|kind of summarise, only care how much you have in each group |treat each obs individually, hence more sensitive, does not waste information|
   |Applicability| continuous, categorical (nominal & ordinal) data | continuous, 不适合用于discrete, cannot be used for nominal data|
   |Sample size __(The rule of thumb: cell expectations $E_i \geq 5$)__|$n \geq 10$|can be used even for $n=1$ (but low power)|
   |Distribution under $H_0(x)$|has only approximately a $\chi^2$ distribution|the exact distribution of the $D$ statistics is known|


### __The Kolmogorov-Smirnov two-sample test__
* Hypothesis
  
  $H_0: F_X(t)=F_Y(t)$ for all $t$ (i.e. $x$ and $y$ obs are from the same distribution)
  
  $H_1: (A): F_X(t) \leq F_Y(t) \text{ for all } t$
  
  $\qquad(B): F_X(t) \geq F_Y(t) \text{ for all } t$
  
  $\qquad(C): F_X(t) \neq F_Y(t) \text{ for all } t$
* Test statistic (reject $H_0$ when the test statistics is large)
  
  $(A): D^+= \max_i [S_{n_1}^X(t)-S_{n_2}^Y(t)]$
  
  $(B): D^-= \max_i [S_{n_2}^Y(t)-S_{n_1}^X(t)]$
 
  $(C): D= \max_i |S_{n_1}^X(t)-S_{n_2}^Y(t)| = \max[D^+,D^-]$

### __Q-Q plots__




# __Permutation tests (nonparametric)__

  Why we need to consider nonparametric test?

  * Continuous measurements which clearly do not follow the Normal distribution.
  * Outliers are present.
  * \# of obs is too small to assess Normality.
  * obs are not continuous measurements.
  * If parametric tests do not exist.

## __Two-sample permutation test__

### __1. Using the sample means of obs.__
* Hypothesis
  
  $H_0$: the two distributions from which the samples were drawn are the same $\Leftrightarrow \mu_X = \mu_Y$

  $H_1: \mu_X \neq \mu_Y$ (two-tailed) 
  
  $\qquad \mu_X > \mu_Y$ (one-tailed) (extreme cases: $D \geq d$)
  
  $\qquad \mu_X > \mu_Y$ (one-tailed) (extreme cases: $D \leq d$)
* Test statistics
  $$d=\bar y -\bar x$$ 
  * Estimate $\mu_X$ and $\mu_Y$ by $\bar x$ and $\bar y$, then $d \approx 0$ under $H_0$ and $d$ is not $\approx 0$ under $H_1$.

  * p-value = # of extreme cases / # of permutation (two-sided: x2)

### __2. Mann-Whitney U-test / WSRT (Using the ranks of obs.)__
* Hypothesis

  If we assume the distributions differ in location only,
  
  $H_0:M_X= M_Y$

  $H_1:M_X \neq M_Y$ or $M_X \geq M_Y$ or $M_X \leq M_Y$
* Test statistics
  $$U_X=\sum_{i=1}^{n_1}v_i \in [0, n_1n_2] \quad (n_1 < n_2)$$

  * Suppose we have $x_1,...,x_{n_1}$ and $y_1,...,y_{n_2}$, we pool the two samples together and list the obs in increasing order. Replace each obs by an $x$ or a $y$, according to which sample it came from. For each $x_i$, evaluate $v_i$ # of obs which are smaller than $x_i$.
  
  * $U_X$ gives # of times a $y$ obs precedes an $x$ obs.
  * $\mathbb E(U_X)=\frac{n_1n_2}{2}, Var(U_X)= \frac{n_1n_2(n_1+n_2+1)}{12}$
  * For large $n_1$ and $n_2$, normal approximation, $\frac{U_x - \mathbb E(U_X)}{\sqrt{Var(U_X)}} \dot \sim N(0,1)$
* Power
  
  Mann-Whitney < two sample t-test & two sample permutation test bases on the sample means
  
  It loses power by throwing away the actual values of obs, but the power loss is modest. The advanatge is outliers do not affect statistical inferences disproportionately.


## __Permutation test for matched pairs__
Suppose we have $n$ pairs of data, $(x_1,y_1), (x_2,y_2),...,(x_n,y_n)$. obs within a pair are not independent. $d_i = y_i-x_i$.

* Assumption
  * $d_i$'s are independent
  * The distribution of $d_i$'s is symmetric about $\mu_d$ or $M_d$ under $H_0$

### __1. Using the sample means of obs.__
* Hypothesis
  
  $H_0:\mu_X = \mu_Y \Leftrightarrow \mu_d=0$
  
  $H_1:\mu_X \neq \mu_Y \Leftrightarrow \mu_d \neq 0$
* Test statistics
  $$\bar d= \frac{1}{n} \sum_{i=1}^{n}d_i$$

### __2. WSRT (Using the ranks of obs.)__
* Hypothesis
  
  $H_0: M_X = M_Y \Leftrightarrow M_d=0$
  
  $H_1: M_X \neq M_Y \Leftrightarrow M_d \neq 0$
* Test statistics
  $$T^+: \text{sum of + ranks} \in [0, \frac{n(n+1)}{2}]$$

  $$T^-: \text{sum of - ranks} \in [0, \frac{n(n+1)}{2}]$$
  
  * Find $d_i \Rightarrow$ rank them $1,...,n \Rightarrow$ assign $\pm$ to ranks
  * $T^+=\sum_{i=1}^n(\delta_i \times i)$ and 
    $\delta_i = \begin{cases}
      1 & + & p(\delta_i=1)=0.5\\ 
      0 & - & p(\delta_i=0)=0.5
    \end{cases}$
    
    $\mathbb E(\delta_i)=0.5$, $\mathbb E(\delta_i)=0.5$, $Var(\delta_i)=0.25$
    
    Hence under $H_0$,

    $\mathbb E(T^+)=\sum_{i=1}^ni \mathbb E(\delta_i)=0.5 \times \frac{n(n+1)}{2}=\frac{n(n+1)}{4}$

    $Var(T^+)=\sum_{i=1}^ni^2Var(\delta_i)=0.25 \times \frac{n(n+1)(2n+1)}{6}=\frac{n(n+1)(2n+1)}{24}$
  * $\displaystyle \frac{T^+ - n(n+1)/4}{\sqrt{n(n+1)(2n+1)/24}}\sim N(0,1)$
    
  * Continuity correction: reduce the magnitude of the numerator by $0.5$ 

* Power

  Use less information compared to using the actual observed values to calculate the sample mean, less powerful when interval or ratio data are available without any outliers.

### __3. Sign test (Using the sign of the diff.)__
* Hypothesis
  
  $H_0: M_d=0$

  $H_1: M_d \neq 0$
* Test statistics
  
  If $X$ and $Y$ distributions are the same, we expect the differences $d_i$ to be centred around $0$. We discard any $d_i=0$, suppose that leaves $r$ pairs $d_1,...,d_r$
  
  $$S^+ =\text{the number of differences that are positive}$$

  under $H_0$, $S^+ \sim Bin(r,0.5)$

* Power
  
  permutation $\bar d$ < WSRT < sign test

  Sign test has the advantage of not assuming symmetry, but it wastes information and is less powerful when interval or ratio data are available.
## __One-sample permutation test__

* Hypothesis
  
  If we assume the distributions differ in location only,
  
  $H_0: \mu = \mu_0$

  $H_1: \mu \neq \mu_0$
* Test statistics
  
  $d_i=y_i-x_i \Rightarrow d_i=y_i-\mu_0$

  $$\bar x$$
  
  under $H_0$, the farther from zero is $\bar x$, the more extreme is the permutation

  Extreme cases: $\geq \bar x$ (one-tailed)
   $\quad \geq \bar x$ and $\leq \bar x$ (two-tailed)

* Advantages & disadvantages of permuation test
   * Ad: The method is exact. No specific distribution is assumed for the data. The analytic distribution of the test statistic is not required.
   * Dis: Each permutation of the data must be equally likely. The method is generally not applicable to complex examples.




# __Randomisation tests (nonparametric)__
## __Multiple-sample randomisation test (one-sided)__
* Hypothesis
  
  $H_0:$ all distributions are the same

  $H_1:$ at least one distribution is different
* Test statistics (reject $H_0$ for large $t$)
  $$t=\sum_i n_i(\bar x_i - \bar x)^2$$
  $n_i:$ # of obs in group $i$
## __Matched-pairs randomisation test__
* Hypothesis
  
  $H_0: \mu_d = 0$

  $H_1: \mu_d \neq 0$
* Test statistics
  
  $$\bar d$$
  randomisation is performed by choosing one obs from each pair $(d_i, -d_i)$ with equal probability of $0.5$


# __More nonparametric tests__
## __The runs test__
Assess the randomness of a sample. The data need only be nominal (binary).
* Hypothesis
  
  $H_0:$ the order of a set of obs is consistent with the obs forming a ransom sample.
* Definition: a run is a maximal subsequence of like obs.
* Test statistics (reject $H_0$ for a low or high number of $Q$)
  $$Q= \text{total number of runs}$$
  * We need to determine the dictribution of $Q$ under $H_0$
  * For small samples: could be calculated exactly
  * For large samples: normal approximation
    $$Q \dot \sim N \left( 1+\frac{2n_1n_2}{n_1+n_2}, \frac{2n_1n_2(2n_1n_2-n_1-n_2)}{(n_1+n_2)^2(n_1+n_2-1)} \right)$$



## __Comparison of several samples__
Compare the mean of more than two samples
* Hypothesis
  
  $H_0:$ means are the same.
### __1. ANOVA (parametric: assuming normal distribution)__
 We have $k$ samples of sizes $n_1,...,n_k$. The $p$th sample being $X_{p1},...,X_{pn_k}$. The samples being from normal distributions with the same (unknown) variance $\sigma ^2$ but possible different means.
* Test statistics (if $\sigma^2$ was known)
  $$S=\frac{\sum_{p=1}^k n_p(\bar X_p - \bar X)^2}{\sigma^2} \dot \sim \chi^2_{k-1}$$

  $\bar X_p:$ the mean of the $p$th sample
  
  $\bar X:$ the overall mean

### __2. Kruskal-Wallis test (nonparametric)__
We replace the obs in the $k$ samples $X_{pj}$ by their ranks $R_{pj}$ in the combined sample of size $N$.
* Test statistics (reject $H_0$ if $H$ is large)
  $$H=\begin{cases}
  (N-1)S/N \\
  \frac{12}{N(N+1)}\sum_{p=1}^k \frac{R_p ^2}{n_p}-3(N+1) & \dot \sim \chi^2_{k-1} \\
  \frac{12}{N^3-N-\sum(t^3-t)} \{ \sum_{p=1}^k \frac{R_p^2}{n_p}-\frac{N(N+1)^2}{4} \} & \dot \sim \chi^2_{k-1}
  \end{cases}$$







## __Rank correlation__

* Hypothesis
  
  $H_0: X$ and $Y$ are independent $\Leftrightarrow r=0$

  $H_1: r\neq 0$

### __1. Pearson correlation (parametric)__
* $\displaystyle r=\frac{\sum_{i=1}^N (X_i-\bar X)(Y_i-\bar Y)}{\{ \sum (X_i-\bar X)^2 \sum (Y_i-\bar Y)^2\} ^{1/2} } = \frac{S_{XY}}{\sqrt{S_{XX}S_{YY}}}$
### __2. Spearman's rank correlation (nonparametric)__
* $Q_i$ & $R_i$: rank of $\{X_1,...,X_N\}$ and $\{Y_1,...Y_N\}$

* $r_s=\begin{cases} 
  \frac{\sum_{i=1}^N (Q_i-\bar Q)(R_i-\bar R)}{\{ \sum (Q_i-\bar Q)^2 \sum (R_i-\bar R)^2\} ^{1/2} }
  \\
  \frac{12}{N(N^2-1)} \left( \sum_{i=1}^N Q_iR_i-\frac{N(N+1)^2}{4}\right)
  \\
   1- \frac{6S}{N(N^2-1)}, \text{where } S=\sum_{i=1}^N(Q_i-R_i)^2
  \end{cases}$ $\in [-1,1]$

* $r_s \dot \sim N(0, \frac{1}{N-1})$ under $H_0$
  
### __3. Kendall's K (parametric)__
* $K=\sum_{i=1}^{N-1} m_i \in (0, \frac{N(N-1)}{2})$, $m_i$: # of $j > i$ s.t. $Y_j > Y_i$
  
* $r_K = \frac{4K}{N(N-1)} -1 \in (-1,1)$

* $r_K \dot \sim N(0, \frac{2(2N+5)}{9N(N-1)})$ under $H_0$