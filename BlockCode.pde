import processing.serial.*;
import java.util.ArrayList;

Serial myPort;
ButtonCollection buttons = new ButtonCollection();
int lockedIndex = -1;
boolean firstPress = true;

void setup() {
  printArray(Serial.list());
  //myPort = new Serial(this, Serial.list()[0], 9600);
  //size(900, 500);
  fullScreen();
  buttons.addButton(new Button(10, 10, "For Loop"));
  buttons.addButton(new Button(10, 60, "While Loop"));
  buttons.addButton(new Button(10, 110, "If Selection"));
}

void draw() {
  fill(34, 49, 63);
  noStroke();
  background(52, 73, 94);
  rect(0, 0, width/3, height);
  for (Button b : buttons.getCollection())
  {
    b.drawButton();
  }
}

void mouseReleased()
{
  firstPress = true;
  if(lockedIndex >= 0)
  {
    Button b = buttons.getButton(lockedIndex);
    if(mouseX>(width/3))
    {
      b.posX = ((width/3) +10);
    }
    else
    {
      b.posX = b.origX;
      b.posY = b.origY;
    }
  }
  lockedIndex = -1;
}

void mouseDragged()
{
  if (firstPress)
  {
    Button b = buttons.overButton();
    if(b != null)
    {
     lockedIndex = buttons.getIndex(b); 
     b.posX = mouseX-b.width/2;
     b.posY = mouseY-b.height/2;
    }
  } else
  {
    if(lockedIndex >= 0)
    {
      Button b = buttons.getButton(lockedIndex);
      b.posX = mouseX-b.width/2;
      b.posY = mouseY-b.height/2;
    }
  }  
  firstPress = false;
}