/*
name: Genie Hou
 date: 2021 June 14
 Midterm Project: Sustainability Game
 concept: The goal is to have the windmill spin as many round as you can! And if you have the trash
 drop into the right trash bin then you win, then the windmill spin one round and produce electricity.
 interactive: Press the right and left key to have it drop into the right place
 version: 2.5
 */

//import sound library
import processing.sound.*;

SoundFile nice, begin, no,bgm;

//a boolean signalling the windmill to spin and another for the game to stop when hit 30 trashed dropped
boolean spin;
boolean endornot;

//text font
PFont myfont;

//float to control game stage and keep track of score
float stage=1;
float score=0;
int howmany=0;
float elec=0;

//set up Images of trash bins
PImage glassbin;
PImage plasticbin;
PImage tinbin;
PImage paperbin;

//background image
PImage bg;
PImage ninja;
PImage beginner;
PImage middle;
PImage great;

//image of the trashes
PImage glass1, glass2, glass3, glass4;
PImage tin1, tin2, tin3, tin4, tin5;
PImage paper1, paper2, paper3, paper4;
PImage plastic1, plastic2, plastic3, plastic4;

//set up the shape of the windmill
void windmill(float x, float y)
{
  stroke(0, 0, 0);
  strokeWeight(2);
  fill(255, 253, 221);
  triangle(x+8, y-5, x+70, y+20, x+8, y+8);
  triangle(x-5, y-5, x-70, y+20, x+5, y+5);
  triangle(x-5, y, x, y-75, x+5, y);
  ellipse(x, y, 20, 20);
}//end of shape

//set up class for the windmill
class windmill
{
  //the position of the windmill
  float xplace;
  float yplace;

  //constructor
  windmill()
  {
    xplace=800;
    yplace=200;
  }

  //the display function
  void display()
  {
    rect(xplace, yplace, 5, 200);
    //start of shape
    pushMatrix();
    //transformation
    translate(xplace, yplace);
    //when requirement for spin met then spin
    if (spin==true)
    {
      rotate(frameCount/10);
      elec+=0.1;
    }
    scale(2, 2);
    windmill(0, 0);
    popMatrix();
    //end of shape
  }
}//end of class windmill

//the trash class
class trash
{
  //put all the trash image in one array of trashes
  PImage[] trashes={glass1, glass2, glass3, glass4, tin1, tin2, tin3, tin4, tin5, paper1, paper2, paper3, paper4, plastic1, plastic2, plastic3, plastic4};
  //set up numbers
  int choose;
  float x=random(0, 960);
  float y;
  float speed;
  int correct;
  //the sprite of the time
  PImage sprite;

  //constructor
  trash()
  {
    //set the numbers
    y=20;
    speed=2;
    //select the sprite
    choose=round(random(0, 16));
    sprite=trashes[choose];
    //if the sprite is glass the correct number is 1
    if (sprite==glass1||sprite==glass2||sprite==glass3||sprite==glass4)
    {
      correct=1;
    }
    //if the sprite is tin the correct number is 3
    else if (sprite==tin1||sprite==tin2||sprite==tin3||sprite==tin4||sprite==tin5)
    {
      correct=3;
    }
    //if the sprite is plastic then correct num is 2
    else if (sprite==plastic1||sprite==plastic2||sprite==plastic3||sprite==plastic4)
    {
      correct=2;
    }
    //if the sprite is paper then correct num is 4
    else
    {
      correct=4;
    }
    //resize the sprite
    sprite.resize(0, 100);
  }

  //dropping function it gets faster as trash falls
  void drop()
  {
    speed+=0.1;
  }

  //function for the keys
  //left and right
  void keyPressed()
  {
    if (key==CODED)
    {
      if (keyCode==RIGHT)
      {
        x+=10;
        if (x>950)//cannot go over the screen
        {
          x=950;
        }
      } else if (keyCode==LEFT)
      {
        x-=10;
        if (x<20)//cannot go over the screen
        {
          x=20;
        }
      }
    }
  }

  //display function
  void display()
  {
    keyPressed();
    drop();
    image(sprite, x, y);
    y=y+speed;
  }
}//end of class trash

