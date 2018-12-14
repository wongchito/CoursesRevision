# Theory of Statistical Inference

* __Exponential family__: $f(y|\theta) = \exp\{ a(y)b(\theta) + c(\theta) + d(y) \}$

    If $a(y)=y$, $b(\theta)$ is called the __natural parameter__

    If $\theta$ is a $p$-dimensional parameter, $\displaystyle f(y|\theta) = \exp \left\{ \sum_{j=1}^p A_j(y) B_j(\theta) + C(\theta) + D(y) \right\}$
  * $\displaystyle \mathbb{E}(a(y)) = -\frac{c'(\theta)}{b'(\theta)}$, $\displaystyle \text{Var}(a(y)) = \frac{b'c''-b''c'}{(b')^3}$

* A statistic $s(\boldsymbol y)$ s.t. $\displaystyle \frac{L(\theta;\boldsymbol y)}{L(\theta;\boldsymbol z)}$ does not depend on $\theta$ is __minimal sufficient__.

* If the distribution belongs to exponential family, $S_j = \sum_{i=1}^n A_j(y_j)$ are __sufficient statistics__ and are called the __natural statistics__.

* __Score__ function: $U=l'(\theta)$, $\mathbb{E}(U)=0$

* Fisher's information: $I_\theta = \text{Var}(U)=E(U^2)=-E(U')$

* __Bias__ function: $\text{bias}(\hat\theta) = \mathbb{E}(\hat\theta) - \theta$
  * unbiased: $\mathbb{E}(\hat\theta)=\theta$
  * asymptotically unbiased: $\mathbb{E}(\hat\theta) \rightarrow \theta$ as $n \rightarrow \infty$
  * weakly consistent: $\text{Var}(\hat\theta) \rightarrow 0$ and $\text{bias}(\hat\theta) \rightarrow 0$ as $n \rightarrow \infty$

* __Mean square error__ (MSE): $\text{MSE}(\hat\theta) = \mathbb{E}[(\hat\theta - \theta)^2] = \text{Var}(\hat\theta) + [\text{bias}(\hat\theta)]^2$

* __Cramér-Rao lower bound__: $\displaystyle \text{Var}(\hat\theta) \geq \frac{\left( 1+\frac{\partial b}{\partial\theta} \right)^2}{I_\theta}$, where $b(\theta)=\text{bias}(\hat\theta)$
  * attained by unbiased estimator $\hat\theta = g(x)$ s.t. $\displaystyle \frac{\partial l}{\partial\theta} = I_\theta (g(x)-\theta)$
  * efficiency: $\displaystyle \frac{\min \text{Var}}{\text{Var}(\hat\theta)}$

* __Rao-Blackwell theorem__: If $S$ is a sufficient statistic for $\theta$ and $\hat\theta$ is the unbiased estimator. $\hat\theta_S = \mathbb{E}(\hat\theta|S)$. 
  * $\hat\theta_S$ is a function of $S$ only
  * $\mathbb{E}(\hat\theta_S) = \theta$, $\text{Var}(\hat\theta_S) \leq \text{Var}(\hat\theta)$

* MLE asymptotically statisfies $\hat\theta \sim N_p(\theta, I_\theta^{-1})$

* Change of variable: $\displaystyle f(y) = f(x) \left| \frac{dx}{dy} \right|$

* Moment generating function: $M_X(t) = \mathbb{E}(\exp(tX))$
  * linearity: $M_{aX+bY}(t) = M_X(at) \cdot M_Y(bt)$

* Lilelihood ratio critical region $\displaystyle \left\{ \boldsymbol y: \frac{L(\theta;H_1)}{L(\theta;H_0)} \geq k_\alpha \right\}$ is the best CR (__most powerful__) for testing simple hypothesis $H_0$ vs $H_1$.

* __Power__ of the test: $\mathbb{P}(\boldsymbol Y \in R_\alpha | H_1)$

* There exists a unique __UMPU test__ for distribution in the exponential family.
  * $\displaystyle \phi'(\boldsymbol y) \begin{cases} 1 \quad \text{if } s(\boldsymbol y) > s_2 \text{ or } s(\boldsymbol y) < s_1 \\ \gamma_j \quad \text{if } s(\boldsymbol y)=s_j \\ 0 \quad \text{if } x_1 < s(\boldsymbol y) < s_2 \end{cases}$, where $s(\boldsymbol y) = \sum_j a(y_j)$, $j=1,2$
  * To test $H_0: \theta \in [\theta_1,\theta_2]$ vs $H_1$, $\mathbb{E}_{\theta_j}(\phi(\boldsymbol Y)) = \mathbb{E}_{\theta_j}(\phi'(\boldsymbol Y)) = \alpha$
  * To test $H_0: \theta = \theta_0$ vs $H_1$, $\mathbb{E}_{\theta_j}(\phi'(\boldsymbol Y)) = \alpha$ and $\displaystyle \frac{d}{d\theta} \mathbb{E}_{\theta_j}(\phi'(\boldsymbol Y)) |_{\theta=\theta_0} = 0$

1. alskdj
   - sdfd