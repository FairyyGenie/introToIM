/*
  name: Genie Hou
  date: 2021 June 17
  assignment: Arduino analog and digital
  version: 1.5
*/

//set up my inout and output constant numbers
const int pushButtonYellow = A2;
const int lightdet = A0;
const int pushButtonRed = A4;
const int Greenled = 4;
const int Redled = 11;
const int Blueled = 7;

//set up function
void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);

  //input for the redbswitch
  pinMode(A4, INPUT);
  //input for the light detector
  pinMode(A0, INPUT);
  //input for the yellow detector
  pinMode(A2, INPUT);
  //output for red led
  pinMode(11, OUTPUT);
  //output for green led
  pinMode(4, OUTPUT);
  //output for blue led
  pinMode(7, OUTPUT);

}

void loop() {
  // put your main code here, to run repeatedly:
  //value of the light
  int sensorValue = analogRead(lightdet);
  //the int keeping track of High->1 and Low->0
  int buttonStateYellow = digitalRead(pushButtonYellow);
  int buttonStateRed = digitalRead(pushButtonRed);

  //use the light sensor to activate the botton control
  if (sensorValue > 400)
  {
    digitalWrite(Blueled, LOW);
    //if light value> 500 red light shine
    digitalWrite(Redled, HIGH);
    //under sensor>500 this is button red open red
    if (buttonStateRed == HIGH)
    {
      digitalWrite(Redled, HIGH);
    }
    else {
      digitalWrite(Redled, LOW);
    }
    //under sensor>500 button yellow open green light
    if (buttonStateYellow == HIGH)
    {
      digitalWrite(Greenled, HIGH);
    }
    else {
      digitalWrite(Greenled, LOW );
    }

  }
  else {//if light value<500 Blue led light
    digitalWrite(Blueled, HIGH);
    digitalWrite(Redled, LOW);
    //under sensor<500 red button open red and green light
    if (buttonStateRed == HIGH)
    {
      digitalWrite(Redled, HIGH);
      digitalWrite(Greenled, HIGH);
    }
    else {
      digitalWrite(Redled, LOW);
      digitalWrite(Greenled, LOW);
    }
    //under sesor<500 the yellow button open red led
    if (buttonStateYellow == HIGH)
    {
      digitalWrite(Redled, HIGH);
    }
    else {
      digitalWrite(Redled, LOW );
    }
  }
}
