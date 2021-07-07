/*
  name: Genie Hou
  date: 2021 July 8
  Arduino code
  Midterm Project: Music game + Arduino
  concept: questions asking you to put the right notes in the right place
  interactive: Arduino bread board to control the game
  version: 3 --add the led to signal right and wrong
*/

#include "pitches.h"

//set up the ports const integers
const int Button = A4;
const int poten = A1;
const int light = A0;
const int toneport = 10;
const int redled = 6;
const int greenled = 3;

//add notes into a array
int notes[] = {
  NOTE_C5, NOTE_D5, NOTE_E5, NOTE_F5, NOTE_G5, NOTE_A5, NOTE_B5
};

void setup() {
  // put your setup code here, to run once:
  //serial communication speed
  Serial.begin(9600);
  Serial.println("0,0,0");

  //input output
  pinMode(Button, INPUT);
  pinMode(light, INPUT);
  pinMode(poten, INPUT);
  pinMode(toneport, OUTPUT);
  pinMode(greenled, OUTPUT);
  pinMode(redled, OUTPUT);


}

void loop() {
  //have the processing send something first then start
  if (Serial.available() > 0) {

    //to know which tone to play
    int playwhich = Serial.parseInt();
    int whichlight = Serial.parseInt();

    if (playwhich == 1)
    {
      tone(toneport, notes[0], 300);
    }
    else if (playwhich == 2)
    {
      tone(toneport, notes[1], 300);
    }
    else if (playwhich == 3)
    {
      tone(toneport, notes[2], 300);
    }
    else if (playwhich == 4)
    {
      tone(toneport, notes[3], 300);
    }
    else if (playwhich == 5)
    {
      tone(toneport, notes[4], 300);
    }
    else if (playwhich == 6)
    {
      tone(toneport, notes[5], 300);
    }
    else if (playwhich == 7)
    {
      tone(toneport, notes[6], 300);
    }
    else if (playwhich == 0)
    {
      noTone(toneport);
    }

    //ligth up led according to answer right and wrong
    if (whichlight == 1)
    {
      digitalWrite(greenled, HIGH);
      digitalWrite(redled, LOW);
    }
    else if (whichlight == 2) {
      digitalWrite(redled, HIGH);
      digitalWrite(greenled, LOW);
    }
    //int of the sensors
    int lightsense = analogRead(light);
    delay(1);
    int buttonnum = digitalRead(Button);
    delay(1);
    int potnum = analogRead(poten);
    delay(1);

    // put your main code here, to run repeatedly:
    Serial.print(lightsense);
    Serial.print(',');
    Serial.print(buttonnum);
    Serial.print(',');
    Serial.println(potnum);
  }
}
