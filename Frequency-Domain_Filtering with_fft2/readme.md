Why does ideal LP cause ringing (Gibbs phenomenon)?
The ideal LP has a hard cutoff in frequency, whose spatial impulse response is a sinc with infinite support and oscillations. Convolution with this sinc produces oscillatory overshoot/undershoot near edges and step changes (Gibbs ringing).
What does fftshift do visually?
It recenters the zero frequency (DC) from the top-left to the image center, placing low frequencies in the middle and high frequencies toward the corners, making the spectrum easier to interpret.
When is frequency-domain filtering computationally preferable?
For large, non-separable kernels (e.g., >15×15), since FFT-based convolution is O(MN log(MN)) vs O(MN K^2) in spatial.
When applying many filters to the same image (reuse the FFT of the image).
For operations naturally defined in frequency (e.g., ideal filters, deconvolution, Wiener).
Note: use zero-padding to avoid circular convolution artifacts. For small or separable kernels, spatial filtering is typically faster.
