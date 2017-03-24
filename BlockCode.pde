import processing.serial.*;
import java.util.ArrayList;

Serial myPort;
PrintWriter output;
ButtonCollection buttonCollection = new ButtonCollection();

MenuButton exitButton;
MenuButton buildButton;
MenuButton resetButton;

Canvas canvas;

MainController mc = new MainController(buttonCollection);
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

  ArrayList<String> outputStrings = new ArrayList<String>();
  //For
  outputStrings.add("for(int i = 0; i < ");
  outputStrings.add("; i++)");
  buttonCollection.addButton(new Button(width/100, height/10, "For", 1, outputStrings));
  outputStrings.clear();
  //While
  buttonCollection.addButton(new Button(width/100, height/10 + 50, "While", 1, outputStrings));
  outputStrings.clear();
  //Light
  buttonCollection.addButton(new Button(width/100, height/10 + 100, "If Light Sensor", 1, outputStrings));
  outputStrings.clear();
  //Temp
  buttonCollection.addButton(new Button(width/100, height/10 + 150, "If Temp Sensor", 1, outputStrings));
  outputStrings.clear();
  //acc-x
  buttonCollection.addButton(new Button(width/100, height/10 + 200, "If acc-x", 1, outputStrings));
  outputStrings.clear();
  //acc-y
  buttonCollection.addButton(new Button(width/100, height/10 + 250, "If acc-y", 1, outputStrings));
  outputStrings.clear();
  //acc-z
  buttonCollection.addButton(new Button(width/100, height/10 + 300, "If acc-z", 1, outputStrings));
  outputStrings.clear();
  //Button click
  buttonCollection.addButton(new Button(width/100, height/10 + 350, "If Button Click", 1, outputStrings));
  outputStrings.clear();
  //If
  buttonCollection.addButton(new Button(width/100, height/10 + 400, "If", 1, outputStrings));
  outputStrings.clear();
  //LED On
  outputStrings.add("EngduinoLEDS.setLED(");
  outputStrings.add(",ON);");
  buttonCollection.addButton(new Button(width/100, height/10 + 450, "LED # on", outputStrings));
  outputStrings.clear();
  //LED Off
  buttonCollection.addButton(new Button(width/100, height/10 + 500, "LED # off", outputStrings));
  outputStrings.clear();
  //Pause
  buttonCollection.addButton(new Button(width/100, height/10 + 550, "Pause for:", outputStrings));
  outputStrings.clear();
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
  output.close();
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
  mc.keyPressedHandler();
}