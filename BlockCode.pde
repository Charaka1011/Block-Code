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
  buttons.addButton(new Button(10, 80,"For Loop"));
  buttons.addButton(new Button(10, 140, "While Loop"));
  buttons.addButton(new Button(10, 200, "If Selection"));
}

void draw() {

  fill(34, 49, 63);
  noStroke();
  background(103, 128, 159);
  background(52, 73, 94);
  rect(0, 0, width/3, height);
  mc.drawButtons();
  fill(8, 22, 37);
  noStroke();
  rect(0, 0, width, height/14);
  image(buildImg, width-170, 1, width/25, height/15);
  image(resetImg, width - 110, 1, width/25, height/15);
  image(exitImg, width-50, 1, width/25, height/15);
  fill(0);
  rect(0,height - (height/10), width, height/10);
  fill(255);
  textSize(height/40);
  textAlign(LEFT);
  text("Build terminal: ", 5,20+ height - (height/10));
}