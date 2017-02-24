class Button {
  int buttonWidth = width/4, buttonHeight = height/17;
  final int text = color(236, 236, 236);
  final int button = color(30, 139, 195);
  int posX, posY;
  int origX, origY;
  String val = "";
  boolean isSmart = false;
  public TextBox tb;

  Button(int posX, int posY, String val) {
    this.posX = posX;
    this.posY = posY;
    this.origX = posX;
    this.origY = posY;
    this.val = val;
  }
  Button (int posX, int posY, String val, int a) {
    this.posX = posX;
    this.posY = posY;
    this.origX = posX;
    this.origY = posY;
    this.val = val;
    this.isSmart = true;
    tb = new TextBox(this.posX, this.posY, this);
  }

  boolean overBlock() {
    if (mouseX >= posX && mouseX <= posX+this.buttonWidth && mouseY >= posY && mouseY <= posY+this.buttonHeight) 
    {
      return true;
    } else 
    {
      return false;
    }
  }
}