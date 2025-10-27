📘 Lab 1: Image as a 2D Signal

Topic: Sampling, Quantization, Histograms, and Enhancement
Course: Image Processing / Computer Vision
Student: Phoebe

🔹 0) Load and Inspect the Image

Code Summary:

The script loads peppers.png (or cameraman.tif if unavailable).

Converts it to grayscale.

Prints basic info: class, value range, and image size.

Notes:

Most images are 8-bit, meaning pixel values range from 0–255.

Grayscale conversion uses luminance: Y = 0.2989R + 0.5870G + 0.1140B.

🔹 1) Quantization and Dynamic Range

Goal:
To see how bit depth affects image quality.

Process:

8-bit = 256 gray levels

~6-bit = 64 gray levels

~4-bit = 16 gray levels
(using step sizes of 1, 4, and 16 respectively)

Observation:

Reducing bit depth causes banding (posterization).

Smooth gradients become flat areas with sudden jumps.

Finer details disappear at low bit depths.

Conclusion:
Lower bit-depth reduces tonal resolution, making the image appear less smooth.

🔹 2) Histogram and Contrast Stretching

Goal:
To analyze the effect of linear intensity remapping on contrast.

Code Used:

I_norm = mat2gray(I);
I_stretch = imadjust(I, [0.2 0.8], [0 1]);

Observation:

The stretched image histogram expands to cover the full 0–255 range.

Dark and bright regions become more visible.

Overall image contrast improves significantly.

Conclusion:
Contrast stretching linearly increases the dynamic range, enhancing visual clarity.

🔹 3) Gamma Correction (Nonlinear Adjustment)

Goal:
To apply nonlinear brightness scaling using gamma values.

Code Used:

I_gamma_low = imadjust(I,[],[],0.6); % brightens
I_gamma_high = imadjust(I,[],[],1.6); % darkens

Observation:

γ < 1 brightens dark regions (good for dim images).

γ > 1 darkens bright regions (good for glare reduction).

The effect is nonlinear — midtones are affected more than extremes.

Conclusion:
Gamma correction is useful for display calibration and perceptual adjustment.

🔹 4) Sampling and Aliasing

Goal:
To demonstrate aliasing by aggressive downsampling and upsampling.

Code Used:

scale = 0.1;
I_small = imresize(I, scale, 'nearest');
I_back = imresize(I_small, size(I), 'nearest');

Observation:

Fine textures turn into blocky patterns.

Edge details are distorted.

The upsampled image looks pixelated.

Explanation:
When the image is sampled below the Nyquist rate, high-frequency information is lost or misinterpreted — this is aliasing.

Conclusion:
Downsampling should be preceded by low-pass filtering to avoid aliasing artifacts.

🔹 5) Reflections & Summary
Concept Observation Key Takeaway
Bit Depth Fewer gray levels → visible banding Quantization reduces tonal smoothness
Contrast Stretching Expands histogram range Enhances overall visibility
Gamma Correction Nonlinear brightness change Useful for display tuning
Sampling Downsampling causes aliasing Respect Nyquist limit to preserve detail
🧩 Final Remarks

This lab demonstrated the fundamental relationships between:

Bit depth → quantization artifacts

Dynamic range → perceived contrast

Gamma correction → nonlinear intensity mapping

Sampling → aliasing and resolution trade-offs

Each of these plays a critical role in digital imaging, from camera design to computer vision preprocessing.
