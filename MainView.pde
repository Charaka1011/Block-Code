class MainView {
  private Button bref = new Button();
  private int Bwidth = bref.buttonWidth*12, Bheight = bref.buttonHeight*17/2;
  private final int text = color(236, 236, 236);
  private final int button = color(30, 139, 195);
  private int posX = 0, posY = 0;
  private String val = "";
  private boolean isSmart = false;
  
  public void drawButtons(ArrayList<Integer> pos, ArrayList<String> labels, ArrayList<Boolean> isSmart) {
    int j = 0;
    for (int i =0; i<labels.size(); i++) {
      this.posX = pos.get(j++);
      this.posY = pos.get(j++);
      this.val = labels.get(i);
      this.isSmart = isSmart.get(i);
      if (this.isSmart) {
        if (overBlock()) {
          fill(250, 125, 34);
          stroke(text);
        } else {
          fill(249, 105, 14);
          stroke(text);
        }
      } else if (overBlock()) {
        fill(9, 52, 70);
        stroke(text);
      } else {
        fill(button);
        stroke(text);
      }
      rect(this.posX, this.posY, this.Bwidth, this.Bheight, 30);
      fill(text);
      textSize(width/47);
      textAlign(CENTER, CENTER);
      text(val, posX + width/9, posY + height/50);
    }
  }

  boolean overBlock() {
    if (mouseX >= posX && mouseX <= posX+this.Bwidth && mouseY >= posY && mouseY <= posY+this.Bheight) 
    {
      return true;
    } else 
    {
      return false;
    }
  }

  public void drawCanvas() {
    fill(8, 22, 37);
    noStroke();
    rect(0, 0, width, height/14);
    buildButton.drawButton();
    resetButton.drawButton();
    exitButton.drawButton();
    fill(0);
    rect(0, height-(height/10), width, height/10);
    fill(255);
    textSize(height/40);
    textAlign(LEFT);
    text("Build terminal: ", 5, height/25 + height - (height/10));
  }
 
 
  }