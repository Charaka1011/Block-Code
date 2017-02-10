class Button {
  int width = 280, height = 40;
  final int text = color(236, 236, 236);
  final int button = color(30, 139, 195);
  int posX, posY;
  int origX, origY;
  boolean allowNested;
  String val = "";

  Button(int posX, int posY, String val, boolean allowNested) {
    this.posX = posX;
    this.posY = posY;
    this.origX = posX;
    this.origY = posY;
    this.val = val;
    this.allowNested = allowNested;
  }
  
  boolean overBlock() {
    if (mouseX >= posX && mouseX <= posX+this.width && mouseY >= posY && mouseY <= posY+this.height) 
    {
      return true;
    } 
    else 
    {
      return false;
    }
  }
}