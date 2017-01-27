class Button{
  int width = 280, height = 40;
  final int text = color(236,236,236);
  final int button = color(30, 139, 195);
  int posX,posY;
  boolean locked=false;
  String val = "";

  Button(int posX,int posY, String val){
    this.posX = posX;
    this.posY = posY;
    this.val =val;
    drawButton(false);
  }
  
  boolean drawButton(boolean locked){
    
    fill(button);
    stroke(text);
    rect(this.posX,this.posY,width,height,30);
    fill(text);
    textSize(26);
    textAlign(CENTER, CENTER);
    text(val, posX + 140, posY + 15);
    if(overBlock(posX,posY)){
      stroke(255); 
      fill(0);
    }
    if(mousePressed && overBlock(posX,posY)){
      posX = mouseX-width/2;
      posY = mouseY-height/2;
      return true;
    }
    return false;
  }
  boolean overBlock(int x, int y) {
  if (mouseX >= x && mouseX <= x+this.width && mouseY >= y && mouseY <= y+this.height) 
  {return true;} else {return false;}
}
}