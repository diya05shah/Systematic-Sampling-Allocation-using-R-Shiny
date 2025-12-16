# Interactive Stratified Sampling Designer – R Shiny Application

## Overview
This repository contains an interactive R Shiny application developed to design and
analyze stratified random sampling schemes. The application determines the required
total sample size and allocates samples across strata under different allocation
strategies based on user-defined precision requirements.

The project emphasizes practical implementation of stratified sampling theory by
allowing users to explore how margin of error, confidence level, cost, and time
constraints influence sample size and allocation decisions.

---

## Objectives
- To determine the minimum total sample size required for a desired level of precision
- To allocate samples across strata using multiple stratified allocation methods
- To compare classical and optimal allocation strategies interactively
- To study the impact of cost and time constraints on sampling design
- To visualize stratum-wise allocation differences across methods

---

## Stratified Sampling Concept
Stratified sampling is a probability sampling technique in which the population is
divided into mutually exclusive and collectively exhaustive groups known as strata.
A separate sample is selected from each stratum, and results are combined to obtain
overall population estimates.

This method improves efficiency and precision when strata are internally homogeneous
and differ from one another with respect to the characteristic of interest.

---

## Precision and Sampling Error
In this project, sampling error refers to the allowable deviation between the sample
estimate and the true population parameter.

The user specifies:
- An acceptable margin of error
- A confidence level

Based on these inputs, the application determines the smallest total sample size that
achieves the required precision while maintaining statistical reliability.

---

## Allocation Methods Implemented

### 1. Proportional Allocation
Samples are distributed across strata in proportion to their population sizes.
Larger strata receive more samples, while smaller strata receive fewer.

This method is simple to apply and is effective when variability across strata is
approximately equal.

---

### 2. Neyman Allocation
This method allocates samples based on both the size and variability of each stratum.
Strata exhibiting higher variability are assigned more observations.

Neyman allocation improves overall precision compared to proportional allocation,
especially when stratum variances differ substantially.

---

### 3. Optimum Allocation (Cost-Based)
In many surveys, the cost of collecting data varies across strata. This allocation
method accounts for such differences by allocating fewer samples to expensive strata
and more samples to cost-efficient strata.

The objective is to achieve the desired precision at the lowest possible total cost.

---

### 4. Optimum Allocation (Time-Based)
This method considers the time required to collect observations from each stratum.
Strata that are quicker to survey and exhibit higher variability receive more samples.

This approach is particularly useful when survey timelines are constrained.

---

## Finite Population Consideration
Since sampling is conducted without replacement from a finite population, the design
accounts for finite population effects to ensure realistic assessment of sampling
uncertainty and avoid overestimation of variability.

---

## Application Features
- Interactive control of margin of error and confidence level
- Automatic determination of minimum total sample size
- Comparison of four stratified allocation strategies
- Stratum-wise allocation visualization using bar plots
- Detailed allocation tables for each method
- Validation of achieved precision for each allocation

---

## Implementation Details
- The application is built using the R Shiny framework
- Strata characteristics are defined within the server logic (demo data)
- Sample sizes are adjusted to ensure consistency across strata
- Allocation results are recalculated dynamically based on user input

---

## Files Included
- `app.R` – R Shiny application implementing stratified sampling design and allocation

---

## Author
**Diya Shah**  
BSc Data Science & Statistics  
CHRIST (Deemed to be University)

---

## Academic Note
This project was developed as part of academic coursework in sampling theory and
statistical survey design. It demonstrates the translation of theoretical stratified
sampling concepts into an interactive decision-support application using R.
