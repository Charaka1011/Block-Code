import processing.serial.*;
import java.util.ArrayList;

Serial myPort;


ButtonCollection buttons = new ButtonCollection();
<<<<<<< HEAD
MenuButton exitButton;
MenuButton buildButton;
MenuButton resetButton;
=======
MainController mc = new MainController(buttons);
MainView mv = new MainView();


>>>>>>> fc64b03c85c93f91da71387082f278b8239038d1
//variables needed for the listeners inside the controller class
int lockedIndex = -1;
boolean firstPress = true;


PImage buildImg, resetImg, exitImg;


void setup() {
  fullScreen();
  buildImg = loadImage("Build.png");
  resetImg = loadImage("Reset.png");
  exitImg = loadImage("Exit.png");
<<<<<<< HEAD
  buildButton = new MenuButton(10, 1, buildImg);
  resetButton = new MenuButton( width/25 + 20, 1, resetImg);
  exitButton = new MenuButton(width-(width/25), 1, exitImg);
  buttons.addButton(new Button(width/100, height/10,"For Loop", true));
  buttons.addButton(new Button(width/100,height/10 + 50, "While Loop", true));
  buttons.addButton(new Button(width/100,height/10 + 100, "If Selection", true));
  int cHeight = height-((height/10)+(height/14));
  canvas = new Canvas(width/3, height/14, width-(width/3), cHeight, (int)((float)(3/2)*(height/17))); 
  //Values for canvas are worked out from MainController.drawCanvas() and ButtonHeight
  //Could be better to have variables rather than magic numbers
=======

  buttons.addButton(new Button(width/100, height/10, "For Loop", 1));
  buttons.addButton(new Button(width/100, height/10 + 100, "While Loop", 1));
  buttons.addButton(new Button(width/100, height/10 + 200, "If Selection", 1));
  buttons.addButton(new Button(width/100, height/10 + 300, "Turn on LEDs"));
  buttons.addButton(new Button(width/100, height/10 + 350, "Turn off LEDs"));
>>>>>>> fc64b03c85c93f91da71387082f278b8239038d1
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