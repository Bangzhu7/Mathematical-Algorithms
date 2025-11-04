1. Describe your processing pipeline.
   I followed 5 main steps:

Loaded image: Changed the color image to grayscale.
Removed noise: Used a median filter to clean up small specks.
Improved contrast: Made dark areas darker and bright areas brighter so details are clearer.
Detected edges: Found edges using the Canny method.
Low-pass filter (frequency): Removed high-frequency noise and kept smooth parts of the image.
Finally, I showed all results side by side.

2. Explain how each stage relates to DSP (Digital Signal Processing) operations.
   Each step is a common DSP operation:

Median filter → Non-linear filtering to remove noise without blurring edges.
imadjust → Contrast stretching, like amplifying certain signal levels.
Canny edge detection → Uses gradient filters (like derivatives) to find fast changes (edges).
FFT & Low-pass filter → In frequency domain: removes high frequencies (fine details/noise), keeps low (smooth areas).
👉 All of these are like processing signals — but in 2D (images instead of sound or time signals).

3. Discuss improvements or limitations.
   ✅ Good things (improvements):

Noise is reduced.
Edges are clear after enhancement.
Low-pass filter smooths the image nicely.
❌ Limitations:

Median filter can blur very fine details.
imadjust needs manual values — might not work well for all images.
Canny might miss weak edges or add false ones if thresholds are bad.
This pipeline works well on some images, but not all (not adaptive).
