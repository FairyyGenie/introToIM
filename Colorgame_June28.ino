/*
  name: Genie Hou
  date: 2021 June 28
  assignment: Color communication game
  Concepts: the communications between arduino and processing using switches
  version: 1
*/

//set up my inout and output constant numbers
const int ButtonYellow = A2;
const int ButtonBlue = A4;
const int ButtonRed = A1;
const int ButtonGreen = A0;

void setup() {
  // put your setup code here, to run once:
  //initiate communications at 9600 bits per second
  Serial.begin(9600);

  //set up the inputs
  pinMode(ButtonYellow, INPUT);
  pinMode(ButtonBlue, INPUT);
  pinMode(ButtonRed, INPUT);
  pinMode(ButtonGreen, INPUT);

}

void loop() {
  // put your main code here, to run repeatedly:
  int blue = digitalRead(ButtonBlue);
  delay(1);
  int yellow = digitalRead(ButtonYellow);
  delay(1);
  int red = digitalRead(ButtonRed);
  delay(1);
  int green = digitalRead(ButtonGreen);
  delay(1);

  //printing the serial numbers
  Serial.print(blue);
  Serial.print(',');
  Serial.print(yellow);
  Serial.print(',');
  Serial.print(red);
  Serial.print(',');
  Serial.println(green);
}

/*
//procesing starts here
//arduino communications set up
import processing.serial.*;
Serial myPort;

//set up the colors numbers
color g = color(12, 198, 41);
color r =color(255, 36, 36);
color y=color(255, 248, 36);
color b=color(12, 142, 198);

// set up the int from switches
int rednum;
int greennum;
int bluenum;
int yellownum;

//score
int score=0;

//set up string array and colors array
String[] words={"purple", "green", "blue", "yellow", "red", "pink"};
color[] colors={g, y, r, b};

//game class
class game
{
  //variables
  int num;
  int num2;
  String word;
  color using;

  //constructor
  game() {
    num=round(random(0, 5));
    num2=round(random(0, 3));
    word= words[num];
    using=colors[num2];
  }

  void display()
  {
    //display on screen the text of the game and the score
    textSize(70);
    fill(using);
    text(word, 150, 230);

    textSize(32);
    fill(0, 0, 0);
    text("score", 300, 150);
    text(score, 400, 150);

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
  }
}
game game1;

//set up function
void setup()
{
  //set up size and bg color
  size(500, 500);
  background(238, 242, 255);

  //set up port communications
  printArray(Serial.list());
  String portname=Serial.list()[3];
  println(portname);
  myPort = new Serial(this, portname, 9600);
  myPort.clear();
  myPort.bufferUntil('\n');

  //initiate game
  game1=new game();
}

//draw function
void draw()
{
  game1.display();
  //if pressed the buttons then a new game
  if (rednum==1||greennum==1||yellownum==1||bluenum==1)
  {
    background(238, 242, 255);
    game1=new game();
  }
}

//Serial communications
void serialEvent(Serial myPort) {

  //take the variables and use it in processing
  String s=myPort.readStringUntil('\n');
  s=trim(s);

  //split the num into each variables
  if (s!=null) {
    println(s);
    int values[]=int(split(s, ','));
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
  }
}
 */
