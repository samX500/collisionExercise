class Obstacle
{
  private int obstHeight;
  private int obstWitdh;
  private PVector position;
  
  public Obstacle(float xPosition,float yPosition,int obstWitdh,int obstHeight)
  {
    this.obstHeight = obstHeight;
    this.obstWitdh = obstWitdh;
    position = new PVector(xPosition,yPosition);
  }
  
  
  
  public int getWidth()
  {
    return obstWitdh;
  }
  
   public int getHeight()
  {
    return obstHeight;
  }
  
  
  
  public void display()
  {
    rectMode(RADIUS);
    fill(255,0,0);
    rect(position.x,position.y,obstWitdh,obstHeight);
  }
  

  
}
