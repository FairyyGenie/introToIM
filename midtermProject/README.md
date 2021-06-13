# Documentation for the midterm project

## first sketch of the game
This sketch did not help too much, the game turned out to be completely different.  
<img src="https://github.com/FairyyGenie/introToIM/blob/main/midtermProject/Images/midtermsketch.PNG" width="200" height="300">

## Actual Screenshots of the game & the video
Here is the youtube link to my project: https://youtu.be/6U290t5brLA

Here are some screen shots:  

For the background images and the items, it took me sometime to create them. I eventually used Canva and some editing tool to make them.  

<img src="https://github.com/FairyyGenie/introToIM/blob/main/midtermProject/Screenshotsofgame/begin.png" width="500" height="500"><img src="https://github.com/FairyyGenie/introToIM/blob/main/midtermProject/Screenshotsofgame/game1.png" width="500" height="500"><img src="https://github.com/FairyyGenie/introToIM/blob/main/midtermProject/Screenshotsofgame/game2.png" width="500" height="500"><img src="https://github.com/FairyyGenie/introToIM/blob/main/midtermProject/Screenshotsofgame/game3.png" width="500" height="500"><img src="https://github.com/FairyyGenie/introToIM/blob/main/midtermProject/Screenshotsofgame/final.png" width="500" height="500">

## Logic of the game

The first stage(Introduction):  
You will see a page explaining the game for you. And by pressing the ````Let's Go```` button you will enter the real game.  
When entering this page the background music will start looping.

The second stage(Gaming):  
So you will see four differnt recycle bins on the bottom of the frame and the trashes will fall from the sky.  
And the challenge is to know which trash goes into which trash bin.  
When it is being put in the right one, the windmill will start spinning and produce electricity. And there will be a sound effect saying "nice!"
When it is into the wrong ones, the windmill will stop and no electricity produced. The sound effect here is "Oh No!"
There will be 30 trashes for you to sort. When all 30 finshed dropping from the sky, you will enter the next stage(Results).

The third stage(Results):  
The results are in three levels "beginner", "Intermediate", and "Master."  
In this page you will get to see your score, how much electricity was produced, and choose to restart the game or just exit.  
If choose to restart then the game jump back to the second stage.

## Interesting thing
I am not sure why but when I started to think about the idea. I wanted it to be having something to do with windmill and electricity.  
Now I finished the game, I am not sure what recycling has to do with windmill energy haha.  
But it was fun to make ! It's like a game/ windmill simulator.


## Problems I found 
### 1. The speed update

I struggled with the speed updating SO MUCH. I eventually choose an alternative way cause despite my effort of trying to know what was wrong. I am not sure I know. 
At a certain point, the entire processing shot down with some sort of error and won't let me update the speed the way I want.
These are my orginal code inside of the trash class:

````
void drop(){
  if (howmany <10)
  {
    speed = 5;
  }
  else if (howmany>=10 && howmany<20)
  {
    speed = 10;
  }
  else if (howmany>=20 && howmany<25)
  {
    speed = 15;
  }
  else if (howmany>25)
  {
    speed = 20;
  }
}

void display(){
    keyPressed();
    drop();
    image(sprite, x, y);
    y=y+speed;
}
````

### 2. Class interaction

### 3. When to initiate class objects

### 4. WindMill Rotation

### 5. Restart of the game

### 6. Time management
