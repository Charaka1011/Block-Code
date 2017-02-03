class Button {
  int width = 280, height = 40;
  final int text = color(236, 236, 236);
  final int button = color(30, 139, 195);
  int posX, posY;
  String val = "";

  Button(int posX, int posY, String val) {
    this.posX = posX;
    this.posY = posY;
    this.val =val;
    drawButton();
  }

  void drawButton() {

    fill(button);
    stroke(text);
    rect(this.posX, this.posY, width, height, 30);
    fill(text);
    textSize(26);
    textAlign(CENTER, CENTER);
    text(val, posX + 140, posY + 15);
    if (overBlock()) {
      stroke(255); 
      fill(0);
    }
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