# Nonparametric Regression Models

## Introduction

* Mean squared error (__MSE__): $\displaystyle \text{MSE}(\hat{f}_n(x_0)) = \mathbb{E}\left[|\hat{f}_n(x_0) - f(x_0)|^2\right] = v(x_0) + [b(x_0)]^2$

* Mean integrated squared error (__MISE__): $\displaystyle \text{MISE}(\hat{f}_n) = \mathbb{E}\left[||\hat{f}_n - f||^2\right] = \mathbb{E}\left[\int_0^1 |\hat{f}_n - f(x)|^2 dx\right] = \int_0^1 \left( v(x) + [b(x)]^2 \right)dx$

* Consistency: $\text{M(I)SE}(\hat{f}_n) \rightarrow 0 \quad (n \rightarrow \infty)$

## Kernel estimators

* __Kernel__ $K(x)$: $\int_{-\infty}^\infty K(x)dx = 1$
    * $\displaystyle K_h(x) = \frac{1}{h} K(\frac{1}{h})$, $h$ is called __bandwidth__

* __Nadaraya-Watson Estimator__: $\displaystyle \hat{f}_n^{NW} (x) = \frac{\sum_{i=1}^n Y_i K_h(X_i-x)}{\sum_{i=1}^n K_h(X_i-x)} \mathbf{1}\left( \sum_{i=1}^n K_h (X_i - x) \neq 0 \right)$

* $\displaystyle \mu_2(K) = \int_{-\infty}^\infty x^2 K(x) dx$, $\displaystyle ||K||_2 = \sqrt{\int_{-\infty}^\infty [K(x)]^2 dx}$

* Asymptotic properties: 
    * $\displaystyle \frac{1}{n} \sum_{i=1}^n g(x_i) \approx \int_0^1 g(z)dz$ for regular deterministic design
    * $\displaystyle b(x) \approx \frac{\mu_2(K) h^2}{2} f''(x)$, $\displaystyle v(x) \approx \frac{\sigma^2}{nh} ||K||_2^2$
    * __Canonical bandwidth__: $\displaystyle \delta_0 = \left( \frac{||K||_2^2}{[\mu_2(K)]^2} \right)^{1/5}$
    * __Optimal bandwidth__: $\displaystyle h_{opt} = \left( \frac{\sigma^2 ||K||_2^2}{n ||f''(x)||_2^2 \mu_2(K)^2} \right)^{1/5} = \left( \frac{\sigma^2}{n ||f''(x)||_2^2} \right)^{1/5} \delta_0$
    * __Optimal kernal__: $\displaystyle K_{opt}(x) = \frac{3}{4} \frac{1}{\sqrt{5}} \left( 1-\frac{x^2}{5} \right) \mathbf{1}(|x| \leq \sqrt{5})$
    * Asymptotic CI: $\hat{f}(x) \pm z_{\alpha/2} \sqrt{v(x)}$

* Non-asymptotic properties: 
    * $\displaystyle \frac{1}{n} \sum_{i=1}^n K_h(X_i-x) \geq \lambda_0$, $K(x) = 0$ for $x \notin [-1,1]$, $0 \leq K(u) \leq K_{max}$, $h \leq 1/(2n)$
    * $\displaystyle |b(x)| \leq Mh^\beta = b_0(x)$, $\displaystyle v(x) \leq \frac{\sigma^2 K_{max}}{nh\lambda_0} = v_0(x)$
    * Conservative CI: $\hat{f}(x) \pm \left( b_0(x) + z_{\alpha/2} \sqrt{v_0(x)} \right)$

