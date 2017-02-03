class MainView{
  private int Bwidth = 280, Bheight = 40;
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
       rect(this.posX, this.posY, this.Bwidth, this.Bheight, 30);
       fill(text);
       textSize(26);
       textAlign(CENTER, CENTER);
       text(val, posX + 140, posY + 15);
     }
  }
  
   boolean overBlock() {
    if (mouseX >= posX && mouseX <= posX+this.Bwidth && mouseY >= posY && mouseY <= posY+this.Bheight) 
    {
      return true;
    } 
    else 
    {
      return false;
    }
  }
  
  public void drawCanvas(){
  fill(8, 22, 37);
  noStroke();
  rect(0, 0, width, height/14);
  image(buildImg, width-170, 1, width/25, height/15);
  image(resetImg, width - 110, 1, width/25, height/15);
  image(exitImg, width-50, 1, width/25, height/15);
  fill(0);
  rect(0,height - (height/10), width, height/10);
  fill(255);
  textSize(height/40);
  textAlign(LEFT);
  text("Build terminal: ", 5,20+ height - (height/10));
  
  }
  
  
  

}