Answers to the reflection questions

Which noise is best removed by the median filter? Why?
Salt-and-pepper noise. Median filtering is robust to impulsive outliers because it selects the median within a neighborhood, which ignores isolated high/low spikes without averaging them into surrounding pixels.

Why does linear filtering blur edges more?
Linear filters (e.g., mean, Gaussian) average across a window without considering discontinuities. At edges, pixels from different regions are mixed, reducing contrast and causing edge blurring. Linear filtering reduces high-frequency content uniformly, and edges are high-frequency features.
How could we design adaptive filters to preserve detail?

Use filters that adapt weights based on intensity similarity and/or spatial structure:
Bilateral filter (spatial + range weighting)
Guided filter or edge-aware smoothing
Anisotropic diffusion (Perona–Malik) to inhibit smoothing across edges
Adaptive median filter for impulsive noise with variable window size
Non-local means (patch-based similarity)
Switching or decision-based filters that detect noise first and only replace likely-corrupted pixels
