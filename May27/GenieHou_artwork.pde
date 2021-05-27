/*
name: Genie Hou
 date: 2021 May 27
 assignment: art!
 version: 1
 */

//the circle showsup randomly
int x=round(random(550));
int y=round(random(550));

//set up function for the size and background color
void setup()
{
  background(255, 255, 255);
  size(600, 600);
}

//draw function for the art
void draw()
{
  //while loop for the random pattern art
  int i=0;
  while (i<600)
  {
    //draw line
    line(0, i, 600, i);

    //x increasing
    x=x+i;
    //color the circle
    fill(248, 152, 128);
    //draw the circles
    ellipse(x, y, 20, 20);

    //i increase by 8
    i=i+8;
  }

  //draw rectangle
  for (int j=0; j<600; j=j+20)
  {
    //color the rect
    fill(250, 200, 152);
    //draw the rects
    rect(j, j, 20, 20);
  }
  
  //a for the y coordinates for the second set of rects
  int a=0;
  //for the other half of the rects
  for (int p=600; p>0; p=p-20)
  {
    //color the rect
    fill(204, 204, 255);
    //draw the rects
    rect(p, a, 20, 20);
    a=a+20;
  }
}
