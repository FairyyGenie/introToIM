/*
name: Genie Hou
 date: 2021 July 8
 Midterm Project: Music game + Arduino
 concept: questions asking you to put the right notes in the right place
 interactive: Arduino bread board to control the game
 version: 5.5 -- changed the answer question method added key's to determine position
 */

//import sound & port library and import sound files
import processing.sound.*;
SoundFile Cmaj, Dmaj, Emaj, Fmaj, Gmaj, Amaj, Bmaj;
import processing.serial.*;
Serial port;

//set up the images and font
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

//boolean used to communicate with arduino
int playwhich;
int state=0;
int lightup;
boolean clicked; //if arduino press switch

//float to control the hand
float handx=0;
float handy=0;

//count the number of questions
int count;
//use the light sensor to control the bg color
int colorfbg;

//order array for the question
PImage[] order=new PImage[5];
//answer array to compare
PImage answer[]=new PImage[5];


//class for the question
class questions {

  //the arrays for images
  PImage[] chordspic={A, B, C, D, E, F, G};
  SoundFile[] playlist=new SoundFile[5];
  //set up random numbers
  int ran1;
  int ran2;
  int ran3;
  int ran4;
  int ran5;

  //constructor
  questions() {
    count=count+1;
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
    //to have the playlist array have the notes in the right order
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
    //set up the playlist
    eachsound();

    //text and situating the images 
    myfont = loadFont("Arial-Black-100.vlw");
    textFont(myfont);
    textSize(35);
    fill(205, 153, 255);
    text("press the circles to here the sounds:", 50, 350);

    //the circles representing the notes order
    stroke(0, 0, 0);
    strokeWeight(6);
    fill(255, 255, 255);
    ellipse(100, 450, 75, 75);

    stroke(0, 0, 0);
    strokeWeight(6);
    fill(255, 255, 255);
    ellipse(250, 450, 75, 75);

    stroke(0, 0, 0);
    strokeWeight(6);
    fill(255, 255, 255);
    ellipse(400, 450, 75, 75);

    stroke(0, 0, 0);
    strokeWeight(6);
    fill(255, 255, 255);
    ellipse(550, 450, 75, 75);

    stroke(0, 0, 0);
    strokeWeight(6);
    fill(255, 255, 255);
    ellipse(700, 450, 75, 75);

    //to determine if user is pressing the circle
    float d=dist(mouseX, mouseY, 100, 450);
    float d1=dist(mouseX, mouseY, 250, 450);
    float d2=dist(mouseX, mouseY, 400, 450);
    float d3=dist(mouseX, mouseY, 550, 450);
    float d4=dist(mouseX, mouseY, 700, 450);
    //when press the circle sound play
    if (d<37 && mousePressed==true)
    {
      playlist[0].play();
    } else if (d1<37&&mousePressed==true)
    {
      playlist[1].play();
    } else if (d2<37&&mousePressed==true)
    {
      playlist[2].play();
    } else if (d3<37&& mousePressed==true)
    {
      playlist[3].play();
    } else if (d4<37&&mousePressed==true)
    {
      playlist[4].play();
    }
  }
}

class game {
  //initiate questions in game class
  questions Q1;

  //game constructor
  game() {
    Q1=new questions();
  }

  //for each of the image to play sound on arduino
  void playsound()
  {
    //if click on the image then the tone on arduino play
    if (mouseX<200 && mouseX>150 && mouseY<300 && mouseY>200 && mousePressed==true)
    {
      playwhich=1;
    } else if (mouseX<400 && mouseX>350 && mouseY<300 && mouseY>200 && mousePressed==true)
    {
      playwhich=2;
    } else if (mouseX<600 && mouseX>550 && mouseY<300 && mouseY>200 && mousePressed==true)
    {
      playwhich=3;
    } else if (mouseX<150 && mouseX>100 && mouseY<750 && mouseY>650 && mousePressed==true)
    {
      playwhich=4;
    } else if (mouseX<250 && mouseX>200 && mouseY<630 && mouseY>530 && mousePressed==true)
    {
      playwhich=5;
    } else if (mouseX<350 && mouseX>300 && mouseY<750 && mouseY>650 && mousePressed==true)
    {
      playwhich=6;
    } else if (mouseX<450 && mouseX>400 && mouseY<630 && mouseY>530 && mousePressed==true)
    {
      playwhich=7;
    } else 
    {
      playwhich=0;
    }
  }

