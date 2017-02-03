class ButtonCollection extends Button {
  ArrayList<Button> buttons = new ArrayList<Button>();
  
  ButtonCollection(int posX, int posY, String val)
  {
    super(posX, posY, val);
  }
  
  ButtonCollection(int posX, int posY, String val, ArrayList<Button> buttons)
  {
    super(posX, posY, val);
    this.buttons = buttons;
  }
  
  void addButton(Button button)
  {
    this.buttons.add(button);
  }
  
  void removeButton(Button button)
  {
    this.buttons.remove(button);
  }
  
  
}