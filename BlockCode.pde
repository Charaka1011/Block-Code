import processing.serial.*;
import java.util.ArrayList;

Serial myPort;
ButtonCollection buttons = new ButtonCollection();
<<<<<<< HEAD
=======
//variables needed for the listeners inside the controller class
>>>>>>> master
int lockedIndex = -1;
boolean firstPress = true;
//
PImage buildImg, resetImg, exitImg;
MainController mc = new MainController(buttons);

void setup() {
  fullScreen();
<<<<<<< HEAD
  buttons.addButton(new Button(10, 10, "For Loop"));
  buttons.addButton(new Button(10, 60, "While Loop"));
  buttons.addButton(new Button(10, 110, "If Selection"));
=======
  buildImg = loadImage("Build.png");
  resetImg = loadImage("Reset.png");
  exitImg = loadImage("Exit.png");
  buttons.addButton(new Button(10, 80,"For Loop"));
  buttons.addButton(new Button(10, 140, "While Loop"));
  buttons.addButton(new Button(10, 200, "If Selection"));
>>>>>>> master
}

void draw() {

  fill(34, 49, 63);
  noStroke();
  background(103, 128, 159);
  background(52, 73, 94);
  rect(0, 0, width/3, height);
<<<<<<< HEAD
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
=======
  mc.drawButtons();
  mc.drawCanvas();
>>>>>>> master
}