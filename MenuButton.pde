class MenuButton {
  int ButtonWidth = width/25, ButtonHeight = height/15;
  int posX, posY;
  PImage image;

  MenuButton(int posX, int posY, PImage image) {
    this.posX = posX;
    this.posY = posY;
    this.image = image;
  }
  
  boolean overBlock() {
    if (mouseX >= posX && mouseX <= posX+this.ButtonWidth && mouseY >= posY && mouseY <= posY+this.ButtonHeight) 
    {
      return true;
    } 
    else 
    {
      return false;
    }
  }
  void drawButton(){
    image(image, posX, posY, ButtonWidth, ButtonHeight);
  }
}