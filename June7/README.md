# TV Screen Effect using Pixels and Images

### Here is the link to the video: https://youtu.be/8-Av0-pAins

This is a relatively simple one.  
The Logic of this program is to have it mimic the situation when the TV is broken.  
The pixels changes color randomly for the background to look like the fickering pixels.  
And then the lines randomly popping in the frame is made using the ````noise()```` function.

### Stage 1. 
<img src="TVbuzz.png" width=420 height="280">

### Stage 2  
<img src="TVopen.png" width=420 height="280">


## Questions found
### 1.  
In the pixels manipulating part, I was going to use noise float for the line to go randomly.  
But then at first it is telling me that ````pixels[i]```` the i can only be integers.  
So I changed the noise float to ````round(noise(num))```` to have it set as int.  
However, it just doesn't work within the ````pixels[i]````.  
I wonder if that is because noise produce when manipulating pixels we can not use random number that is rapidly changing to determine its location ?
### 2.
For the image loading part, I was originally going to use the method which is allowing me to use the url to get the image as processing page says it is allowed.  
I originally wrote this,  
    ````
    String url="https://github.com/FairyyGenie/introToIM/blob/main/June7/friends.jpeg";
    photo=loadImage(url,"jpeg");
    ````
