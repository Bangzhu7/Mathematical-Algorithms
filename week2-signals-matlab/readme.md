# Continuous-Time Signals in MATLAB

This project generates and plots six common continuous-time signals using MATLAB:

1. **Unit Impulse** (δ(t)) – An approximation with a single spike at _t = 0_
2. **Unit Step** (u(t)) – Step from 0 to 1 at _t = 0_
3. **Unit Ramp** (r(t)) – Linearly increasing signal for _t ≥ 0_
4. **Exponential Signal** (e<sup>at</sup>) – Exponential growth/decay depending on _a_
5. **Signum Signal** (sgn(t)) – -1 for negative time, 0 at _t = 0_, 1 for positive time
6. **Sinc Signal** (sinc(t)) – Defined as sin(πt)/(πt)

---

## 📊 Sample Plots

Below are example outputs (you can generate and save these plots in MATLAB using the code provided):

### Unit Impulse

![Unit Impulse](images/impulse.png)

### Unit Step

![Unit Step](images/step.png)

### Unit Ramp

![Unit Ramp](images/ramp.png)

### Exponential Signal

![Exponential](images/exponential.png)

### Signum Signal

![Signum](images/signum.png)

### Sinc Signal

![Sinc](images/sinc.png)

_(Save your MATLAB figures as `.png` files inside an `images/` folder to display them here.)_

---

## ▶️ How to Run

1. Open **MATLAB**.
2. Copy the script `signals.m` into your working directory.
3. Run the script:
   ```matlab
   signals
   ```
