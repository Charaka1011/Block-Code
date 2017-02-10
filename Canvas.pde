class Canvas {
  int width, height;
  int posX, posY;
  int[] indices;

  public Canvas(int w, int h, int x, int y, int columns)
  {
    this.width = w;
    this.height = h;
    this.posX = x;
    this.posY = y;
    initializeIndices(height/columns);
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
  
  //Get index position that button is over
  int overIndex(int x, int y)
  {
    
  }
  
  void snapToCanvas(Button b)
  {
    int index = overIndex();
    if(indices[index] >= 0)
    {
      
    }
    else 
  }
}