//game logic class
class game
{
  trash trash1;
  windmill wind1;

  //constructor for the game
  game()
  {
    trash1=new trash();
    wind1=new windmill();
  }

  //check if trash in right bin function
  void tobin()
  {
    //if drop into different position then score plus or stay the same
    //initiate new objects and update windmill spinning status
    if (trash1.correct==1)
    {
      if (trash1.x<260&&trash1.x>60&&trash1.y>700&&trash1.y<1000)
      {
        //music play
        nice.play();
        //update score
        score+=1;
        spin=true;
        //new object
        trash1=new trash();
        howmany+=1;
      } else if (trash1.y>1000)
      {
        no.play();
        score+=0;
        spin=false;
        trash1=new trash();
        howmany+=1;
      }
    } else if (trash1.correct==2)
    {
      if (trash1.x<480&&trash1.x>280&&trash1.y>700&&trash1.y<1000)
      {
        nice.play();
        score+=1;
        spin=true;
        trash1=new trash();
        howmany+=1;
      } else if (trash1.y>1000)
      {
        no.play();
        score+=0;
        spin=false;
        trash1=new trash();
        howmany+=1;
      }
    } else if (trash1.correct==3)
    {
      if (trash1.x<700&&trash1.x>500&&trash1.y>700&&trash1.y<1000)
      {
        nice.play();
        score+=1;
        spin=true;
        trash1=new trash();
        howmany+=1;
      } else if (trash1.y>1000)
      {
        no.play();
        score+=0;
        spin=false;
        trash1=new trash();
        howmany+=1;
      }
    } else if (trash1.correct==4)
    {
      if (trash1.x<920&&trash1.x>720&&trash1.y>700&&trash1.y<1000)
      {
        nice.play();
        score+=1;
        spin=true;
        trash1=new trash();
        howmany+=1;
      } else if (trash1.y>1000)
      {
        no.play();
        score+=0;
        spin=false;
        trash1=new trash();
        howmany+=1;
      }
    }
  }

  //display function
  void display()
  {
    tobin();
    wind1.display();
    trash1.display();

    //if there are 30 trashes already then game end
    if (howmany>=30)
    {
      endornot=true;
    }
  }
}//end of game class

//initate the game object
game game1;

void setup()
{
  //size
  size(1000, 1000);

  //load images
  glassbin=loadImage("RecycleGlass.png");
  plasticbin=loadImage("RecyclePlastic.png");
  tinbin=loadImage("RecycleTin.png");
  paperbin=loadImage("RecyclePaper.png");
  ninja=loadImage("Ninja.png");
  beginner=loadImage("Beginner.png");
  middle=loadImage("Intermediate.png");
  great=loadImage("Master.png");
  bg=loadImage("Background.png");
  glass1=loadImage("glass1.png");
  glass2=loadImage("glass2.png");
  glass3=loadImage("glass3.png");
  glass4=loadImage("glass4.png");
  tin1=loadImage("tin1.png");
  tin2=loadImage("tin2.png");
  tin3=loadImage("tin3.png");
  tin4=loadImage("tin4.png");
  tin5=loadImage("tin5.png");
  paper1=loadImage("paper1.png");
  paper2=loadImage("paper2.png");
  paper3=loadImage("paper3.png");
  paper4=loadImage("paper4.png");
  plastic1=loadImage("plastic1.png");
  plastic2=loadImage("plastic2.png");
  plastic3=loadImage("plastic3.png");
  plastic4=loadImage("plastic4.png");

  //load sound files
  nice=new SoundFile(this, "nice.mp3");
  begin=new SoundFile(this, "begin.mp3");
  no=new SoundFile(this, "nope.mp3");
  bgm=new SoundFile(this,"bensound-retrosoul.mp3");
  
  //bgm play
  bgm.loop();

  //background color
  background(255, 255, 255);

  //create objects
  game1=new game();
}

