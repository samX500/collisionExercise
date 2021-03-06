PImage cuteGirl1,cuteGirl2,cuteGirl3,cuteGirl4;
ArrayList<PImage> cuteGirlList = new ArrayList<PImage>();

ArrayList<Circle> circleList = new ArrayList<Circle>();
ArrayList<PVector> oldSpeed = new ArrayList<PVector>();
int wallSize = 50;

boolean isLoli = false;
Circle newCircle;
boolean stop = false;
static final int xSize = 1000;
static final int ySize = 1000;

int nbrBall = 10;

File dir; 
File [] files;
void setup()
{
  dir = new File(sketchPath("picture"));
  print(dir);
  files = dir.listFiles();

  for(int i =0; i < files.length;i++)
  {  

    cuteGirlList.add(loadImage(files[i].getAbsolutePath()));
  }    
  size(1200, 1000);
}

void draw()  
{
  background(0, 255, 255);

  if(!stop)
  {
    for (int i = 0; i < circleList.size()-1; i++)
    {
      for (int j = 1; i+j < circleList.size(); j++)
      {
        circleList.get(i).collide(circleList.get(i+j));
      }
    }
  }
  displayMenu();

  if (mousePressed == true)
  {
    float startX = newCircle.getXPosition();
    float startY = newCircle.getYPosition();
    stroke(0);
    strokeWeight(3);
    line(startX, startY, mouseX, mouseY);
    stroke(100);
    strokeWeight(1);
    line(startX, startY, startX-(mouseX-startX), startY-(mouseY-startY));
  }
  if (stop)
  {
    for (int i = 0; i< circleList.size(); i++)
    {
      Circle circle = circleList.get(i);
      line(circle.getXPosition(), circle.getYPosition(), circle.getXPosition()+(oldSpeed.get(i).x)*10, circle.getYPosition()+(oldSpeed.get(i).y)*10);
    }
  }
  
  for (Circle circle : circleList)
  {
    circle.update();
  }

}

void mousePressed()
{
  newCircle = new Circle(mouseX, mouseY);
  circleList.add(new Circle(mouseX, mouseY));

  if (stop)
  {
    oldSpeed.add(new PVector(0, 0));
  }

}

void mouseReleased()
{
  float startX = newCircle.getXPosition();
  float startY = newCircle.getYPosition();

  circleList.remove(circleList.size()-1);
  if (!stop)
  {
    circleList.add(new Circle(startX, startY, (startX-mouseX)/10, (startY-mouseY)/10));
  } else
  {
    circleList.add(new Circle(startX, startY, (startX-mouseX)/10, (startY-mouseY)/10));
    oldSpeed.set(oldSpeed.size()-1, new PVector(circleList.get(circleList.size()-1).getXSpeed(), circleList.get(circleList.size()-1).getYSpeed()));
    circleList.get(circleList.size()-1).setSpeed(0, 0);
  }
}
void keyPressed()
{
  if (key ==' ')
  {
    if (!stop)
    {
      for (int i = 0; i< circleList.size(); i++)
      {
        oldSpeed.add(new PVector(circleList.get(i).getXSpeed(), circleList.get(i).getYSpeed()));
        circleList.get(i).setSpeed(0, 0);
      }
      stop = true;
    } else
    {
      for (int i = 0; i< circleList.size(); i++)
      {
        circleList.get(i).setSpeed(oldSpeed.get(i).x, oldSpeed.get(i).y);
      }
      oldSpeed.clear();
      stop = false;
    }
  }
  
  if(key == 'l')
  {
    isLoli = isLoli?false:true;
  }
  if(key == 'c')
  {
    circleList.clear();
  }
  if(key == 'z' || key == 'x')
  {
    for(int i = 0; i <= nbrBall;i++)
    {
      newCircle = new Circle(mouseX, mouseY);
      circleList.add(new Circle(mouseX, mouseY));

      if (stop)
      {
        oldSpeed.add(new PVector(0, 0));
      }
    }
  }
}
