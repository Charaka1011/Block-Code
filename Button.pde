class Button {
  int ButtonWidth = width/4, ButtonHeight = height/17;
  final int text = color(236, 236, 236);
  final int button = color(30, 139, 195);
  int posX, posY;
  int origX, origY;
  String val = "";
  boolean isSmart;

  Button(int posX, int posY, String val, boolean isSmart) {
    this.posX = posX;
    this.posY = posY;
    this.origX = posX;
    this.origY = posY;
    this.val = val;
    this.isSmart = isSmart;
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
}