class MainController {

  private MainView mainView = new MainView();
  private ButtonCollection buttonCollection;
  int lockedIndex = -1;
  boolean firstPress = true;
  public MainController(ButtonCollection bc) {
    buttonCollection = bc;
  }

  void drawButtons() {
    mainView.drawButtons(getButtonPos(), getButtonLabel());
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
  print("Hello");
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
      b.posX = mouseX-b.width/2;
      b.posY = mouseY-b.height/2;
    }
  } else
  {
    if (lockedIndex >= 0)
    {
      Button b = buttons.getButton(lockedIndex);
      b.posX = mouseX-b.width/2;
      b.posY = mouseY-b.height/2;
    }
  }  
  firstPress = false;
}