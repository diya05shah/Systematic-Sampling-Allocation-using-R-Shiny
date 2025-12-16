# Systematic Sampling Design Dashboard

## Project Overview
This repository hosts an R Shiny application developed for the **"Reference - Sampling 2"** assignment. The tool is designed to automate the decision-making process for a **Systematic Random Sampling** survey.

The dashboard serves as a planning tool for researchers to determine the optimal scope of a survey required to estimate a population mean, balancing the need for statistical accuracy with real-world limitations on budget and time.

## Objective
The primary goal of this project is to simulate the design of an experiment where:
1.  A target precision (acceptable bias) is set.
2.  The required sample size is derived from that target.
3.  The logistical plan (cost, duration, and sampling intervals) is automatically generated.

## Theoretical Framework

### 1. Determining Sample Size
The core logic of the application rests on the relationship between **variability**, **precision**, and **sample size**:
* **Variability:** If the population is highly diverse (high standard deviation), a larger sample is needed to capture an accurate mean.
* **Precision (Bias):** The "Bias" input represents the acceptable margin of error. There is an inverse relationship here: to achieve a smaller margin of error (higher precision), the sample size must increase significantly.
* **Confidence:** The design assumes a standard statistical confidence level (e.g., 95%) to ensure the results are reliable.

### 2. Systematic Sampling Logic
Unlike simple random sampling, this application implements a **Systematic approach**:
* **The Frame:** The process begins with an ordered list of the total population.
* **The Interval:** Instead of selecting random individuals purely by chance, the system calculates a fixed "step size" or **interval**. This interval is determined by dividing the total population by the required sample size.
* **Selection Process:** The algorithm selects a random starting point within the first interval, and then selects every subsequent item based on the fixed step size. This ensures the sample is spread evenly across the entire population frame.

### 3. Resource Constraints
A key feature of this assignment is the integration of **Cost and Time** into the sampling design:
* **Linear Scaling:** The application assumes that cost and time scale linearly with sample size.
* **Feasibility Check:** By inputting the "Cost per Unit" and "Time per Unit," the user can immediately see if a desired level of precision is financially feasible or if it fits within the project timeline.

## Visualizing the Trade-off
The dashboard includes a **Sensitivity Analysis Plot**. This graph visualizes the "Law of Diminishing Returns" in sampling:
* The curve shows how increasing the sample size reduces the sampling bias.
* It demonstrates that after a certain point, adding more samples costs significantly more money/time but yields only a tiny improvement in accuracy. This helps the user choose the most efficient design.

## How to Use
1.  **Input Parameters:** Enter the known population details, estimated variability, and your constraints (budget/time).
2.  **Analyze Outputs:** Review the calculated sample size and the specific "Step Interval" needed for the systematic selection.
3.  **Check Feasibility:** Use the calculated Total Cost and Total Time to verify if the survey plan is realistic.

## Author Diya Shah
