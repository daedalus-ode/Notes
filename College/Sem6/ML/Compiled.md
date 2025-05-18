# Foundation of ML
## Points to keep in note before training
- No free lunch theorem - no one size fits all
- Use training + validation dataset for actual training of the model after deciding method or hyperparameters through validation
- Do cross validation with 2/3rd of the dataset (training + validation split) to generate multiple training and test pairs
- Keep track of criterias beyond error in real life model
  - Risks of generalising errors
  - Training time and space complexity
  - Testing time and space complexity
  - Interpretability
  - Easy programmability

## Experimentation Strategies
Fiddling with controllable factors or inputs of a model to get the best response from it
- Best Guess: Trial and Error
- One Factor at a time:
  - Tweak 1 factor at a time and keep rest at baseline
  - Assumes factors don't interact with each other
  - Complexity: $O(L.F)$, where
    - `L` -> Number of Levels
    - `F` -> Number of Factors
- Factorial Design:
  - Factors are varied together
  - Grid Search
  - Complexity: $O(L^F)$
    - `L` -> Number of Levels
    - `F` -> Number of Factors

## Response Surface Design
- Do a small number of run around the same baseline and extract the data
- Use the above data to fit a quadratic function `r = g(.)`
- Maximise `g(.)` and use the corresponding factors as next configuration setting
- Add the response data, `r` to the sample and refit the quadratic
- Repeat until convergence

## Basic Principles of Experimental Design
- Randomisation
  - Order of the runs should be randomized to reduce bias
- Replication
  - Running the experiment of the same configuration settings to average out effect of uncontrollable factors
- Blocking
  - Use the same training data or configurations to isolate the factor we're interested in.
  - For example: Using the identical subset from a larger dataset for training when compering the accuracy between multple algorithms

## Guidelines for Machine Learning Experiments
- Aim of the Study
  - Define the particular aim for the experiment. Example: Comparison of 2 or more algorithms on 2 or more datasets based on error
- Selection of Response Variable
  - Decide on quality measure
- Choice of Factors and Levels
  - Levels of factor must chosen to avoid missing a good configuration and doing unnecessary experimentation
- Choice of Experimental Design
  - Decisions like replication number, experimentation strategies, etc
- Performing the Experiment
  - Do trial runs with some random settings
  - Save intermediate results
  - Unbiased experimentation
- Statistical Analysis
  - Checking if the response of the sample supports the initial hypothesis
- Conclusions and Recommendations
  - Invesigative (Initial) runs are only run with 25% of the available resources

## Cross Validation and Resampling Methods
### K Fold Cross Validation
- Randomly divide a large dataset into k parts
- Leave `1` part for validation and the rest `k - 1` parts for training
- Iteratively reapeat `k` times until every part is left out atleast once
- Problems with this:
  - To ensure big training set, we allow small validation set
  - Any 2 training sets overlap by `(k - 2)` parts

> [!NOTE]
> #### Stratification
> Maintaining the class proportions between all the sample subsets drawn out from the larger dataset to ensure right proportions

> [!NOTE]
> - Leave one out is an extreme case of k fold cross validation where, `k = N` (number of fold is equal to number of instances) and only 1 instance is used for validation at each iteration
> - It is used in medical diagnosis
> - Stratification is not possible with this

### 5x2 Cross Validation
- Equal training and validation set size
- Randomly divide dataset into 2 parts $X_1^{(1)}$ and $X_1^{(2)}$
- Use:
  - $X_1^{(1)}$ as training set
  - $X_1^{(2)}$ as validation set
- Switch between them, this makes the 1st fold
- Repeat by shuffling without replacement for 5 folds in total

### Bootstrapping
- Best way to sample for very small dataset despie increase overlap compared to cross validation
- Pick N samples of N instances from a dataset of size N instances *with replacement*
- Original set is used for validation
- Probability of not picking a sample: $(1 - \frac{1}{N})^N = e^{-1} = 0.368$
  - This means the system is only trained on `63%` of the original instances and rest are not used
  - We can use replication and repeat the process to deal with this

## Classifier Performance
### Confusion Matrix

