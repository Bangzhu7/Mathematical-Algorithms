# Gaussian Noise Denoising in MATLAB

## 🎯 Learning Outcomes

Upon successful completion of this assignment, you will be able to:

- Model common noise types in MATLAB (Gaussian).
- Measure image quality using Mean-Square Error (MSE), Peak Signal-to-Noise Ratio (PSNR), and Structural Similarity Index (SSIM).
- Compare the effectiveness of traditional filters (Mean, Median, Wiener) and AI-based filters (DnCNN) for noise reduction.

---

## 🧩 1. Setup: Add Gaussian Noise

A grayscale image (`cameraman.tif`) was loaded and Gaussian noise was added using:

```matlab
noisyImage = imnoise(originalImage, 'gaussian', 0, noiseSigma^2);
```

🧮 2. Traditional Filter (Wiener Filter)

The Wiener filter was applied as a traditional denoising method:

traditionalFiltered = wiener2(noisyImage, [5 5], noiseSigma^2);

It adapts smoothing based on local variance, effectively reducing noise while preserving edges.
This corresponds to the third subplot in the figure.

🤖 3. AI Filter (DnCNN)

A pre-trained deep learning model, DnCNN, was used for advanced denoising:

net = denoisingNetwork('DnCNN');
aiFiltered = denoiseImage(noisyImage, net);

DnCNN learns complex noise patterns and removes Gaussian noise more effectively while retaining fine details.
This corresponds to the fourth subplot.

📏 4. Quantitative Evaluation

To objectively compare results, PSNR and SSIM metrics were calculated:

psnrValue = psnr(filteredImage, originalImage);
ssimValue = ssim(filteredImage, originalImage);

Higher PSNR and SSIM values indicate better denoising performance.
Example output:

--- Image Quality Metrics Comparison ---
Method | PSNR (dB) | SSIM

---

Noisy Image | 25.12 | 0.7556
Traditional (Wiener) | 28.91 | 0.8350
AI (DnCNN) | 32.55 | 0.9128

👁️ 5. Visual Observation

The Wiener filter reduces noise effectively but causes slight blurring.

The DnCNN AI filter achieves higher PSNR/SSIM values and preserves textures and details better.

Visually, the DnCNN output appears more natural and closer to the original image.

🧠 Conclusion

This experiment demonstrates that:

Gaussian noise can be easily simulated and analyzed in MATLAB.

Traditional filters like Wiener perform reasonably well for Gaussian noise.

AI-based models such as DnCNN outperform traditional filters in both quantitative and visual quality.
