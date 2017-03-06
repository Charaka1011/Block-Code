import processing.serial.*;
import java.util.ArrayList;

Serial myPort;


ButtonCollection buttons = new ButtonCollection();


MenuButton exitButton;
MenuButton buildButton;
MenuButton resetButton;



Canvas canvas;


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

  buildButton = new MenuButton(10, 1, buildImg);
  resetButton = new MenuButton( width/25 + 20, 1, resetImg);
  exitButton = new MenuButton(width-(width/25), 1, exitImg);
  
  int cHeight = height-((height/10)+(height/14));
  canvas = new Canvas(width/3, height/14, width-(width/3), cHeight, (int)((float)(3/2)*(height/17))); 
  //Values for canvas are worked out from MainController.drawCanvas() and ButtonHeight
  //Could be better to have variables rather than magic numbers


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
  mc.blink();
}

void mouseReleased() {
  mc.mouseReleasedController();
}

void mouseDragged(){
   mc.mouseDraggedController();
}

void mousePressed(){
  mc.mousePressedController();
}  

void keyPressed(){
  if(key>='0'&& key <= '9'||key == BACKSPACE || key==DELETE){
    mc.keyPressedHandler();
  }
}