  //display function
  void display() {

    //call the function to play sound
    playsound();
    hand();
    movepiece();

    //situate the images
    C.resize(0, 100);
    image(C, 150, 200);

    D.resize(0, 100);
    image(D, 350, 200);

    E.resize(0, 100);
    image(E, 550, 200);

    F.resize(0, 100);
    image(F, 100, 650);

    G.resize(0, 100);
    image(G, 200, 530);

    A.resize(0, 100);
    image(A, 300, 650);

    B.resize(0, 100);
    image(B, 400, 530);

    //display the questions
    Q1.display();

    //a button to submit answer    
    fill(255, 255, 255);
    rect(600, 140, 150, 50);
    textSize(28);
    fill(0, 0, 0);
    text("Restart", 620, 175);

    fill(255, 255, 255);
    rect(360, 140, 140, 50);
    textSize(28);
    fill(0, 0, 0);
    text("Exit", 400, 175);


    //if press submit tells you right or wrong and then to the next question
    if (mouseX<750&& mouseX>600&&mouseY>140&&mouseY<190&&mousePressed==true)
    {
      Q1=new questions();
      Q1.display();
      //reset the questions to null
      for (int i=0; i<5; i++)
      {
        answer[i]=null;
      }
    }

    //print the answers on to the question circles
    if (answer[0]!=null) {
      image(answer[0], 50, 400);
    } 
    if (answer[1]!=null) {
      image(answer[1], 200, 400);
    } 
    if (answer[2]!=null) {
      image(answer[2], 350, 400);
    } 
    if (answer[3]!=null) {
      image(answer[3], 500, 400);
    }
    if (answer[4]!=null) {
      image(answer[4], 650, 400);
    }
  }

  //for the use to move the pieces into the right questions
  void movepiece()
  {
    //if click on the image and press the key 1 to 5 you can put it in the right place
    if (handx<200 && handx>150 && handy<300 && handy>200 && clicked==true)
    {
      if (keyPressed) {
        if (key=='1')
        {
          answer[0]=C;
        } else if (key=='2')
        {
          answer[1]=C;
        } else if (key=='3')
        {
          answer[2]=C;
        } else if (key=='4')
        {
          answer[3]=C;
        } else if (key=='5')
        {
          answer[4]=C;
        }
      }
    } else if (handx<400 && handx>350 && handy<300 && handy>200 && clicked==true)
    {
      if (keyPressed) {
        if (key=='1')
        {
          answer[0]=D;
        } else if (key=='2')
        {
          answer[1]=D;
        } else if (key=='3')
        {
          answer[2]=D;
        } else if (key=='4')
        {
          answer[3]=D;
        } else if (key=='5')
        {
          answer[4]=D;
        }
      }
    } else if (handx<600 && handx>550 && handy<300 && handy>200 && clicked==true)
    {
      if (keyPressed) {
        if (key=='1')
        {
          answer[0]=E;
        } else if (key=='2')
        {
          answer[1]=E;
        } else if (key=='3')
        {
          answer[2]=E;
        } else if (key=='4')
        {
          answer[3]=E;
        } else if (key=='5')
        {
          answer[4]=E;
        }
      }
    } else if (handx<150 && handx>100 && handy<750 && handy>650 && clicked==true)
    {
      if (keyPressed) {
        if (key=='1')
        {
          answer[0]=F;
        } else if (key=='2')
        {
          answer[1]=F;
        } else if (key=='3')
        {
          answer[2]=F;
        } else if (key=='4')
        {
          answer[3]=F;
        } else if (key=='5')
        {
          answer[4]=F;
        }
      }
    } else if (handx<250 && handx>200 && handy<630 && handy>530 && clicked==true)
    {
      if (keyPressed) {
        if (key=='1')
        {
          answer[0]=G;
        } else if (key=='2')
        {
          answer[1]=G;
        } else if (key=='3')
        {
          answer[2]=G;
        } else if (key=='4')
        {
          answer[3]=G;
        } else if (key=='5')
        {
          answer[4]=G;
        }
      }
    } else if (handx<350 && handx>300 && handy<750 && handy>650 && clicked==true)
    {
      if (keyPressed) {
        if (key=='1')
        {
          answer[0]=A;
        } else if (key=='2')
        {
          answer[1]=A;
        } else if (key=='3')
        {
          answer[2]=A;
        } else if (key=='4')
        {
          answer[3]=A;
        } else if (key=='5')
        {
          answer[4]=A;
        }
      }
    } else if (handx<450 && handx>400 && handy<630 && handy>530 && clicked==true)
    {
      if (keyPressed) {
        if (key=='1')
        {
          answer[0]=B;
        } else if (key=='2')
        {
          answer[1]=B;
        } else if (key=='3')
        {
          answer[2]=B;
        } else if (key=='4')
        {
          answer[3]=B;
        } else if (key=='5')
        {
          answer[4]=B;
        }
      }
    }
  }

