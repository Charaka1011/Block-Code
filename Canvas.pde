class Canvas {
  int width, height;
  int posX, posY;
  int[] indices;
  int indent = 40;
  int rows, spacing;

  public Canvas(int posX, int posY, int width, int height, int spacing)
  {
    this.width = width;
    this.height = height;
    this.posX = posX;
    this.posY = posY;
    this.spacing = spacing;
    this.rows = this.height/spacing;
    initializeIndices(rows);
  }

  void initializeIndices(int size)
  {
    this.indices = new int[size];
    for (int i = 0; i < size; i++)
    {
      indices[i] = -1;
    }
  }

  boolean overCanvas() 
  {
    if (mouseX >= posX && mouseX <= posX+this.width && mouseY >= posY && mouseY <= posY+this.height) 
    {
      return true;
    } else 
    {
      return false;
    }
  }

  void snapToCanvas(ButtonCollection buttonCollection, Button button)
  {
    // Also need to handle storing button inside SmartButtonCollection once nested
    int index = (mouseY-this.posY)/spacing;
    if (index >= indices.length || mouseY < this.posY)
    {
      button.posY = button.origY;
      button.posX = button.origX;
    } else {
      if (indices[index] < 0)
      {
        button.posY = this.posY + (index*spacing) + (spacing/2) - (button.buttonHeight/2);
        button.posX = this.posX;
      } else
      {
        int button2Index = indices[index];
        Button button2 = buttonCollection.getButton(button2Index);
        while (indices[index] >= 0)
        {
          index++;
          if (index >= indices.length)
          {
            button.posY = button.origY;
            button.posX = button.origX;
            return;
          }
        }
        button.posY = this.posY + (index*spacing) + (spacing/2) - (button.buttonHeight/2);
        int currentIndent = 0;
        if (button2.posX > this.posX)
        {
          currentIndent = button2.posX-this.posX;
        }

        if (button2.isSmart)
        {
          button.posX = this.posX + currentIndent + indent;
        } else
        {
          button.posX = this.posX + currentIndent;
        }
      }
      indices[index] = buttonCollection.getIndex(button);
    }
  }

  void removeFromCanvas(ButtonCollection buttonCollection, Button button)
  {
    // If button to remove from canvas has nested buttons, they also need to be removed.
    int index = buttonCollection.getIndex(button);
    for (int i = 0; i < indices.length; i++)
    {
      if (indices[i] == index)
      {
        indices[i] = -1;
        removeNested(buttonCollection, i+1);    
        return;
      }
    }
  }

  void removeNested(ButtonCollection buttonCollection, int index)
  {
    if (index < indices.length && indices[index] >= 0)
    {
      Button button = buttonCollection.getButton(indices[index]);
      if (button.posX >= (this.posX+indent))
      {
        button.posX = button.origX;
        button.posY = button.origY;
        indices[index] = -1;
        removeNested(buttonCollection, index+1);
      }
    }
  }
}