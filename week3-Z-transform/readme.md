# Week 3 – Z-Transform Assignment

This repository contains MATLAB code and solutions for Z-Transform exercises on finite/infinite sequences, properties, inverse transforms, and frequency response.

---

## A1 – Finite Sequences → Polynomials

- X₁(z) = 1 + 2 z⁻¹ + 5 z⁻²
- X₂(z) = 3 z⁻¹ + 4 z⁻³
- Verified using MATLAB symbolic tools.
- Finite sequences always yield polynomials in z⁻¹.
- **ROC**: entire z-plane except possibly z=0 or ∞.

---

## A2 – Infinite Sequences & ROC

- (a) x[n] = (0.6)ⁿ u[n] → X(z) = 1 / (1 − 0.6 z⁻¹), **ROC: |z| > 0.6**
- (b) x[n] = (−0.8)ⁿ u[n] → X(z) = 1 / (1 + 0.8 z⁻¹), **ROC: |z| > 0.8**
- (c) x[n] = −(0.9)ⁿ u[−n−1] → X(z) = −z⁻¹ / (1 − 0.9 z⁻¹), **ROC: |z| < 0.9**

**Explanation:**  
The ROC is determined by the region in the z-plane where the power series converges. For right-sided sequences, convergence requires |z| greater than the pole magnitude. For left-sided sequences, |z| is less than the pole magnitude.

---

## A3 – Properties (Linearity & Shifting)

- Linear combination:  
  Z{2x₁[n] − 3x₂[n]} = 2/(1 − 0.5 z⁻¹) − 3/(1 + 0.5 z⁻¹)
- Time-shift:  
  Z{x₁[n−3]} = z⁻³ / (1 − 0.5 z⁻¹)

---

## A4 – Inverse Z-Transform

- (a) X(z) = 1 / (1 − 0.7 z⁻¹) → x[n] = (0.7)ⁿ u[n]
- (b) X(z) = (1 − 0.5 z⁻¹) / (1 − 0.8 z⁻¹)  
  → Can be decomposed into partial fractions. MATLAB gives:  
  x[n] = (0.8)ⁿ u[n] − 0.5 (0.8)ⁿ⁻¹ u[n−1]

---

## A5 – H(z), Poles/Zeros & Frequency Response

- **Poles:** z = 0.8 (double pole)
- **Zeros:** z = 1.2 (double zero)
- **Magnitude Response:** Attenuates high frequencies, passes low frequencies.
- **Filter Type:** **Low-pass** filter. This is indicated by the fact that poles are inside the unit circle close to z=1 and zeros outside at z=1.2.
- **Batch Plots:** Saved using MATLAB (`zplane`, `freqz`).

---

## Reflections

- Finite sequences are straightforward because the Z-transform is just a polynomial; the ROC is almost always the entire plane.
- For infinite sequences, the ROC is key — it encodes causality and stability.
- Time-shift and linearity are very powerful to compute transforms without recomputing integrals.
- Pole-zero diagrams immediately show filter type: zeros push response down, poles enhance.

---

## Running

Run:

```matlab
main
```
