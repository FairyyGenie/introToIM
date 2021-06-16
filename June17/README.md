## Arduino Digital and Analog signaling
### Concept
In this project, I want to use analog input (light sensor) to control digital input(switches).  
I have 2 switches and 3 LED and 1 light sensor.
So I used these kinds of code to acheive it. 
```` 
if (sensorValue > 400)
  {
  if (buttonStateRed == HIGH)
    {
      digitalWrite(Redled, HIGH);
    }
  }
  ````
### Schematic and picture of the project and video link
### Problems
I still haven't find out how and why but suddenly my serial monitor does not respond to me anymore.  
I will keep trying to solve that problem.
