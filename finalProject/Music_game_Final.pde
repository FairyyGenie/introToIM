/*
name: Genie Hou
 date: 2021 June 8
 Midterm Project: Music game + Arduino
 concept: questions asking you to put the right notes in the right place
 interactive: Arduino bread board to control the game
 version: 1
 */


//import sound & port library and import sound files
import processing.sound.*;
SoundFile Cmaj, Dmaj, Emaj, Fmaj, Gmaj, Amaj, Bmaj;
import processing.serial.*;
Serial port;

//set up the images
PImage A;
PImage B;
PImage C;
PImage D;
PImage E;
PImage F;
PImage G;
PImage cdplay;
PImage play;
PImage notes;
PImage earphone;
PImage hand;

PFont myfont;

//class for the question
class questions {

  //the arrays for images
  PImage[] chordspic={A, B, C, D, E, F, G};
  PImage[] order=new PImage[5];
  SoundFile[] playlist=new SoundFile[5];
  //set up random numbers
  int ran1;
  int ran2;
  int ran3;
  int ran4;
  int ran5;

  //constructor
  questions() {
    ran1=round(random(0, 6));
    ran2=round(random(0, 6));
    ran3=round(random(0, 6));
    ran4=round(random(0, 6));
    ran5=round(random(0, 6));
    order[0]=chordspic[ran1];
    order[1]=chordspic[ran2];
    order[2]=chordspic[ran3];
    order[3]=chordspic[ran4];
    order[4]=chordspic[ran5];
  }

  //for the sound to play as order
  void eachsound()
  {
    for (int i=0; i<5; i++)
    {
      if (order[i]==A)
      {
        playlist[i]=Amaj;
      } else if (order[i]==B)
      {
        playlist[i]=Bmaj;
      } else if (order[i]==C)
      {
        playlist[i]=Cmaj;
      } else if (order[i]==D)
      {
        playlist[i]=Dmaj;
      } else if (order[i]==E)
      {
        playlist[i]=Emaj;
      } else if (order[i]==F)
      {
        playlist[i]=Fmaj;
      } else if (order[i]==G)
      {
        playlist[i]=Gmaj;
      }
    }
  }

  //for the questions to be displayed
  void display()
  {
    /*for (int i=0; i<5; i++)
    {
      order[i].resize(0, 100);
      playlist[i].play();
    }*/
    
    //set up the playlist
    eachsound();
    
    //text and situating the images 
    myfont = loadFont("Arial-Black-100.vlw");
    textFont(myfont);
    textSize(35);
    fill(205, 153, 255);
    text("press the circles to here the sounds:", 50, 350);

    stroke(0,0,0);
    strokeWeight(6);
    fill(255,255,255);
    ellipse(100,450,75,75);
    
    stroke(0,0,0);
    strokeWeight(6);
    fill(255,255,255);
    ellipse(250,450,75,75);
    
    stroke(0,0,0);
    strokeWeight(6);
    fill(255,255,255);
    ellipse(400,450,75,75);
    
    stroke(0,0,0);
    strokeWeight(6);
    fill(255,255,255);
    ellipse(550,450,75,75);
    
    stroke(0,0,0);
    strokeWeight(6);
    fill(255,255,255);
    ellipse(700,450,75,75);
    
    float d=dist(mouseX,mouseY,100,450);
     //when press the circle sound play
    if (mousePressed)
    {
      print("yes");
    }
  }
}

class game {
}

questions Q1;

void setup() {
  //size background and the port
  size(800, 800);
  background(247, 225, 194);
  port = new Serial(this, Serial.list()[3], 9600);

  //loadImages
  A=loadImage("A.png");
  B=loadImage("B.png");
  C=loadImage("C.png");
  D=loadImage("D.png");
  E=loadImage("E.png");
  F=loadImage("F.png");
  G=loadImage("G.png");
  cdplay=loadImage("cdplayer.png");
  play=loadImage("play.png");
  hand=loadImage("hand.png");
  notes=loadImage("notes.png");
  earphone=loadImage("earphone.png");

  //load soundFile
  Cmaj=new SoundFile(this, "C.wav");
  Dmaj=new SoundFile(this, "D.wav");  
  Emaj=new SoundFile(this, "E.wav");
  Fmaj=new SoundFile(this, "F.wav");
  Gmaj=new SoundFile(this, "G.wav");
  Amaj=new SoundFile(this, "A.wav");
  Bmaj=new SoundFile(this, "B.wav");

  //text and situating the images 
  myfont = loadFont("Arial-Black-100.vlw");
  textFont(myfont);
  textSize(50);
  fill(165, 89, 241);
  text("Music and its order!", 150, 100);

  notes.resize(0, 100);
  image(notes, 20, 100);
  cdplay.resize(150, 0);
  image(cdplay, 600, 600);

  Q1=new questions();
  Q1.display();
}

void draw()
{
}
