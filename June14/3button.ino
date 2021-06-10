/*
  name: Genie Hou
  date: 2021 June 14
  assignment: Arduino Puzzle led and switch
  version: 1
*/

//set up my inout and output constant numbers
const int pushButtonYellow = A2;
const int pushButtonBlue = A4;
const int pushButtonRed = A1;
const int Greenled = 10;
const int Redled = 3;
const int Blueled = 7;

// the setup function runs once when you press reset or power the board
void setup() {

  //initiate communications at 9600 bits per second
  Serial.begin(9600);

  //set up the inputs
  pinMode(pushButtonYellow, INPUT);
  pinMode(pushButtonBlue, INPUT);
  pinMode(pushButtonRed, INPUT);

  //set up the outputs
  pinMode(Greenled, OUTPUT);
  pinMode(Redled, OUTPUT);
  pinMode(Blueled, OUTPUT);
}

// the loop function runs over and over again forever
void loop() {

  //the int keeping track of High->1 and Low->0
  int buttonStateYellow = digitalRead(pushButtonYellow);
  int buttonStateBlue = digitalRead(pushButtonBlue);
  int buttonStateRed = digitalRead(pushButtonRed);

  //this is where the puzzle starts
  //when press blue and yellow switch together green light light up
  //two buttons
  if (buttonStateBlue + buttonStateRed + buttonStateYellow == 2)
  {
    if (buttonStateBlue == HIGH && buttonStateYellow == HIGH)
    {
      digitalWrite(Greenled, HIGH);
    }
    else {
      digitalWrite(Greenled, LOW);
    }
    //when press yellow and red together blue light light up
    if (buttonStateYellow == HIGH && buttonStateRed == HIGH)
    {
      digitalWrite(Blueled, HIGH);
    }
    else {
      digitalWrite(Blueled, LOW);
    }
    //when press blue and red together red light light up
    if (buttonStateBlue == HIGH && buttonStateRed == HIGH)
    {
      digitalWrite(Redled, HIGH);

    }
    else {
      digitalWrite(Redled, LOW);
    }
  }
  else {//one button
    //when press the blue button the green and red led lights light up
    if (buttonStateBlue == HIGH) {
      digitalWrite(Redled, HIGH);
      digitalWrite(Greenled, HIGH);
    }
    else {
      digitalWrite(Redled, LOW);
      digitalWrite(Greenled, LOW);
    }
    //when press yellow all three light up
    if (buttonStateYellow == HIGH)
    {
      digitalWrite(Redled, HIGH);
      digitalWrite(Greenled, HIGH);
      digitalWrite(Blueled, HIGH);
    }
    else {
      digitalWrite(Redled, LOW);
      digitalWrite(Greenled, LOW);
      digitalWrite(Blueled, LOW);
    }
    //when press red switch the green and blue lights light up
    if (buttonStateRed == HIGH)
    {
      digitalWrite(Greenled, HIGH);
      digitalWrite(Blueled, HIGH);
    }
    else {
      digitalWrite(Greenled, LOW);
      digitalWrite(Blueled, LOW);
    }
  }
}
