class ListBox{
  int posX = 0;
  int posY = 0;
  int textWidth = width/30;
  int textHeight = height/20;
  String[] list = {"<",">","=","<=",">="};
  int selection = 0;
  Button b;

  ListBox(int x, int y, Button b) {
    posX = x + b.buttonWidth + 10;
    posY = y;
    this.b = b;
    drawListbox();
  }
  void drawListbox(){
    fill(78,205,196);
    stroke(255);
    rect(posX, posY, textWidth/1.8, textHeight);
    fill(0);
    textSize(50);
    text("\u032C",posX + textWidth/1.6, posY+textHeight/2.5);
   }
}