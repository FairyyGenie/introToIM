/*
  name: Genie Hou
  date: 2021 June 21
  assignment: Music Instrument Creation
  concept: using the potentiometer and the switch 
  // to create different frequency and so different ton
  version: 1
*/

// set up the pin numbers
const int knobpin = A0;
const int switchpin = A3;

//set up the input output modes and the serial readings
void setup() {
  //read serials
  Serial.begin(9600);

  // put your setup code here, to run once:
  pinMode(knobpin, INPUT);
  pinMode(switchpin, INPUT);

}

void loop() {
  // put your main code here, to run repeatedly:
  // set up integer for the use of frequency values
  int knobvalue = analogRead(knobpin);
  int switchstate = digitalRead(switchpin);

  //print out serials in the monitor so I can see the numbers
  Serial.println(knobvalue);

  //if the switch is not pressed then the tone is lower frequency
  if (switchstate == 0)
  {
    //map the potentiometer value to be frequency
    knobvalue = map(knobvalue, 0, 1023, 31, 2217);
    tone(8, knobvalue, 250);
    delay(300);
    noTone(8);
  }
  else if (switchstate == 1)// if the switch is pressed then the tone is higher frequency
  {
    //map the potentiometer value to be frequency
    knobvalue = map(knobvalue, 0, 1023, 2217, 4978);
    tone(8, knobvalue, 250);
    delay(300);
    noTone(8);
  }
}
