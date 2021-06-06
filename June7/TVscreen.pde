/*
name: Genie Hou
 date: 2021 June 7
 assignment: Pixel and Image
 concept: this is a broken TV screen and you will see friends playing 
 TV screen is made from pixels and noise
 interactive: you will see image when pressed mouse
 version: 2.5
 */

//set up photos and floats and colors variables
PImage photo;
//2 nums for to sets of perlin noise
float num=0;
float num2=0;
//colors for the lines
color white=color(255, 255, 255);
color grey=color(175, 178, 182);

//set up function
void setup()
{
  //loadimage
  photo=loadImage("/Users/geniehou/Downloads/friends.jpeg");
  size(600, 400);
  background(grey);
  //slow down the frame Rate
  frameRate(20);
}

//buzzscreen function for when the mouse is not pressed
void buzzscreen()
{
  //manipulate pixels
  loadPixels();
  //for the background to be pixels flickering
  for (int a=0; a<pixels.length; a++)
  {
    pixels[a]=color(random(100, 200), random(100, 200), random(100, 200));
  }
  updatePixels();

  //use noise to randomly create the blacklines
  pushMatrix();
  num=num+0.5;
  strokeWeight(2);
  stroke(0, 0, 0);
  float i=noise(num)*height;
  line(0, i, width, i);
  popMatrix();

  //whitelines pop up randomly
  pushMatrix();
  num2=num2+0.2;
  stroke(white);
  float b=noise(num2)*height;
  line(0, b, width, b);
  popMatrix();
}

//draw function
void draw()
{
  //if press mouse than TV show 
  if (mousePressed==false)
  {
    buzzscreen();
  } else {
    image(photo, 0, 0, 600, 400);
  }
}