* Asymptotic confidence band: $\displaystyle \left\{ f: |f(x)-\hat{f}(x)| \leq c_\alpha \sqrt{v(x)}, \quad \forall x \in [a,b] \right\}$
    * $\displaystyle c_\alpha \approx \sqrt{2 \log \frac{a_0}{\alpha h}}$, $\displaystyle a_0 = \frac{|b-a|}{\pi} \frac{||K'||_2}{||K||_2}$
    * to find the narrowest interval

## Smothing Splines

* $\displaystyle \hat{f}_{n,\lambda}^{SS} = \sum_{j=1}^N \hat\beta_j h_j(x)$
    * $\hat\beta = (H^TH+\lambda\Omega)^{-1}H^TY$
    * $\displaystyle H = \begin{pmatrix} h_1(x_1) & h_2(x_1) & \cdots & h_N(x_1) \\ h_1(x_2) & h_2(x_2) & \cdots & h_N(x_2) \\ \vdots & \vdots & & \vdots \\ h_1(x_n) & h_2(x_n) & \cdots & h_N(x_n) \end{pmatrix}$
    * $\displaystyle \Omega = \int h_j''(x) h_l''(x) dx$
    * Basis for the set of natural cubic splines: $h_1(x) = 1$, $h_2(x) = x$, $\displaystyle h_j(x) = (x-t_{j-2})^3_+ - \frac{(t_N-t_{j-2})}{(t_N-t_{N-1})} (x-t_{N-1})^3_+ + \frac{(t_{N-1}-t_{j-2})}{(t_N-t_{N-1})} (x-t_N)^3_+$

* Generalised additive models (for data on regular grid)
    1. $\hat\alpha = \bar{Y}$
    1. fit for dimension $x_1$ to data $(x_{1i},\bar{y}_i-\hat\alpha)$, using $\lambda = \lambda_0 / m$
    1. $\hat\beta_1 = (H^TH+\lambda\Omega)^{-1}H^TY$, where $Y=(\bar{y}_1, \cdots, \bar{y}_i, \cdots)^T$
    1. (ignore) $\hat{f}_1 = H\hat\beta_1$
    1. fit for dimension $x_2$ and calculate $\hat\beta_2$
    1. $\displaystyle \hat{f} = \hat\alpha + \sum_{i=1}^m \beta_{1i}h_i(x_1) + \sum_{i=1}^m \beta_{2i}h_i(x_2)$

## Wavelet Estimators

* Wavelet basis:
    * Scaling function (father wavelet) $\phi(x)$, $\displaystyle \int_0^1 \phi(x) dx=1$
    * Wavelet function (mother wavelet) $\psi(x)$, $\displaystyle \int_0^1 \psi(x) dx=0$
    * $\phi_{jk}(x) = 2^{j/2} \phi(2^jx-k)$, $\psi_{jk}(x) = 2^{j/2} \psi(2^jx-k)$
    * $\displaystyle \phi(x) = \sqrt{2} \sum_{k\in\mathbb{Z}} h_k \phi(2x-k)$, $\displaystyle \psi(x) = \sqrt{2} \sum_{k\in\mathbb{Z}} g_k \psi(2x-k)$

* Haar wavelet basis: $\phi(x) = \mathbf{1}_{(0,1]}(x)$, $\psi(x) = \mathbf{1}_{(0,1/2]}(x) - \mathbf{1}_{(1/2,1]}(x)$

* Cascade algorithm
    1. $n=2^J$
    1. Set $c_{Jk}=Y_{k+1}$ for $k=0,1,\ldots 2^J-1$, set $j=J-1$
    1. $c_{j0} = h_0 c_{j+1,0} + h_1 c_{j+1,1}$, $c_{j1} = h_0 c_{j+1,2} + h_1 c_{j+1,3}$, $d_{j0} = h_0 c_{j+1,0} + h_1 c_{j+1,1}$
    1. $j=j-1$ or stop
    1. $\hat{w}_{jk}=d_{jk}$, $\hat{u}_{00}=c_{00}$
    1. $\displaystyle \hat\theta_0 = \frac{\hat{u}_{00}}{\sqrt{n}}$, $\displaystyle \hat\theta_{jk} = \frac{\hat{w}_{jk}}{\sqrt{n}}$
    1. Wavelet projection estimator: $\displaystyle \hat{f}_{J_0}(x) = \hat\theta_0 \phi(x) + \sum_{j=0}^{J_0-1} \sum_{k=0}^{2^j-1} \hat\theta_{jk} \psi_{jk}(x)$

* $\displaystyle \hat\sigma = 1.4826 \text{MAD}(d_{J-1,0}, \ldots, d_{J-1,2^J-1})$

* Thresholding estimators: 
    * Hard thresholding: $\hat{w}_{jk} = d_{jk} \mathbf{I}(|d_{jk}|>\lambda)$
    * Soft thresholding: $\displaystyle \hat{w}_{jk} = \begin{cases} d_{jk}-\lambda, & d_{jk}>\lambda \\ 0, & -\lambda \leq d_{jk} \leq \lambda \\ d_{jk}+\lambda, & d_{jk}<-\lambda \end{cases}$
    * Universal threshold: $\displaystyle \lambda = \sigma \sqrt{2 \log n}$

* Asymptotic distribution: $\displaystyle \hat{f}_{J_0}(x) \sim N\left( f(x), \frac{2^{J_0} \sigma^2}{n} \right)$

* Hypothesis testing of $H_0: f(x) = Const$ on $(a,b)$: 
    * For $(a,b) = (m2^{-l},(m+1)2^{-l})$, find $(j,k)$ s.t. $\displaystyle a < \frac{k+1/2}{2^j} < b$
    * For arbitrary $(a,b)$, find $(j,k)$ s.t. $\displaystyle \{ a<\frac{k}{2^j}<b \text{ or } a<\frac{k+1/2}{2^j}<b \text{ or } a<\frac{k+1}{2^j}<b\}$
    1. Equivalently, to test $H_0: w_{jk} = \ldots = 0$
    1. $T = (d_{jk}^2 + \ldots)/\sigma^2 \sim \chi_\#^2$