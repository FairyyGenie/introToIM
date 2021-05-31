/*
name: Genie Hou
 date: 2021 May 31
 assignment: interactive art piece !
 version: 2.5
 */

//set the initial position
float x1=50;
float y1=50;
float x2=350;
float y2=350;

//set up for the size and background color
void setup()
{
  //size and background color
  size(600, 600);
  background(255, 255, 255);

  //slow down frame rate
  frameRate(10);
}

//set the boundary of the circle box
void circlebox()
{
  noFill();
  ellipse(x1, y1, 75, 75);
}

//set the boundary of the circle box
void rectbox()
{
  noFill();
  rect(x2, y2, 75, 75);
}

//the art stage one function
void artstage1()
{
  //variable generate random colors
  int c1=round(random(256));
  int c2=round(random(256));
  int c3=round(random(256));

  //draw the lines
  for (int i=0; i<600; i+=10)
  {
    //set lines color and width
    strokeWeight(2);
    stroke(#ADD8E6);
    line(i, 0, i, 600);
  }

  //draw the rect horizontal
  for (int j=0; j<600; j+=30)
  {
    //color and rects
    stroke(#000000);
    fill(255, 228, 225);
    rect(j, 300, 30, 30);
  }

  //draw the rect vertical
  for (int r=0; r<600; r+=30)
  {
    //color and rects
    stroke(#000000);
    fill(255, 218, 185);
    rect(270, r, 30, 30);
  }

  //draw circles
  fill(c1, c2, c3);
  ellipse(40, 50, 70, 80);

  fill(c2, c3, c1);
  ellipse(500, 50, 70, 70);

  fill(c1, c3, c2);
  ellipse(40, 400, 70, 70);

  fill(c3, c2, c1);
  ellipse(500, 400, 70, 80);

  //text
  textSize(32);
  fill(0, 0, 0);
  text("This is an interactive art piece", 200, 150);

  //text
  textSize(32);
  fill(0, 0, 0);
  text("This is an interactive art piece", 20, 450);
}

//the art stage two function
void artstage2()
{
  //variales for random colors
  int b1=round(random(256));
  int b2=round(random(256));
  int b3=round(random(256));

  //while loop for creation of the circles
  int num=0;
  while (num<600)
  {
    fill(b1, b2, b3);
    ellipse(num+100, num+100, 70, 90);
    num+=30;
  }

  //for loop to draw the lines
  int num2=0;
  for (int a=0; a<200; a+=20)
  {
    stroke(188, 143, 143);
    line(600, a, a, 600);
  }

  //text
  textSize(32);
  fill(0, 128, 128);
  text("This is an interactive art piece", 20, 30);
}

//the art piece logic when pressing 
//if drag the circle into the circle then it opens art stage 1
//if frag rect into rect than opens art stage 2
void draw()
{

  //when mouse pressed it is the circle mode
  //when not the rect
  if (mousePressed==true)
  {
    background(255, 255, 255);
    circlebox();
    rectbox();

    //color and position of the circle
    fill(159, 226, 191);
    ellipse(mouseX, mouseY, 75, 75);

    // if circle in circle call art stage one
    if (dist(mouseX, mouseY, x1, y1)<20)
    {
      artstage1();
    }
  } else
  {
    background(251, 238, 230);
    circlebox();
    rectbox();

    //color and postion of the rectangle
    fill(204, 204, 255);
    rect(mouseX, mouseY, 75, 75);

    //when rect in rect call art satge 2
    if ((mouseX>x2)&&(mouseX<x2+20)&&(mouseY>y2)&&(mouseY<y2+20))
    {
      artstage2();
    }
  }
}
