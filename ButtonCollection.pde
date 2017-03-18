class ButtonCollection {
  ArrayList<Button> buttons;

  ButtonCollection()
  {
    buttons = new ArrayList<Button>();
  }

  ButtonCollection(ArrayList<Button> buttons)
  {
    this.buttons = buttons;
  }

  void addButton(Button button)
  {
    buttons.add(button);
  }

  void removeButton(Button button)
  {
    buttons.remove(button);
  }

  Button getButton(int i)
  {
    return buttons.get(i);
  }

  int getIndex(Button b)
  {
    return buttons.indexOf(b);
  }

  ArrayList<Button> getCollection()
  {
    return buttons;
  }
  Button overTextBox(){
    for (Button b : buttons)
    {
        if (b.tb.overTextBox()){
          return b;
      }
    }
     
    return null;
  }
  Button overButton()
  {
    for (Button b : buttons)
    {
      if (b.overBlock())
      {
        return b;
      }
    }
    return null;
  }
  
  void stopBlinking(){
   for (Button b : buttons)
    {
      if(b.isSmart){
        b.tb.setUserInput('b');
      }
  }  
}
}