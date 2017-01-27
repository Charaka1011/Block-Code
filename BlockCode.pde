import processing.serial.*;
Serial myPort;
Button myButton1,myButton2,myButton3,myButton4;

void setup() {
  
  
  printArray(Serial.list());
  //myPort = new Serial(this, Serial.list()[0], 9600);
    size(900,500);
    
  myButton1 = new Button(10,10,"For Loop");
  myButton2 = new Button(10,60,"While Loop");
  myButton3 = new Button(10,110,"If Selection");
    
}

void draw() {
  fill(34, 49, 63);
  noStroke();
  background(52, 73, 94);
  rect(0,0,width/3,height);
  myButton1.drawButton();
  myButton2.drawButton();
  myButton3.drawButton();
 
  
  if(mousePressed){
    myButton1.posX = mouseX;
    myButton1.posY = mouseY;
    if(mouseX>(width/3)){
      myButton1.posX = ((width/3) +10);
      myButton1.posY = height +10; 
    }
    myButton1.drawButton();
    
  }
  if(mouseX>(width/3)){
      myButton1.posX = ((width/3) +10);
      myButton1.posY = height +10; 
    }
}