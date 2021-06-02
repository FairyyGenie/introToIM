/*
name: Genie Hou
 date: 2021 June 3
 assignment: Transformation project
 interactive: Press the Mouse!!
 concept: the flowers is a class, and to make it spin I used tranformation, and the flowers and the circle will spin when the mouse is pressed
 version: 2
 */

// a function for the shape of the flower
void floshape(float x, float y)
{
  //use 5 circle to draw a flower
  ellipse(x+30, y, 30, 20);
  ellipse(x-30, y, 30, 20);
  ellipse(x, y+30, 20, 30);
  ellipse(x, y-30, 20, 30);
  ellipse(x, y, 30, 30);
}//end of function

//class of flower
class flower
{
  color g=color(219, 236, 221);//soft green
  color p=color(232, 219, 236);//soft pink
  color r=color(237, 218, 218);//soft red
  //float for x, y 
  //and it is stopped at first but when mouse pressed it will start rotating
  float xflower;
  float yflower;

  //constructor
  flower()
  {
    //flowers will show up at random places
    xflower=random(650);
    yflower=random(650);
  }

  //display the shape
  void display()
  {
    //put all colors into a array of colors
    color[] forflower=new color[3];
    forflower[0]=g;
    forflower[1]=p;
    forflower[2]=r;

    //start of shape
    pushMatrix();
    //so the flowers will kepp on changing the color
    int i=0;
    if (mousePressed==true)
    {
      fill(forflower[i]);
      i+=1;
      if (i==3)
      {
        i=0;
      }
    }
    
    //transformation start
    translate(xflower, yflower);
    if (mousePressed==true)
    {
     rotate(45);
    }
    floshape(0, 0);
    popMatrix();
    //end of shape
  }
}//end of class

//set t for the noise
float t =0;

//initiating objects
flower flo1, flo3, flo2, flo4;

//set up function
void setup()
{
  //size 
  size(700, 700);
  smooth();
  //creating objects
  flo1=new flower();
  flo2=new flower();
  flo3=new flower();
  flo4=new flower();
}

//draw function
void draw()
{
  //background and circle color
  background(53, 118, 201);
  fill(235, 219, 236);
  //so if press mouse the circle go around
  if (mousePressed)
  {
    t=t+0.3;
  }
  //y as noise value
  float y=noise(t);
  //for the cirlce to move on y axis
  y=map(y, 0, 1, 0, height);
  ellipse(width/2, y, 35, 35);
  
  //display the flowers
  flo1.display();
  flo2.display();
  flo3.display();
  flo4.display();
}
