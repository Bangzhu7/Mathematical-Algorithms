1. Which operator gives the thinnest, cleanest edges?
   Canny gives the thinnest and cleanest edges.

It finds edges clearly and makes them just one pixel wide.
Sobel and Prewitt give thicker or noisier edges.
LoG can find edges but often breaks them or adds false ones.
✅ So, Canny is the best at giving clean, thin edges.

2. Why does Canny outperform simple gradient filters?
   Canny is better because it does more smart steps:

Removes noise first (smoothes the image).
Finds strong edges only (thinnes them down).
Uses two thresholds: keeps strong edges and connects weak ones to them (called hysteresis).
Sobel and Prewitt only find gradients — they don’t clean up the edges like Canny does.

👉 So, Canny gives fewer fake edges and better-connected real edges.

3. How does Otsu relate to histogram-based thresholding?
   Otsu is a method that automatically picks the best black-and-white cutoff (threshold) by looking at the image’s brightness histogram.

It finds the valley between two peaks (light and dark areas).
Then turns the image into black and white using that smart choice.
🎯 So, Otsu = automatic histogram-based thresholding for clean binary images.
