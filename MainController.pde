class MainController {

  private MainView mainView = new MainView();
  private ButtonCollection buttonCollection;
  int lockedIndex = -1;
  boolean firstPress = true;
  TextBox textBoxSelected = null;
  boolean bcBool = false;
  double goal = 500,pastM;

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
        Temp.lb.drawListbox();
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
  void mouseReleasedController() {
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

      if (b.isSmart)

        b.tb.update(b.posX, b.posY);
    }
    lockedIndex = -1;
  }
  void mouseDraggedController() {
    if (firstPress)
    {
      Button b = buttons.overButton();
      if (b != null)
      {
        lockedIndex = buttons.getIndex(b); 
        b.posX = mouseX-b.buttonWidth/2;
        b.posY = mouseY-b.buttonHeight/2;

        if (b.isSmart)

          b.tb.update(b.posX, b.posY);
      }
    } else
    {
      if (lockedIndex >= 0)
      {
        Button b = buttons.getButton(lockedIndex);
        b.posX = mouseX-b.buttonWidth/2;
        b.posY = mouseY-b.buttonHeight/2;

        if (b.isSmart)

          b.tb.update(b.posX, b.posY);
      }
    }  
    firstPress = false;
  }
  void mousePressedController() {
    TextBox tb;
    Button smartB = buttonCollection.overTextBox();
    if(smartB!=null){
      tb = smartB.tb;
      if(textBoxSelected!=null)
      textBoxSelected.setUserInput('b');
      textBoxSelected = tb;
    }else{
      textBoxSelected = null;
      buttonCollection.stopBlinking();
    }
    if (exitButton.overBlock()) {
      exit();
    } else if (resetButton.overBlock()) {
      for (Button b : buttons.getCollection()) {
        b.posX = b.origX;
        b.posY = b.origY;
        if (b.isSmart){
          b.tb.displayInput = "";
          b.tb.update(b.posX, b.posY);
        }
      }
    } else if (buildButton.overBlock()) {
    }
    
  }
  void keyPressedHandler(){
    if(key==BACKSPACE || key == DELETE){
     if(textBoxSelected!=null){
      textBoxSelected.setUserInput('\0');
    }
    }else if(textBoxSelected!=null){
    textBoxSelected.setUserInput(key);
    }
    bcBool = false;
  }
  
  void blink(){
    if(!bcBool && millis()-pastM>goal){
      pastM = millis();
      if(textBoxSelected!=null){
        textBoxSelected.displayInput = textBoxSelected.displayInput + "|";
        bcBool = true;
      }
    }else if(millis()-pastM>goal){
      pastM = millis();
      if(textBoxSelected!=null){
        bcBool = false;
        textBoxSelected.setUserInput('b');
      }
      
    }
}
}