| True Class\ Predicted Class | Positive | Negative | Total |
| --------------------------- | -------- | -------- | ----- |
| Positive                    | TP       | FN       | `p`   |
| Negative                    | FP       | TN       | `n`   |
| Total                       | `p'`     | `n'`     | `N`   |


### Error
$$\frac{FP + FN}{N},\ where\ N = TN + TP + FP + FN$$

### Accuracy
$$1 - Error$$

### TP Rate
$$\frac{TP}{TP + FN} = \frac{TP}{p}$$

### FP Rate
$$\frac{FP}{FP + TN} = \frac{FP}{n}$$

### Precision
$$\frac{TP}{TP + FP} = \frac{TP}{p'}$$

### Recall
$$\frac{TP}{TP + FN} = \frac{TP}{p}$$

### Sensitivity
$$Recall\ =\ Sensitivity\ =\ TP-Rate$$

### Specificity
$$1 -\ fp-rate$$

### F1 Score
$$2 \times \frac{Precision\ *\ Recall}{Precision\ +\ Recall}$$

## Interval Estimation #doubt
- $$z = \frac{\sqrt{N}(m - \mu)}{\sigma}$$
- $$P\{-a < z < a\} = 0.95$$
- $\alpha$ -> `Level of Significance`

## Hypothesis Testing
- Errors:
  - Type 1: When we reject the hypothesis when it is correct
  - Type 2: When we fail to reject the hypothesis when it is wrong
- $\beta(\mu)$ is the probability that a hypothesis is not rejected
- $1 - \beta(\mu)$ is power function, probability of rejection

# Supervised Learning - Parametric Methods
## Classification
### Vapnik Chervovenkis Dimension
The maximum number of points (instances) that can be `shattered` by H (hypothesis) is denoted by `VC(H)` and measures the capacity of H

### Probably Approximate Correct Learning
<!-- TODO: Revisit -->

### Noise
- Recording error
- Teacher's noise (mislabelling)
- Additional attributes

## Regression
- $$g(x) = W_1\ x_1\ +\ W_2\ x_2\ +...+\ W_d\ x_d\ +\ W_0$$
- $$E(g|x) = \frac{1}{N}\sum {[r^t - g(x^t)]}^2$$
- $$W_1 = \frac{\sum{x^t r^t} - N\ \overline{r}\ \overline{x}}{\sum{(x^t)}^2 - N\ \overline{x}^{\ 2}}$$
- $$W_0 = \overline{r} - W_1\ \overline{x}$$
- $$E_{RSE} = \frac{\sum{[r^t - g(x^t | \theta)]}}{\sum{(r^t - \overline{r})}^{\ 2}}$$
- $$R^2 = 1- E_{RSE}$$
## Triple Trade Off
- Complexity of hypothesis
- Amount of training data
- Generalisation error

## Decisions for Making a model
- Model we use
- Loss Function
- Optmization Technique

## Bayes Theorem
$$P(A_1|B) = \frac{P(A_1)\ P(B|A_1)}{P(A_1)\ P(B|A_1) + P(A_2)\ P(B|A_2)}$$

## Parametric Classification
- Discriminant function: $$g_i(x) = P(x|C_i)\ P(C_i) \rightarrow\ log{P(x|C_i)}\ +\ log{P(C_i)}$$
- $$P(x|C_i) = \frac{1}{\sqrt{2\pi}\sigma_i}exp[-\frac{(x - \mu_i)^2}{2\sigma_i^2}]$$

## Model Selection Procedure
- Cross Validation
- Regularization
- AIC (Akaike's Information Criterion) & BIC (Bayesian Information Criterion)
- Structural Risk Management
- Minimum Description Length
- Bayesian Model Selection
# Clustering
## K means Clustering
- $$E(\{m_i\}_i^k | x) = \sum_t \sum_i b_i^t ||x^t - m_i||^2$$
- $$b_i^t = 1, if ||x^t - m_i|| = min_j ||x^t - m_j||$$
- $$m_i = \frac{\sum_t b_i^t x^t}{\sum_t b_i}$$

## Expectation Maximization Algorithm
- 
