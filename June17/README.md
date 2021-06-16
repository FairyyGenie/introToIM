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
Link to the video: https://youtu.be/IP8CkGEJq54


<img src="https://github.com/FairyyGenie/introToIM/blob/main/June17/June17_1.jpg" width="300" height="400">
<img src="https://github.com/FairyyGenie/introToIM/blob/main/June17/June17_2.jpg" width="500" height="300">
<img src="https://github.com/FairyyGenie/introToIM/blob/main/June17/June_17_Arduino.png" width="700" height="500">. 

### Problems
I still haven't find out how and why but suddenly my serial monitor does not respond to me anymore.  
I will keep trying to solve that problem.
