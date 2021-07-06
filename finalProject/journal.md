## For the final Project !!!
### Idea:
I kind of want to build a music game of some sort, but at the same time I am kind of scared this is not creative enough so maybe I will think about this more.  
### Proposal:

Maybe asked a song's chords?  Or maybe just have give the user choices to make a song ?  
So the processing side will in some form ask you a music question. And according to the answer of your choice, use the arduino to answer.  
A music game using switch, Tone, and light sensor or potentiometer. Maybe use also LCD to show if you answered the right choice. 

<img src="https://github.com/FairyyGenie/introToIM/blob/main/finalProject/music_final.png" width="600" height="600">. 

### Refined proposal:  

Suggestions from professor: have a way to hear the notes before selecting them maybe with a switch.
Move the hand from left to right with potentiometer and light sensor to go up and down, and a switch to catch it.  
Catch the notes after hearing the melody once, and maybe give some hints. 

### plan for each day:
#### July 1st: 

Try importing and finding some melody into processing first, and create sprites.

Problem:  
My problem is this --> I am so bad at music and it is extremely hard to find a simple enough piano melody piece to have the player recognize the notes.  
So I imported each note one by one finding the sound file for each note.(only the majors notes so C D E F G A B). 
I put them in a Soundfile array and hoping to be able to play is one by one so it is a simple melody.  
```
for (int i=0; i<5;i++)
{
  playlist[i].play();
}
````
But then this caused a huge chaotic sound problem with all five notes play at once.

#### July 2nd:

Build the music question class.
And set up the arduino sprite movement: light sensor and potentiometer.

Problem:  
I have to restructure the way the problem sound files are being play and the structure of the questions.  
To reduce the confilcts between the sound file.  
In the questions class, I wrote this :
````
 if (mousePressed==true && d<36)
    {
      playlist[0].play();
    }
````
But then it doesn't respond to me, and then I realized it is because I was calling the ````questions.display()```` in set up function.  
Naturally it doesn't work it should be in draw function.

Have not got to arduino yet.

July 4th:
I need to also revise the game logic, I didn't think of having an end and a way to go to the next questions so I am adding it now.

#### July 3rd:

Figure out a way to let the arduino play the tone if choosed a note.

Problem:   
I am not sure why but I am always having trouble with counting the questions or counting the scores. It just goes up exponentially.  
While I only need it to be one after another, I am changing it to just text writing first second and third and droping the questions 1, 2, 3, 4.  

#### July 4th:

Game logic, and try adding hints and other stuff.

#### July 5th:  

Can I make this game more fun and interactive?  

Problem:  
I did not get to add functions. I thought it would be easy to create a simple music game but it is really not that simple especially when I am not great at music.  

