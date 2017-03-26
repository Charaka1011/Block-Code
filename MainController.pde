class MainController {

  private MainView mainView = new MainView();
  private ButtonCollection buttonCollection;
  int lockedIndex = -1;
  boolean firstPress = true;
  TextBox textBoxSelected = null;
  boolean bcBool = false;
  double goal = 400, pastM;

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
        Temp.drawSmartTextBox();
      } else {
        isSmart.add(false);
        Button btemp = buttonArray.get(i);
        TextBox Temp = btemp.tb;
        Temp.drawTextBox();
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
      Button b = buttonCollection.getButton(lockedIndex);
      if (canvas.overCanvas())
      { 
        canvas.snapToCanvas(buttonCollection, b);
      } else
      {
        buttonCollection.removeButton(b);
      }


      b.tb.update(b.posX, b.posY);
    }
    lockedIndex = -1;
  }
  void mouseDraggedController() {
    if (firstPress)
    {
      Button b = buttonCollection.overButton();
      if (b != null)
      {
        lockedIndex = buttonCollection.getIndex(b); 
        b.posX = mouseX-b.buttonWidth/2;
        b.posY = mouseY-b.buttonHeight/2;
        b.tb.update(b.posX, b.posY);
        if (canvas.overCanvas())
        {
          canvas.removeFromCanvas(buttonCollection, b);
        } 
        else
        {
          if(b.isSmart)
          {
            buttonCollection.addButton(new Button(b.origX, b.origY, b.val, 1, b.outputString));
          }
          else
          {
            buttonCollection.addButton(new Button(b.origX, b.origY, b.val, b.outputString));
          }
        }
      }
    }else{
        if (lockedIndex >= 0)
        {
          Button b = buttonCollection.getButton(lockedIndex);
          b.posX = mouseX-b.buttonWidth/2;
          b.posY = mouseY-b.buttonHeight/2;


          b.tb.update(b.posX, b.posY);
        }
      }  
      firstPress = false;
  }

  void mousePressedController() {

    Button selectedButton = buttonCollection.overTextBox();
    if (selectedButton!=null) {
      if (textBoxSelected!=null) {
        textBoxSelected.setUserInput('b');
      }
      textBoxSelected = selectedButton.tb;
    } else {
      textBoxSelected = null;
      buttonCollection.stopBlinking();
    }


    if (exitButton.overBlock()) {
      exit();
    } else if (resetButton.overBlock()) {
      incrementer = 'a';
      for (Button b : buttonCollection.getCollection()) {
        b.posX = b.origX;
        b.posY = b.origY;

        for (int i = b.tb.userInput.size()-1; i>=0; i--) {
          b.tb.userInput.remove(i);
        }
        for (int i = b.tb.userInput.size()-1; i>=0; i--) {
          b.tb.relativeValue.remove(i);
        }
        b.tb.displayInput = "";
        b.tb.relativeInput = "";
        b.tb.condStm = "=";
        b.tb.update(b.posX, b.posY);
      }
      canvas.resetCanvas();
      mainView.resetBuildTerminalText();
    } else if (buildButton.overBlock()) {
      mainView.resetBuildTerminalText();
      mainView.appendBuildTerminalText(" Build started");
      output = createWriter("./output/output.ino");
      printSetupFunction();
      write("void loop() {\n");
      ArrayList<Button> baseButtons = canvas.getBaseButtons();
      parse(baseButtons, 1);
      write("}\n");
      output.close();
      mainView.appendBuildTerminalText("\nBuild complete, output file saved to output/output.ino");
    }
  }
  void keyPressedHandler() {
    if (key>='0'&& key <= '9'||key == BACKSPACE || key==DELETE||(key == '<' || key == '>' || key == '=')||key=='i') {
      if (textBoxSelected!=null) {

        switch (key) {
        case BACKSPACE:
        case DELETE:
          textBoxSelected.setUserInput('\0');
          break;

        case '<':
        case '>':
        case '=':
          textBoxSelected.setCondStmt(key);
          break;

        case 'i':
          textBoxSelected.setUserInput(key);
          break;

        default:
          textBoxSelected.setUserInput(key);
          break;
        }
        bcBool = false;
      }
    }
  }

  void blink() {
    if (!bcBool && millis()-pastM>goal) {
      pastM = millis();
      if (textBoxSelected!=null) {
        textBoxSelected.displayInput = textBoxSelected.displayInput + "|";
        textBoxSelected.relativeInput = textBoxSelected.relativeInput + "|";
        bcBool = true;
      }
    } else if (millis()-pastM>goal) {
      pastM = millis();
      if (textBoxSelected!=null) {
        bcBool = false;
        textBoxSelected.setUserInput('b');
      }
    }
  }
  void printSetupFunction()
  {
    write("#include \"EngduinoLight.h\" \n");
    write("#include \"EngduinoThermistor.h\" \n");
    write("#include \"EngduinoButton.h\" \n");
    write("#include \"EngduinoLEDs.h\" \n");
    write("#include \"EngduinoAccelerometer.h\" \n");
    write("#include \"Wire.h\" \n");
    write("\n");
    write("void setup() {\n");
    write("\tEngduinoLight.begin();\n");
    write("\tEngduinoThermistor.begin();\n");
    write("\tEngduinoButton.begin();\n");
    write("\tEngduinoLEDs.begin();\n");
    write("\tEngduinoAccelerometer.begin();\n");
    write("}\n\n");
  }
  
  void parse(ArrayList<Button> buttons, int indent)
  {
     for(Button button : buttons)
     {
       for(int i = 0; i < indent; i++)
       {
         write("\t");
       }
       write(button.getOutputString());
        
       if(button.isSmart)
       {   
          write(" {\n");
          parse(button.getNested(), indent+1); 
          for(int i = 0; i < indent; i++)
          {  
             write("\t");
          }
          write("}");

       }
       write("\n");
     }
  }
  
  void write(String s)
  {
    output.print(s);
    output.flush();
  }
}