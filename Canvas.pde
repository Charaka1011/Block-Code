class Canvas {
  int width, height;
  int posX, posY;
  int[] indices;
  int indent = 40;
  int rows, spacing;
  int freeIndex = 0;

  public Canvas(int posX, int posY, int width, int height, int spacing)
  {
    this.width = width;
    this.height = height;
    this.posX = posX;
    this.posY = posY;
    this.spacing = spacing;
    this.rows = this.height/spacing;
    this.indices = new int[rows];
    resetIndices();
  }

  void resetIndices()
  {
    for (int i = 0; i < indices.length; i++)
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
    int index = (mouseY-this.posY)/spacing;
    if (index >= indices.length || mouseY < this.posY)
    {
      button.posY = button.origY;
      button.posX = button.origX;
    } else {
      if (indices[index] < 0)
      {
        index = freeIndex;
        button.posY = this.posY + (index*spacing) + (spacing/2) - (button.buttonHeight/2);
        button.posX = this.posX;
      } else
      {
        int button2Index = indices[index];
        Button button2 = buttonCollection.getButton(button2Index);
        boolean dontIndent = false;
        while (indices[index] >= 0)
        {
          index++;
          if (index >= indices.length)
          {
            button.posY = button.origY;
            button.posX = button.origX;
            return;
          }
          if(indices[index] >= 0)
          {
            if(buttonCollection.getButton(indices[index]).posX <= button2.posX)
            {
              dontIndent = true;
            }
          }
        }
        button.posY = this.posY + (index*spacing) + (spacing/2) - (button.buttonHeight/2);
        int currentIndent = 0;
        if (button2.posX > this.posX)
        {
          currentIndent = button2.posX-this.posX;
        }
        
        if(button2.isSmart && !dontIndent)
        {
          button.posX = this.posX + currentIndent + indent;
          button2.addNested(button);
        } 
        else
        {
          button.posX = this.posX;
        }
      }
      indices[index] = buttonCollection.getIndex(button);
      freeIndex = index+1;
    }
  }

  void removeFromCanvas(ButtonCollection buttonCollection, Button button)
  {
    int index = buttonCollection.getIndex(button);
    for (int i = 0; i < indices.length; i++)
    {
      if (indices[i] == index)
      {
        indices[i] = -1;
        if(button.isSmart)
        {
          button.resetNested();
        }
        if(button.posX > this.posX)
        {
          buttonCollection.removeFromParent(button);
        }
        removeNested(buttonCollection, i+1);
        if(i < freeIndex)
        {
          freeIndex = i;
        }
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
        buttonCollection.removeFromParent(button);
        if (button.isSmart)
        {
          button.tb.update(button.posX, button.posY);
          button.resetNested();
        }
        indices[index] = -1;
        removeNested(buttonCollection, index+1);
      }
    }
  }
  
  void resetCanvas()
  {
    resetIndices();
    freeIndex = 0;
  }
}