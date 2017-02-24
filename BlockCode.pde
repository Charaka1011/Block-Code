import processing.serial.*;
import java.util.ArrayList;

Serial myPort;
ButtonCollection buttons = new ButtonCollection();
MenuButton exitButton;
MenuButton buildButton;
MenuButton resetButton;
//variables needed for the listeners inside the controller class
int lockedIndex = -1;
boolean firstPress = true;
//
PImage buildImg, resetImg, exitImg;
Canvas canvas;
MainController mc = new MainController(buttons);

void setup() {
  fullScreen();
  buildImg = loadImage("Build.png");
  resetImg = loadImage("Reset.png");
  exitImg = loadImage("Exit.png");
  buildButton = new MenuButton(10, 1, buildImg);
  resetButton = new MenuButton( width/25 + 20, 1, resetImg);
  exitButton = new MenuButton(width-(width/25), 1, exitImg);
  buttons.addButton(new Button(width/100, height/10,"For Loop", true));
  buttons.addButton(new Button(width/100,height/10 + 50, "While Loop", true));
  buttons.addButton(new Button(width/100,height/10 + 100, "If Selection", true));
  int cHeight = height-((height/10)+(height/14));
  canvas = new Canvas(width/3, height/14, width-(width/3), cHeight, (cHeight/80)); //PLACEHOLDER: 80 is bWidth * 2
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