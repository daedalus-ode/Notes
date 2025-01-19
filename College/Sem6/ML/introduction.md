# Introduction
## Definition
- Computer Program said to learn from experience (E) with respect to some task (T) and some performance (P) if its performance on T improves with experience (E)

## Types
### Based on Model
- Supervised
- Unsupervised
- Reinforcement
  - Parts of the model
    - Action
    - Agent
    - Reward
    - Environment
- Deep

### Based on Output
#### Regression
- Infinite set of real number outputs
- Example:- Finding apartment prices based on it's size, locality, etc
##### Linear Regression
- Polynomial of order 1
- $y = h(x) \rightarrow c + mx$
- Try to find the best fit line wrt to loss function

##### Logistic Regression

#### Classification
- Finite number of groups as output
- Example:- Classifying tumor into malignant and non malignant based on it's size

## Loss Function
### Functions
#### Regression

> [!NOTE]
> To find the minimum L, L should be a convex function of `c` and `m`

##### Mean Squared Error (MSE) / Quadratic Loss / L2 Loss
  - $L = \frac{1}{N}  \sum{{(y_i - X_i)}^2}$
##### Mean Absolute Error (MAE) / L1 Loss
  - $L = \frac{1}{N} \sum{|y_i - X_i|}$
##### Huber Loss / Smooth Mean Absolute Error
##### Log-Cosh Loss
##### Quantile Loss


#### Classification
##### Cross Entropy
- $Cross Entropy = -\sum_{i=1}^{N}{p_i\ log\ q_i}$

###### Confusion Matrix
- Fields:
  - False positive
  - False negative
  - True positive
  - True negative
<!-- TODO: Embed pictures and examples-->

##### Hinge Loss

### Generalization
- Training error indicates how well a model is fit to the training dataset
- Testing error indicates how the trained model responds to data that's not a part of the training dataset (Generalization)
- We try to find the sweet spot between these two errors
<!-- TODO: Embed pictures and examples-->

#### Underfit
- When the order of the ML model is too low, it can't reduce the error after a certain level
- Solution:- Increase the order of the regression model

#### Overfit
- When the order of the ML model is too high, it fits too well to the training dataset
- This results in increased testing error but reduced training error. Meaning it can't handle new data well
- Solution:- Decrease the order of the regression model

## Steps
- Training (60% of total dataset) - 
- Validation (20% of total dataset) - 
- Testing (20% of total dataset) - 
