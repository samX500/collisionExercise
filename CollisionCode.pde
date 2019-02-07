ArrayList<Circle> circleList = new ArrayList<Circle>();
static ArrayList<Obstacle> obstacleList = new ArrayList<Obstacle>();
ArrayList<PVector> oldSpeed = new ArrayList<PVector>();
int wallSize = 50;

Obstacle leftWall = new Obstacle(menuWitdh-wallSize, height/2,wallSize, height);
Obstacle rightWall = new Obstacle(width +wallSize,height/2 , wallSize, height);
Obstacle roof = new Obstacle(width/2, -wallSize, width, wallSize);
Obstacle floor = new Obstacle(width/2, height+wallSize-50, width, wallSize);

Circle newCircle;
boolean stop = false;
static final int xSize = 1000;
static final int ySize = 1000;


void setup()
{
  size(1200, 1000);
  obstacleList.add(leftWall);
  obstacleList.add(rightWall);
  obstacleList.add(roof);
  obstacleList.add(floor);
}

void draw()  
{
  background(0, 255, 255);

  for (int i = 0; i < circleList.size()-1; i++)
  {
    for (int j = 1; i+j < circleList.size(); j++)
    {
      circleList.get(i).collide(circleList.get(i+j));
    }
  }

  for(Obstacle obst: obstacleList)
  {
    obst.display();
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
      //line(circle.getXPosition(),circle.getYPosition(),circle.getXPosition()+circle.getSpeed().mag(),circle.getYPosition()+circle.getSpeed().mag());
      line(circle.getXPosition(), circle.getYPosition(), circle.getXPosition()+(oldSpeed.get(i).x)*10, circle.getYPosition()+(oldSpeed.get(i).y)*10);
    }
  }
  
  for (Circle circle : circleList)
  {
    circle.display();
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
}
