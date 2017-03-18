class TextBox {
  int posX = 0;
  int posY = 0;
  int textWidth = width/12;
  int textHeight = height/20;
  String mainText = "i ";
  String condStm = "=";
  ArrayList<Character> userInput = new ArrayList<Character>();
  ArrayList<Character> relativeValue = new ArrayList<Character>();
  String displayInput = "", relativeInput = "";
  Button b;

  TextBox(int x, int y, Button b) {
    posX = x + b.buttonWidth - 20;
    posY = y;
    this.b = b;
  }
  public void drawSmartTextBox() {
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
    text(condStm, posX + textWidth/10+textWidth/6, posY + textHeight*0.8 );
  }

  public void drawTextBox() {
    fill(30, 139, 195);
    stroke(255);
    rect(posX, posY, textWidth, textHeight);
    fill(253, 227, 167);
    rect(posX+(textWidth*0.5), posY, textWidth/2, textHeight);
    fill(255);
    textSize(32);
    text("#", posX + textWidth/10, posY + textHeight*0.9);
    fill(0);
    if (relativeValue.size()==0) {
      text(displayInput, posX + textWidth/10+textWidth/2.3, posY + textHeight*0.8);
    } else {
      text(relativeInput, posX + textWidth/10+textWidth/2.3, posY + textHeight*0.8);
    }
  }
  public void update(int x, int y) {
    posX = x + b.buttonWidth - 20;
    posY = y;
    if (b.isSmart) {
      drawSmartTextBox();
    } else {
      drawTextBox();
    }
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

  void setUserInput(char val) {
    if (val == '\0') {
      if (relativeValue.size()==0) {
        if (userInput.size()>0) {
          userInput.remove(userInput.size()-1);
          displayInput = convertToString(userInput);
          if (b.isSmart) {
            drawSmartTextBox();
          } else {
            drawTextBox();
          }
        }
      } else {
        relativeValue.remove(relativeValue.size()-1);
        relativeInput = convertToString(relativeValue);
        drawTextBox();
      }
    } else if (val == 'b') {
      displayInput = convertToString(userInput);
      if (b.isSmart) {
        drawSmartTextBox();
      } else {
        drawTextBox();
      }
    } else if (val == 'i') {
      relativeValue.add(val);
    } else if (userInput.size()<2) {
      userInput.add(val);
    }

    if (relativeValue.size()==0) {
      displayInput = convertToString(userInput);
    } else {
      relativeInput = convertToString(relativeValue);
    }
    if (b.isSmart) {
      drawSmartTextBox();
    } else {
      drawTextBox();
    }
  }


  void setCondStmt(char val) {
    condStm =val+"";
  }

  String convertToString(ArrayList<Character> userInput) {
    StringBuilder builder = new StringBuilder(userInput.size());
    for (Character ch : userInput)
    {
      builder.append(ch);
    }
    return builder.toString();
  }
}