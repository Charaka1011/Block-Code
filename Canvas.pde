class Canvas {
  int width, height;
  int posX, posY;
  int[] indices;
  int indent = 20;
  int rows, spacing;

  public Canvas(int posX, int posY, int width, int height, int rows)
  {
    this.width = width;
    this.height = height;
    this.posX = posX;
    this.posY = posY;
    this.rows = rows;
    this.spacing = height/rows;
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
    int index = mouseY/spacing;
    if (index >= indices.length)
    {
      index = indices.length-1;
    }
    if (indices[index] < 0)
    {
      button.posY = this.posY + (index*spacing);
      button.posX = this.posX;
    } else
    {
      int button2Index = indices[index];
      Button button2 = buttonCollection.getButton(button2Index);
      while (indices[index] >= 0 && index < indices.length)
      {
        index++;
      }
      button.posY = this.posY + (index*spacing);
      int currentIndent = 0;
      if(button2.posX > this.posX)
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

  void removeFromCanvas(ButtonCollection buttonCollection, Button button)
  {
    // If button to remove from canvas has nested buttons, they also need to be removed.
    int index = buttonCollection.getIndex(button);
    for (int i = 0; i < indices.length; i++)
    {
      if (indices[i] == index)
      {
        indices[i] = -1;
        return;
      }
    }
  }
}