import streamlit as st
import pandas as pd
import numpy as np
import cv2

def byteToNP(bytes):
    nparr = np.frombuffer(bytes,np.uint8)
    image = cv2.imdecode(nparr,cv2.IMREAD_GRAYSCALE)
    return image

def erode(image, kernel, iterations=1):
    # Get image dimensions
    height, width = image.shape

    # Get kernel dimensions
    k_height, k_width = kernel.shape

    # Calculate padding needed for the kernel
    pad_height = k_height // 2
    pad_width = k_width // 2

    # Create an empty output image
    eroded_image = np.zeros_like(image)

    # Perform erosion for the specified number of iterations
    for _ in range(iterations):
        # Iterate over each pixel in the image
        for i in range(pad_height, height - pad_height):
            for j in range(pad_width, width - pad_width):
                # Initialize min value to 255 (assuming image is in grayscale)
                min_val = 255
                # Iterate over the kernel
                for m in range(k_height):
                    for n in range(k_width):
                        # Check if the current kernel position is 1
                        if kernel[m, n] == 1:
                            # Update min value if the pixel value is smaller
                            if image[i-pad_height+m, j-pad_width+n] < min_val:
                                min_val = image[i-pad_height+m, j-pad_width+n]
                # Set the eroded pixel value
                eroded_image[i, j] = min_val

        # Update the input image with the eroded image for the next iteration
        image = eroded_image.copy()

    return eroded_image

def dilate(image, kernel, iterations=1):
    # Get image dimensions
    height, width = image.shape

    # Get kernel dimensions
    k_height, k_width = kernel.shape

    # Calculate padding needed for the kernel
    pad_height = k_height // 2
    pad_width = k_width // 2

    # Create an empty output image
    dilated_image = np.zeros_like(image)

    # Perform dilation for the specified number of iterations
    for _ in range(iterations):
        # Iterate over each pixel in the image
        for i in range(pad_height, height - pad_height):
            for j in range(pad_width, width - pad_width):
                # Initialize max value to 0
                max_val = 0
                # Iterate over the kernel
                for m in range(k_height):
                    for n in range(k_width):
                        # Check if the current kernel position is 1
                        if kernel[m, n] == 1:
                            # Update max value if the pixel value is greater
                            if image[i-pad_height+m, j-pad_width+n] > max_val:
                                max_val = image[i-pad_height+m, j-pad_width+n]
                # Set the dilated pixel value
                dilated_image[i, j] = max_val

        # Update the input image with the dilated image for the next iteration
        image = dilated_image.copy()

    return dilated_image

def main():
    st.set_page_config(page_title="Image Morphology",layout="centered")
    st.title("Morphological Applications")
    uploaded_image = st.file_uploader("Choose a file")
    if(uploaded_image is not None):
        # Taking image input and displaying it
        st.image(uploaded_image,caption="Original Image")
        img_bytes = uploaded_image.read()
        #Converting to Bytes, NP array and the Greyscale
        gs_image = byteToNP(img_bytes)
        st.image(gs_image,"Greyscale")

        # Dilation
        st.header("Dilation")
        dil_itrn = st.slider("Number of iterations?",1,4,key=1)

        kernel = np.array([[0, 1, 0],
                    [1, 1, 1],
                    [0, 1, 0]], dtype=np.uint8)
        dilated_image = dilate(gs_image, kernel, dil_itrn)
        st.image(dilated_image,"Dilated")

        # Erosion
        st.header("Erosion")
        ern_itrn = st.slider("Number of iterations?",1,4,key=2)
        eroded_image = erode(gs_image, kernel, ern_itrn)
        st.image(eroded_image,"Eroded")

if __name__ == "__main__":
    main()
    
