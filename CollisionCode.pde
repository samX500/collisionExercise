ArrayList<Circle> circleList = new ArrayList<Circle>();
Circle newCircle;
boolean stop = false;
ArrayList<int[]> oldSpeed = new ArrayList<int[]>();
static final int xSize = 1000;
static final int ySize = 1000;

void setup()
{

  size(1150, 1000);
}

void draw()
{
  background(0, 255, 255);

  for (int i = 0; i < circleList.size()-1; i++)
  {
    for (int j = 1; i+j < circleList.size(); j++)
    {
      //System.out.println(i+" "+(i+j));
      circleList.get(i).collide(circleList.get(i+j));
    }
  }

  for (Circle circle : circleList)
  {
    circle.display();
    circle.update();
  }
  
  displayMenu();
  
  if (mousePressed == true)
  {
    int startX = newCircle.getXPosition();
    int startY = newCircle.getYPosition();
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
      System.out.println(circleList.size()+" "+oldSpeed.size());
      Circle circle = circleList.get(i);
      line(circle.position[0], circle.position[1], circle.position[0]+(oldSpeed.get(i)[0])*10, circle.position[1]+(oldSpeed.get(i)[1])*10);
    }
  }
}

void mousePressed()
{
  newCircle = new Circle(new int[]{mouseX, mouseY});
  circleList.add(new Circle(new int[]{mouseX, mouseY}));
  if (stop)
  {
    oldSpeed.add(new int[]{0, 0});
  }
}

void mouseReleased()
{
  int startX = newCircle.getXPosition();
  int startY = newCircle.getYPosition();

  circleList.remove(circleList.size()-1);
  if (!stop)
  {
    circleList.add(new Circle(new int[]{startX, startY}, new int[]{(startX-mouseX)/10, (startY-mouseY)/10}));
  } else
  {
    circleList.add(new Circle(new int[]{startX, startY}, new int[]{(startX-mouseX)/10, (startY-mouseY)/10}));
    oldSpeed.remove(oldSpeed.size()-1);
    oldSpeed.add(circleList.get(circleList.size()-1).getSpeed());
    circleList.get(circleList.size()-1).setSpeed(new int[]{0, 0});
  }
}
void keyPressed()
{
  if (key ==' ')
  {
    System.out.println(oldSpeed.size() + " "+ circleList.size()+"\n"+stop);

    if (!stop)
    {
      for (int i = 0; i< circleList.size(); i++)
      {
        oldSpeed.add(circleList.get(i).getSpeed());
        circleList.get(i).setSpeed(new int[]{0, 0});
      }
      stop = true;
    } else
    {
      for (int i = 0; i< circleList.size(); i++)
      {
        circleList.get(i).setSpeed(oldSpeed.get(i));
      }
      oldSpeed.clear();
      stop = false;
    }
  }
}
