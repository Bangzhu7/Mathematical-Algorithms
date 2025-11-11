🧠 Hybrid Traditional + AI Image Processing Pipeline
📘 Overview

This project demonstrates a hybrid image processing approach that combines traditional computer vision (color segmentation using K-Means) with modern deep learning (image classification using SqueezeNet).
The goal is to show how isolating the main object using traditional methods can help AI models make more focused and accurate predictions.

🧩 Workflow Summary
Step Description

1. Load Image & AI Model A sample image (peppers.png) is loaded, and a pre-trained SqueezeNet model is initialized.
2. Traditional Segmentation The image is converted to the Lab color space and segmented using K-Means clustering to isolate the main object.
3. AI Classification The segmented (isolated) object is resized and passed into the SqueezeNet CNN for image classification.
4. Results Display The program displays the original image, segmentation mask, isolated object, resized AI input, and the classification result with confidence level.
   🖼️ Output Visualization

After running the script, a 2×2 figure window will appear showing:

Original Image

K-Means Mask (Segmentation Result)

Isolated Object (Traditional Output)

Resized Image for AI Input

The Command Window will show the AI classification result, for example:

=============================================
HYBRID PIPELINE RESULTS
=============================================
Predicted Class: bell pepper
Confidence: 92.34%

---

Observation:

- Traditional segmentation helps isolate the main object,
  allowing the AI to focus on relevant image features.
- This hybrid approach can improve classification accuracy
  compared to direct AI classification of full images.
  =============================================

⚙️ Requirements

MATLAB R2021a or later

Deep Learning Toolbox

Internet connection (first time only, to download squeezenet)

▶️ How to Run

Open MATLAB.

Save the code as Hybrid_AI_Pipeline.m in your working directory.

Run the script:

Hybrid_AI_Pipeline

Wait for the figure and Command Window output.

🧭 Learning Outcomes

After completing this project, you should be able to:

Apply K-Means clustering for color-based image segmentation.

Use pre-trained deep learning networks (SqueezeNet) in MATLAB.

Combine traditional and AI-based methods for better image analysis.

Interpret classification confidence and segmentation results.
