import controlP5.*;
import processing.serial.*;
import java.util.ArrayList;

Serial myPort;
ArrayList<Button> buttons = new ArrayList<Button>();
int lockedIndex = -1;
boolean firstPress = true;
PImage buildImg, resetImg, exitImg;




void setup() {
  printArray(Serial.list());
  //myPort = new Serial(this, Serial.list()[0], 9600);
  //size(900, 500);
  fullScreen();
  buildImg = loadImage("Build.png");
  resetImg = loadImage("Reset.png");
  exitImg = loadImage("Exit.png");
  buttons.add(new Button(10, 180, "For Loop"));
  buttons.add(new Button(10, 230, "While Loop"));
  buttons.add(new Button(10, 280, "If Selection"));
  
}

void draw() {
  fill(52, 73, 94);
  noStroke();
  background(103, 128, 159);
  rect(0, 0, width/3, height);
  fill(34, 49, 63);
  rect(0, 0, width, height/15);
  image(buildImg, 20, 10, 110, 110);
  image(resetImg, 170, 10, 110, 110);
  image(exitImg, 3700, 10, 110, 110);
  fill(0);
  rect(0, 1729, width, height/5);
  fill(255);
  textSize(32);
  text("Build terminal: ", 145, 1750);
  
  
  for (Button b : buttons)
  {
    b.drawButton();
  }
}

void mouseReleased()
{
  firstPress = true;
  if(lockedIndex >= 0)
  {
    Button b = buttons.get(lockedIndex);
    if(mouseX>(width/3))
    {
      b.posX = ((width/3) +10);
    }
    else
    {
      b.posX = 10; 
    }
  }
  lockedIndex = -1;
}

void mouseDragged()
{
  if (firstPress)
  {
    for (Button b : buttons)
    {
      if (b.overBlock())
      {
        lockedIndex = buttons.indexOf(b);
        b.posX = mouseX-b.width/2;
        b.posY = mouseY-b.height/2;
        break;
      }
    }
  } else
  {
    if(lockedIndex >= 0)
    {
      Button b = buttons.get(lockedIndex);
      b.posX = mouseX-b.width/2;
      b.posY = mouseY-b.height/2;
    }
  }  
  firstPress = false;
}