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
````global int howmany ```` is to keep track of howmany trash objects the programs has created.

````
class trash{
//constructor and variables here
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
}
````
Somehow, the speed wouldn't change and always stayed at 5. And it wouldn't speed up.  
I tried to put the drop function in the game class and control it from there and switching places and changing up variables.  
It didn't work, so I just decided I was going to go for the easier way.  
This is the code I use eventually:
````
class trash{
  float speed=5;
  void drop(){
    speed+=0.1;
  }
}
````
So it is not changing the speed based on how many trash, but based on how long it fell sorta like gravity.

### 2. Class interaction

This is the first time I actually tried to have one class access the others in Java.  
It is quite different from Python and C++.  
But great learning a new language!!

I have the game class access the attributes of trash and windmill class.  
Actually I straight up initiate objects in the constructor.

This is what I wrote
````
class game
{
  windmill wind1;
  trash trash1;
  
  game()
  {
    wind1 = new windmill();
    trash1 = new trash();
  }
}
````

### 3. When to initiate class objects

I kinda experienced around with when it is okay and not okay to initiate objects with ````new````.  
I find out that it can only be done in static program.  
So for example if it is used in ````void draw()```` or the functions called in draw(), it wouldn't work.

### 4. WindMill Rotation

### 5. Restart of the game

### 6. Time management
