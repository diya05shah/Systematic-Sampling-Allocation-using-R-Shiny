# Stratified Sampling Allocation – R Implementation

## Overview
This repository contains an R-based implementation of stratified sampling for
estimating the population mean. The project focuses on determining the minimum
required sample size and allocating samples across strata using multiple
allocation strategies.

The implementation incorporates finite population correction to ensure
realistic variance estimation when sampling from large but finite populations.

---

## Objectives
- To determine the minimum sample size required for a specified level of precision  
- To allocate samples efficiently across population strata  
- To compare classical and optimal stratified sampling methods  
- To examine the impact of cost and time considerations on sampling design  

---

## Stratified Sampling Concept
Stratified sampling is a probability sampling technique in which the population
is divided into relatively homogeneous subgroups known as strata. Independent
samples are drawn from each stratum, and the overall estimate is obtained by
combining information from all strata.

This method improves estimation accuracy when variability within strata is lower
than variability across the entire population.

---

## Precision and Sampling Bias
In this project, sampling bias refers to the allowable margin of error in estimating
the population mean.

The total sample size is determined such that the variability of the stratified
sample mean remains within the user-defined margin of error at a specified
confidence level. This ensures reliable estimates while avoiding unnecessary
oversampling.

---

## Allocation Methods Used

### 1. Proportional Allocation
Samples are allocated to each stratum in proportion to the stratum’s population size.
Larger strata receive more samples, while smaller strata receive fewer.

This method is simple to implement and is suitable when variability across strata
is relatively uniform.

---

### 2. Neyman Allocation
Sample allocation is based on both stratum size and stratum variability. Strata
with higher variability receive a larger share of the total sample.

Compared to proportional allocation, this method typically achieves higher
precision when stratum variances differ substantially.

---

### 3. Optimum Allocation (Cost-Based)
This allocation strategy accounts for differences in sampling cost across strata.
Sample sizes are distributed by considering population size, variability, and
per-unit cost.

Strata that are more variable and less expensive to sample receive more
observations, with the objective of achieving the desired precision at minimum
total cost.

---

### 4. Optimum Allocation (Time-Based)
This method is analogous to cost-based allocation but replaces monetary cost with
the time required to collect observations from each stratum.

Strata that require less time and exhibit higher variability are allocated more
samples, making this approach suitable for surveys with strict time constraints.

---

## Finite Population Correction
Since sampling is conducted without replacement from a finite population, finite
population correction is applied to adjust variance estimates. This prevents
overestimation of uncertainty and improves the accuracy of precision assessment.

---

## Implementation Details
- The program automatically determines the required total sample size  
- Stratum-wise sample sizes are rounded and adjusted to ensure consistency  
- Precision constraints are verified before finalizing the sampling design  

---

## Files Included
- `app.R` – R Shiny application implementing stratified sampling allocation methods  

---

## Author
**Diya Shah**  
BSc Data Science & Statistics  
CHRIST (Deemed to be University)

---

## Academic Note
This project was developed as part of academic coursework on stratified sampling
techniques and demonstrates the practical implementation of theoretical concepts
using R programming.
