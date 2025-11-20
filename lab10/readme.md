Low-Light Image Enhancement Demo
A MATLAB script that uses a pretrained deep learning network to enhance extremely dark and noisy images.

What It Does
Takes dark, noisy images and automatically brightens them while reducing noise using AI-based enhancement.

Requirements
MATLAB R2020b or later
Deep Learning Toolbox
Computer Vision Toolbox
Image Processing Toolbox
Quick Start
matlab
% Simply run the script
run('LowLightEnhancementDemo.m')
The pretrained model (~95MB) downloads automatically on first run.

Features
✅ Automatic model download
✅ GPU acceleration (if available)
✅ Side-by-side comparison visualization
✅ Works with any RGB image
Customize
Use your own image:

matlab
I = imread("your_image.jpg");  % Line 36
Adjust darkness level:

matlab
darkFactor = 0.03;  % Range: 0.01 (very dark) to 0.10 (less dark)
Output
Displays three images:

Original RGB image
Simulated low-light + noise
AI-enhanced result
