class MainView{
  private int width = 280, height = 40;
  private final int text = color(236, 236, 236);
  private final int button = color(30, 139, 195);
  private int posX, posY;
  private String val = "";
 // private MainController mainC = new MainController();
  
 
  public void drawButtons(ArrayList<Integer> pos,ArrayList<String> labels){
     int j = 0;
     for (int i =0; i<labels.size();i++){
       this.posX = pos.get(j++);
       this.posY = pos.get(j++);
       this.val = labels.get(i);
       if (overBlock()) {
         fill(9, 52, 70);
        stroke(text); 
       }else{
         fill(button);
         stroke(text);
       }
       rect(this.posX, this.posY, this.width, this.height, 30);
       fill(text);
       textSize(26);
       textAlign(CENTER, CENTER);
       text(val, posX + 140, posY + 15);
     }
  }
  
   boolean overBlock() {
    if (mouseX >= posX && mouseX <= posX+this.width && mouseY >= posY && mouseY <= posY+this.height) 
    {
      return true;
    } 
    else 
    {
      return false;
    }
  }
  
  
  

}