//the opening stage of explanation and button
void openingstage()
{
  //image of explanation
  image(ninja, 0, 150);
  pushMatrix();

  //button
  strokeWeight(5);
  stroke(255, 255, 255);
  fill(230, 255, 221);
  rect(400, 750, 200, 50, 5);

  //text 
  myfont = loadFont("Arial-Black-100.vlw");
  textFont(myfont);
  textSize(25);
  fill(0, 0, 0);
  text("Let's GO!!", 445, 785);
  popMatrix();

  //if press the button then go to the next stage
  if (mouseX<600 && mouseX>400 && mouseY<800 && mouseY>750 && mousePressed==true)
  {
    begin.play();
    stage=2;
  }
}

//playing stage
void playstage()
{
  //set the background and the recycle cans
  background(bg);
  image(glassbin, 60, 700, 200, 300);
  image(plasticbin, 280, 700, 200, 300); 
  image(tinbin, 500, 700, 200, 300);
  image(paperbin, 720, 700, 200, 300);
  
  //text for score in the middle
  myfont = loadFont("Arial-Black-100.vlw");
  textFont(myfont);
  textSize(72);
  fill(158, 158, 154);
  text("Your Score: ", 100, 450);
  int score1=round(score);
  text(score1, 600, 450);

  //electricity texts
  textSize(40);
  text("Electricity produced", 100, 550);
  int elec1=round(elec);
  text(elec1, 580, 550);
  text("watt", 750, 550);

  //start playing game !
  game1.display();

  //if ending then next stage
  if (endornot==true)
  {
    stage=3;
  }
}

//show you your results and see if you want to restart
void ending()
{
  background(255, 255, 255);

  //showing results from the difference of scores
  if (score<10)
  {
    //image placed
    image(beginner, 0, 150);
    //text for the score
    myfont = loadFont("Arial-Black-100.vlw");
    textFont(myfont);
    textSize(60);
    fill(0, 0, 0);
    int score1=round(score);
    text(score1, 300, 575);
    textSize(24);
    text("Electricity Produced: ", 400, 575);
    int elec1=round(elec);
    text (elec1, 700, 575 );
  } else if (score>=10&&score<20)
  {
    //image placed
    image(middle, 0, 150);
    //text for the score
    myfont = loadFont("Arial-Black-100.vlw");
    textFont(myfont);
    textSize(60);
    fill(0, 0, 0);
    int score1=round(score);
    text(score1, 300, 575);
    textSize(24);
    text("Electricity Produced: ", 400, 575);
    int elec1=round(elec);
    text (elec1, 700, 575 );
  } else if (score>=20&&score<=30)
  {
    //image placed
    image(great, 0, 150);
    //text for the score
    myfont = loadFont("Arial-Black-100.vlw");
    textFont(myfont);
    textSize(60);
    fill(0, 0, 0);
    int score1=round(score);
    text(score1, 300, 575);
    textSize(24);
    text("Electricity Produced: ", 400, 575);
    int elec1=round(elec);
    text (elec1, 700, 575 );
  }

  //restart button
  strokeWeight(5);
  stroke(255, 255, 255);
  fill(230, 255, 221);
  rect(250, 850, 200, 80, 5);
  //restart text
  fill(0, 0, 0);
  textSize(24);
  text("Restart!", 300, 900);

  //Exit button 
  strokeWeight(5);
  stroke(255, 255, 255);
  fill(255, 164, 148);
  rect(600, 850, 200, 80, 5);
  //Exit text
  fill(0, 0, 0);
  textSize(24);
  text("Exit", 670, 900);

  //if press the button then go to the next stage
  if (mouseX>600 && mouseX<800 && mouseY<930 && mouseY>850 && mousePressed==true)
  {
    //exit the game
    exit();
  } else if (mouseX>250 && mouseX<450 && mouseY<930 && mouseY>850 && mousePressed==true)
  {
    //restart the game
    howmany=0;
    endornot=false;
    spin=false;
    score=0;
    elec=0;
    game1=new game();
    stage=2;
  }
}

//draw function
void draw()
{
  //using the stage number to control game stage
  if (stage==1)
  {
    openingstage();
  } else if (stage==2)
  {
    playstage();
  } else if (stage==3)
  {
    ending();
  }
}
