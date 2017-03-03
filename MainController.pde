class MainController {

  private MainView mainView = new MainView();
  private ButtonCollection buttonCollection;
  int lockedIndex = -1;
  boolean firstPress = true;


  public MainController(ButtonCollection bc) {
    buttonCollection = bc;
  }

  void drawButtons() {
    mainView.drawButtons(getButtonPos(), getButtonLabel(), getIsSmart());
  }

  void drawCanvas() {
    mainView.drawCanvas();
  }

  public ArrayList<Boolean> getIsSmart() {
    ArrayList<Button> buttonArray = buttonCollection.getCollection();
    ArrayList<Boolean> isSmart = new ArrayList<Boolean>();
    for (int i = 0; i<buttonArray.size(); i++) {
      if (buttonArray.get(i).isSmart) {
        isSmart.add(true);
        Button btemp = buttonArray.get(i);
        TextBox Temp = btemp.tb;
        Temp.drawTextbox();
      } else {
        isSmart.add(false);
      }
    }
    return isSmart;
  }

  public ArrayList<Integer> getButtonPos() {
    ArrayList<Button> buttonArray = buttonCollection.getCollection();
    ArrayList<Integer> values = new ArrayList<Integer>();
    for (int i = 0; i<buttonArray.size(); i++) {
      values.add(buttonArray.get(i).posX);
      values.add(buttonArray.get(i).posY);
    }
    return values;
  }

  public ArrayList<String> getButtonLabel() {
    ArrayList<Button> buttonArray = buttonCollection.getCollection();
    ArrayList<String> values = new ArrayList<String>();
    for (int i = 0; i<buttonArray.size(); i++) {
      values.add(buttonArray.get(i).val);
    }
    return values;
  }
}
void mouseReleased() {
  firstPress = true;
  if (lockedIndex >= 0)
  {
    Button b = buttons.getButton(lockedIndex);
    if (mouseX>(width/3))
    { 
      b.posX = ((width/3) +10);
    } else
    {
      b.posX = b.origX;
      b.posY = b.origY;
    }
    if(b.isSmart)
     b.tb.update(b.posX, b.posY);
  }
  lockedIndex = -1;
}

void mouseDragged()
{
  if (firstPress)
  {
    Button b = buttons.overButton();
    if (b != null)
    {
      lockedIndex = buttons.getIndex(b); 
      b.posX = mouseX-b.buttonWidth/2;
      b.posY = mouseY-b.buttonHeight/2;
      if(b.isSmart)
      b.tb.update(b.posX, b.posY);
    }
  } else
  {
    if (lockedIndex >= 0)
    {
      Button b = buttons.getButton(lockedIndex);
      b.posX = mouseX-b.buttonWidth/2;
      b.posY = mouseY-b.buttonHeight/2;
      if(b.isSmart)
      b.tb.update(b.posX, b.posY);
    }
  }  
  firstPress = false;
}

void mousePressed(){
  if(exitButton.overBlock()){
    exit();
  }else if(resetButton.overBlock()){
    for(Button b: buttons.getCollection()){
      b.posX = b.origX;
      b.posY = b.origY;
      if(b.isSmart)
      b.tb.update(b.posX, b.posY);
    }
  }else if(buildButton.overBlock()){
    
  }
}