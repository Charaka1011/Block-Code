import processing.serial.*;
import java.util.ArrayList;

Serial myPort;


ButtonCollection buttons = new ButtonCollection();
MainController mc = new MainController(buttons);
MainView mv = new MainView();


//variables needed for the listeners inside the controller class
int lockedIndex = -1;
boolean firstPress = true;


PImage buildImg, resetImg, exitImg;


void setup() {
  fullScreen();
  buildImg = loadImage("Build.png");
  resetImg = loadImage("Reset.png");
  exitImg = loadImage("Exit.png");

  buttons.addButton(new Button(width/100, height/10, "For Loop", 1));
  buttons.addButton(new Button(width/100, height/10 + 100, "While Loop", 1));
  buttons.addButton(new Button(width/100, height/10 + 200, "If Selection", 1));
  buttons.addButton(new Button(width/100, height/10 + 300, "Turn on LEDs"));
  buttons.addButton(new Button(width/100, height/10 + 350, "Turn off LEDs"));
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