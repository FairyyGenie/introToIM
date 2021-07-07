# Music and its order!!

## Concept used in the project:  
Serial Communication as the main way to play the game.   
Arduino: Analog INPUT, Digital INPUT, Digital OUTPUT, Analog OUTPUT, Tone.   
Processing: Sprite, Sound, Text, Images, StateMachine.   

This is a music topic game challenging the users to recognize notes.  
Arduino:  
Photon sensor is used to control background color.  
LEDs are there to show if you answer the questions correctly. Green for correct, and Red for wrong.  
Tone is used to play notes when click on images of C, D, E, F.....
Switch is used to select answer in seperation with paly the note from tone(mousePressed to play tone).  
Potentiometer is used to control the X coordinate of the hand sprite.  

Processing:  
Showing questions and play the piano notes when click on question.  
Examine the answer through arrays.  

## Video of arduino and processing & Screenshots & Schematic:  

video of processing view: https://youtu.be/iXQvuL4FXzI.   
video of arduino view: https://youtu.be/f5DdZ445FY8. 

### Starting state:  
<img src="https://github.com/FairyyGenie/introToIM/blob/main/finalProject/Imagesofgame/final-1.png" width="400" height="400">.  

### Play stage:  
<img src="https://github.com/FairyyGenie/introToIM/blob/main/finalProject/Imagesofgame/final-2.png" width="400" height="400">.  

### Input answers:  
<img src="https://github.com/FairyyGenie/introToIM/blob/main/finalProject/Imagesofgame/final-3.png" width="400" height="400">.   

### Press Restart:  
<img src="https://github.com/FairyyGenie/introToIM/blob/main/finalProject/Imagesofgame/final-4.png" width="400" height="400">. 

### Press Exit:  
<img src="https://github.com/FairyyGenie/introToIM/blob/main/finalProject/Imagesofgame/final-5.png" width="400" height="400">.  

### Pics of the arduino panel:  
<img src="https://github.com/FairyyGenie/introToIM/blob/main/finalProject/Imagesofgame/final-6.jpg" width="500" height="400">. 
<img src="https://github.com/FairyyGenie/introToIM/blob/main/finalProject/Imagesofgame/final-7.jpg" width="500" height="400">. 

### Schematic:  
<img src="https://github.com/FairyyGenie/introToIM/blob/main/finalProject/Imagesofgame/final-schmetic.png" width="800" height="640">. 

## Problems: 

### 1. I am so bad at music and it is extremely hard to find a simple enough piano melody piece to have the player recognize the notes.
So I imported each note one by one finding the sound file for each note.(only the majors notes so C D E F G A B). I put them in a Soundfile array and hoping to be able to play is one by one so it is a simple melody.
### 2.  Set up the arduino communications and sending too many integer from processing to arduino does not work
But originally I was going to send 7 integers from processing to Arduino.
And somehow arduino then slowed down as if it can't process that many integers.
So I changed my integer to just having one and each number has different meaning.
Is it because the processing is too fast and arduino cannot process?

