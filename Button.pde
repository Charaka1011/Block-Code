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
  
  String[] output = new String[2];
  
  Button(){
    //just for ref
    this(0,0,"");
  }
  
    
  void setOutputStrings(String s1, String s2)
  {
     output[0] = s1;
     output[1] = s2; 
  }
  
  String getOutputString()
  {
    return output[0] + tb.displayInput.replace("|", "") + output[1];
  }


  Button(int posX, int posY, String val) {
    this.posX = posX;
    this.posY = posY;
    this.origX = posX;
    this.origY = posY;
    this.val = val; 
    tb = new TextBox(this.posX, this.posY, this);
   
  }
  Button (int posX, int posY, String val, int a) {
    this.posX = posX;
    this.posY = posY;
    this.origX = posX;
    this.origY = posY;
    this.val = val;
    this.isSmart = true;
    tb = new TextBox(this.posX, this.posY, this);

    nestedButtons = new ArrayList<Button>();

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