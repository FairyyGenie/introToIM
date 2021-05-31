/*
name: Genie Hou
 date: 2021 June 1
 assignment: OOP project!
 version: 1
 */

//The star shape function is from processing example
// a star function from processing example
void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}


//the class of the star
//I want to create one with stars in the night skys
class star
{
  float speed;
  float x=random(600);
  float y=random(600);
  color c;

  //constructor
  star()
  {
    c=color(#FFF52E);
    speed=2.5;
  }

  //the display of star
  void display()
  {
    fill(c);
    star(x, y, 30, 50, 5);
  }

  //the star fly around
  void flying()
  {
    //bouncing back from the side
    if ((x<15)||(x>width-15))
    {
      speed=-speed;
    }

    if ((y<15)||(y>height-15))
    {
      speed=-speed;
    }

    x=x+speed;
    y=y+speed;
  }
}

//initiating the object
star mystar;
star star2;
//the set up of canva;
void setup()
{
  size(600, 600);
  mystar=new star();
  star2=new star();
  background(25, 7, 115);
}

//draw function
void draw()
{
  background(25, 7, 115);
  //fly and display
  mystar.flying();
  mystar.display();

  star2.flying();
  star2.display();
}
