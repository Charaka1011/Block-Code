class TextBox {
  int posX = 0;
  int posY = 0;
  int textWidth = width/16;
  int textHeight = height/20;
  String mainText = "i ";
  String userInput = "";
  Button b;
  TextBox(int x, int y, Button b){
    posX = x + b.buttonWidth;
    posY = y;
    drawTextbox();
    this.b = b;
  }
  public void drawTextbox() {
    fill(235, 149, 50);
    stroke(255);
    rect(posX, posY, textWidth, textHeight);
    fill(253, 227, 167);
    rect(posX+(textWidth*0.7), posY, textWidth/3, textHeight);
    fill(255);
    textSize(32);
    text(mainText, posX + textWidth/10, posY + textHeight*0.9);
  }
  public void update(int x, int y) {
    posX = x + b.buttonWidth;
    posY = y;
    drawTextbox();
  }
}