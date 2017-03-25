import processing.serial.*;
import java.util.ArrayList;

Serial myPort;
PrintWriter output;
ButtonCollection buttonCollection = new ButtonCollection();

MenuButton exitButton;
MenuButton buildButton;
MenuButton resetButton;
String cond = "@";
String inputValue = "!";

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

  //For
  buttonCollection.addButton(new Button(width/100, height/10, "For", 1,  "for(int ~ = 0; ~ " + cond + inputValue + "; ~++)"));
  //While
  buttonCollection.addButton(new Button(width/100, height/10 + 50, "While", 1, "while(~ " + cond + inputValue + ")"));
  //Light
  buttonCollection.addButton(new Button(width/100, height/10 + 100, "If Light Sensor", 1, "if(EngduinoLight.lightLevel() " + cond + inputValue + ")"));
  //Temp
  buttonCollection.addButton(new Button(width/100, height/10 + 150, "If Temp Sensor", 1, "if(EngduinoThermistor.temperature() " + cond + inputValue + ")"));
  //acc-x
  buttonCollection.addButton(new Button(width/100, height/10 + 200, "If acc-x", 1, "float acclerations[3];\nEngduinoAcclerometer.xyz(accelerations);\nif(accelerations[0] " + cond + inputValue + ")"));
  //acc-y
  buttonCollection.addButton(new Button(width/100, height/10 + 250, "If acc-y", 1, "float acclerations[3];\nEngduinoAcclerometer.xyz(accelerations);\nif(accelerations[1] " + cond + inputValue + ")"));
  //acc-z
  buttonCollection.addButton(new Button(width/100, height/10 + 300, "If acc-z", 1, "float acclerations[3];\nEngduinoAcclerometer.xyz(accelerations);\nif(accelerations[2] " + cond + inputValue + ")"));
  //Button click
  buttonCollection.addButton(new Button(width/100, height/10 + 350, "If Button Click", 1, "if(EnguinoButton.isPressed() == " + inputValue + ")"));
  //If
  buttonCollection.addButton(new Button(width/100, height/10 + 400, "If", 1, "if(~ " + cond + inputValue + ")"));
  //LED On
  buttonCollection.addButton(new Button(width/100, height/10 + 450, "LED # on", "EngduinoLEDs.setLED(" + inputValue + ", WHITE);"));
  //LED Off
  buttonCollection.addButton(new Button(width/100, height/10 + 500, "LED # off", "EngduinoLEDs.setLED(" + inputValue + ", OFF);"));
  //Pause
  buttonCollection.addButton(new Button(width/100, height/10 + 550, "Pause for:", "delay(" + inputValue + ");"));
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
  mc.keyPressedHandler();
}