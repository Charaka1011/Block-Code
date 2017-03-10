class TextBox {
  int posX = 0;
  int posY = 0;
  int textWidth = width/12;
  int textHeight = height/20;
  String mainText = "i ";
  ArrayList<Character> userInput = new ArrayList<Character>();
  String displayInput = "";
  Button b;
  ListBox lb;
  TextBox(int x, int y, Button b) {
    posX = x + b.buttonWidth - 20;
    posY = y;
    drawTextbox();
    this.b = b;
    lb = new ListBox(x,y,b);
    
  }
  public void drawTextbox() {
    fill(235, 149, 50);
    stroke(255);
    rect(posX, posY, textWidth, textHeight);
    fill(253, 227, 167);
    rect(posX+(textWidth*0.5), posY, textWidth/2, textHeight);
    fill(255);
    textSize(32);
    text(mainText, posX + textWidth/10, posY + textHeight*0.9);
    fill(0);
    text(displayInput, posX + textWidth/10+textWidth/2.3, posY + textHeight*0.8);
  }
  public void update(int x, int y) {
    posX = x + b.buttonWidth - 20;
    posY = y;
    drawTextbox();
  }
  boolean overTextBox() {
    if (mouseX >= posX && mouseX <= posX+this.textWidth && mouseY >= posY && mouseY <= posY+this.textHeight) 
    {
      return true;
    } else 
    {
      return false;
    }
  }
  
  void setUserInput(char val){
    if(val == '\0'){
      if(userInput.size()>0){
        userInput.remove(userInput.size()-1);
        displayInput = convertToString(userInput);
        drawTextbox();
      }
    }else if(val == 'b'){
      displayInput = convertToString(userInput);
      drawTextbox();
    }else{
    if(userInput.size()<2){
      userInput.add(val);
    }
    displayInput = convertToString(userInput);
    drawTextbox();
  }
  }
  
  String convertToString(ArrayList<Character> userInput){
    StringBuilder builder = new StringBuilder(userInput.size());
    for(Character ch: userInput)
    {
        builder.append(ch);
    }
    return builder.toString();
  }
}