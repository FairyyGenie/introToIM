## Communications Game

### Concepts:

So processing will tell you which color to choose by showing you the color and the words. But the words are there to confuse you.  
To earn points, press the switch that matches the color of the word and not the text.
So I used four switches, blue, red, yellow, and green on arduino. Use the arduino to answer the question on processing.  

### Pictures and schematic and video link

Here is a link to the game video: https://youtu.be/r8KemEg4w1E. 
<img src="https://github.com/FairyyGenie/introToIM/blob/main/June28/June28.jpg" width="400" height="300">. 

### Problem:
The score counting to me was a problem.  
Because when I press the switches, sometimes the number reading does not just read one time.  
And so the communication can be a little complex there. 
it goes this way: Processing decides coloe --> arduino press color --> then processing if color matches and if match score+=1. 
So I am not completely sure if that is the reason why the score sometimes jumps too much, I would like it to just plus 1 but it ends up +4.  
I used integers to determine if color is right, and here is the code to read in the switches:  
````
if (values[0]==1)
    {
      bluenum=1;
    } else
    {
      bluenum=0;
    }
    if (values[1]==1)
    {
      yellownum=1;
    } else
    {
      yellownum=0;
    }
    if (values[2]==1)
    {
      rednum=1;
    } else
    {
      rednum=0;
    }
    if (values[3]==1)
    {
      greennum=1;
    } else
    {
      greennum=0;
    }
````
And here is the code to determine the score:
````
//use if function to set the scores
    if (using==r)
    {
      if (rednum==1)
      {
        score+=1;
      } else
      {
        score+=0;
      }
    } else if (using==b)
    {
      if (bluenum==1)
      {
        score+=1;
      } else
      {
        score+=0;
      }
    } else if (using==y)
    {
      if (yellownum==1)
      {
        score+=1;
      } else
      {
        score+=0;
      }
    } else if (using==g)
    {
      if (greennum==1)
      {
        score+=1;
      } else
      {
        score+=0;
      }
    }
````
Maybe just use a boolean to replace the integers will be the best? so there are not this many variables.

