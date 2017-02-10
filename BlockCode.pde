import processing.serial.*;
import java.util.ArrayList;

Serial myPort;
ButtonCollection buttons = new ButtonCollection();
//variables needed for the listeners inside the controller class
int lockedIndex = -1;
boolean firstPress = true;
//
PImage buildImg, resetImg, exitImg;
MainController mc = new MainController(buttons);

void setup() {
  fullScreen();
  buildImg = loadImage("Build.png");
  resetImg = loadImage("Reset.png");
  exitImg = loadImage("Exit.png");

  buttons.addButton(new Button(width/100, height/10,"For Loop"));
  buttons.addButton(new Button(width/100,height/10 + 50, "While Loop"));
  buttons.addButton(new Button(width/100,height/10 + 100, "If Selection"));
}

void draw() {

  fill(34, 49, 63);
  noStroke();
  background(103, 128, 159);
  background(52, 73, 94);
  rect(0, 0, width/3, height);
  mc.drawButtons();
  mc.drawCanvas();
}