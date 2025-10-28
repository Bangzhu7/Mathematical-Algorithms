Why is Gaussian preferred over large box LP?
The Gaussian has a smooth, bell-shaped frequency response with no side-lobe ripples, so it suppresses ringing and preserves structures more naturally.
The box filter’s frequency response is a sinc (in 1D; separable product in 2D) with strong side lobes that pass unwanted higher frequencies, causing artifacts and halos, especially for larger kernels.
Gaussian is also isotropic and separable, giving more uniform blur in all directions.
What does separability do for computational cost?
Reduces per-pixel complexity from O(K^2) to O(2K) for a K×K kernel (e.g., 49 multiplies → 14 for 7×7).
Fewer memory passes and better cache locality (horizontal pass then vertical pass), so it’s faster in practice too.
How do boundary modes change corners/edges?
replicate: Extends edge pixels outward. Can create flat “plateaus” at the border and may introduce slight halos near corners.
symmetric: Mirrors the image at the boundary. Best preserves continuity and tends to produce the least visible artifacts at edges.
circular: Wraps the image around. Can create obvious seams if the image isn’t naturally periodic. Useful mainly for Fourier/periodic contexts.
