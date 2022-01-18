# basic_image_proccesing
In this project we have used digital signal processing to do basic image
processing. Image proceeding is a discipline where DSP is highly
applied.Because digital images are consecrated by matrix of numbers, this
matrix is seen as a digital signal with function of space (unlike time for
most of signals). So like other digital signals images are also proceed using
convolutions,Fourier transform and Laplace transforms and many other. In
this project we have used constitutions and tradition additions and
multiplications of a signal. But still Matlab built in functions use Fast
Fourier transform to do constitutions faster.
In this project we wrote program that do manipulation on RGB type
digital images. Those types of images are stored in Matlab my by three m x
n matrix each representing intensity of a pixel for red,green and blue
respectively. So in this project you will be seeing us taking this matrix and
processing it as to manipulate the massage to our need.
The proceeding we perform on input images are basic tradition image
prepossessing like brightness,contrast, blurring and edge detection.
we will be describe each ones functionalities and implementations.

# Problem statement

Images have applications in wide areas of technology. They are used to
show the variation of parameter over a surface. Images are formed by
temperature, blood velocity, x-ray and ground motion to say the list other
than convection visible light. but so the produced image should be
processed to our need, for example in case of x ray we can make the
produced image sharper for more clarity. having the image matrix as a

# Implantation of the Project

As we have said earlier RGB digital images are 3 n by m matrices in
Matlab. This matrix is digital signal that can be processed using elementary
signal processing. we use constant addition, multiplication and convolution
to implement the functionalities listed above and we will descend each blew

# Brightness:

Brightness of an image is increased by adding constant to each element
in the matrices

# contrast

As contrast is gradient of brightness it can be increased by multiplying
the elements by a constant

# blurring end edge detection

Unlike contrast or brightness blurring and edge detection require
convolution. The convolution in image processing is different from the
traditional convolution in DSP because the signal is 3 or 2 dimension
matrix instead of one dimensional vector. Other wise its same as its
counter part one dimensional vector.

Convolution can be seen as modifying a functions shape based on
another function. Like wise here a matrices shape is modified by a
convolution matrix called point spread function. the may changing the
matrix we are change the image thus processing the image to our need.
So that because we can do convolution can be done on image the type
of processing is determined by PSF(point spread function). PSF is just
another smaller function usually 3 by 3. in this project blurring and edge

# The code and the libraries used

Matlab and in our case GNU Octave have basic libraries for image
processing and convolution. And we have used built in functions listed
below in our project

# Imread(filepath)

This Matlab's built in function will return (n x m x r) matrix of an
image. r the third dimension is the color component of the matrix. Its
always 1 for the red part 2 for the green part and 3 for blue part.

# Imwrite(matrix)

This function is used to write the processed matrix image signal to an
image file after edit.

# conv2(matrix,psg,flag)

This function is used to convolve 2 dimensional matrices. Because
we have 3 dimensional matrix we used this function by isolating each
2D matrix and looping it.
We used the flag “same”, this will clip the extra dimension so it
will be the same as the input matrix.
other than those other functions are used for graphics purpose and are not

# The code for each functionalities

Here we discuss the code we wrote briefly using pseudo code for each
functionalities in the program.
brightness
i = imread(“imge”)
// this will import the image to be manipulated
i = i + k*100
// this will add some consonant to each element
// in the matrix
imwirte(i,“path” ) // then we finally save the processed image
For the color brightness we isolate the color dimension matrices by
ir = i(:,:,1)
// this will take the red part only
and similarly i(:,:,2) and i(:,:,3) will isolate blue and green
contrast
like brightness we import the image then,
i = i*k // multiply each pixel by a constant
blur and edge detection
after importing we first determine our psg, psg for blurring is
psg = ones(k,k) // this will create k by k matrices filled by one
and for edge detection
psg = -1 * ones(3,3)*k/8 // psg matrices described above
psg(1,1) = 1 //
after this we convolve it
i = conv2(i,psg)
but for edge detection the image should be in grayscale
i = i(:,:,1)
// this is almost grayscale in Matlab

# How to use the program

We developed the program using GNU Octave which is compatible
with Matlab. Thus to run the program use Matlab or GNU Octave. 
The program a script, so its not excusable type.So to run it, 
open GNU Octave run the script provided by name of final_program.m.
After you run the script a UI will appear like shown below.