  //have the hand sprite move around
  void hand()
  {
    hand.resize(0, 90);
    handy=mouseY;
    image(hand, handx, handy);
  }
}

//function for the serial port
void serialEvent(Serial port) {

  //take the variables and use it in processing
  String s=port.readStringUntil('\n');
  s=trim(s);

  //split the num into each variables
  if (s!=null) {
    println(s);
    int values[]=int(split(s, ','));

    //use the lightsensor to control background color
    if (values[0]<500) {
      colorfbg=80;
    } else if (values[0]>=500&&values[0]<600)
    {
      colorfbg=100;
    } else if (values[0]>=600&&values[0]<650)
    {
      colorfbg=150;
    } else if (values[0]>=650&&values[0]<700)
    {
      colorfbg=200;
    } else if (values[0]>=700)
    {
      colorfbg=220;
    }

    //potentiometer to control hand's x
    handx=(int)map(values[2], 0, 1023, 0, width);
    //click the switch then tone make sound
    if (values[1]==1)
    {
      clicked=true;
    } else {
      clicked=false;
    }
  }
  //communicate from arduino
  port.write(playwhich+","+lightup+"\n");
}

//initiating the game
game Game1;

void setup() {
  //size background and the port
  size(800, 800);
  port = new Serial(this, Serial.list()[3], 9600);
  port.clear();
  port.bufferUntil('\n');

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

  Game1=new game();

  port.write(0);
}

//turn the background into a function
void backimage() {

  //text and situating the images 
  myfont = loadFont("Arial-Black-100.vlw");
  textFont(myfont);
  textSize(50);
  fill(165, 89, 241);
  text("Music and its order!", 150, 100);

  notes.resize(0, 100);
  image(notes, 20, 100);
  cdplay.resize(150, 0);
  image(cdplay, 500, 650);
  earphone.resize(0, 100);
  image(earphone, 600, 530);
}

//begin description page
void begin() {
  background(235, 245, 251);
  //text and situating the images 
  myfont = loadFont("Arial-Black-100.vlw");
  textFont(myfont);
  textSize(40);
  fill(165, 89, 241);
  text("Can you find the right note?", 100, 100);

  play.resize(0, 200);
  image(play, 300, 200);

  textSize(28);
  text("Press the mouse anywhere to start !!", 130, 600);

  textSize(28);
  text("Use the arduino panel to answer the question ", 80, 550);
  //press anywhere to start
  if (mousePressed) {
    state=1;
  }
}

//play page
void play()
{
  Game1.display();
  //if press submit tells you right or wrong and then to the next question
  if (mouseX<750&& mouseX>600&&mouseY>140&&mouseY<190&&mousePressed==true)
  {
    Game1=new game();
    Game1.display();
  }
  //if press exit then exit game
  if (mouseX<500&& mouseX>360&&mouseY>140&&mouseY<190&&mousePressed==true)
  {
    state=2;
  }
}

//end page to restart ir exit
void end() {
  background(0, 0, 0);
  textSize(50);
  fill(255, 255, 255);
  text("Game Over ", 250, 400);

  //press anywhere to exit the game
  if (mousePressed==true) {
    exit();
  }
}

//draw function
void draw()
{
  //use state machine to control the begin play and end
  if (state==0) {
    begin();
  } else if (state==1) {
    background(colorfbg);
    backimage();
    play();
  } else if (state==2)
  {
    end();
  }

  //check if answer correct
  for (int i=0; i<5; i++)
  {
    if (answer[i]==order[i])
    {
      //green led
      lightup=1;
    } else {
      //red led
      lightup=2;
    }
  }
}
