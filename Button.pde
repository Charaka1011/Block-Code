`class Button {

  int buttonWidth = width/5, buttonHeight = height/17;

  final int text = color(236, 236, 236);
  final int button = color(30, 139, 195);
  int posX, posY;
  final int origX, origY;
  String val = "";
  boolean isSmart = false;
  public TextBox tb;
  ArrayList<Button> nestedButtons;
  
  String outputString;
  
  Button(){
    //just for ref
    this(0,0,"", null);
  }

  Button(int posX, int posY, String val, String outputString) {
    this.posX = posX;
    this.posY = posY;
    this.origX = posX;
    this.origY = posY;
    this.val = val; 
    tb = new TextBox(this.posX, this.posY, this);
    this.outputString = outputString;
   
  }
  Button (int posX, int posY, String val, int a, String outputString) {
    this.posX = posX;
    this.posY = posY;
    this.origX = posX;
    this.origY = posY;
    this.val = val;
    this.isSmart = true;
    tb = new TextBox(this.posX, this.posY, this);
    this.outputString = outputString;

    nestedButtons = new ArrayList<Button>();
  }
   
  String getOutputString()
  {
    return output[0] + tb.displayInput.replace("|", "") + output[1];
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
  
  void addNested(Button button)
  {
     nestedButtons.add(button); 
  }
  
  void removeNested(Button button)
  {
    nestedButtons.remove(button); 
  }
  
  void resetNested()
  {
    nestedButtons.clear();
  }
  
  ArrayList<Button> getNested()
  {
     return nestedButtons; 
  }
}