
public static boolean doCollide(Circle currentCircle, Circle otherCircle)
{
  boolean isCollision = false;
  int[] distanceVec = new int[]{otherCircle.getXPosition()-currentCircle.position[0], otherCircle.getYPosition()-currentCircle.position[1]};
  int distance =  (int)sqrt(pow(distanceVec[0], 2)+pow(distanceVec[1], 2));
  if (distance <= currentCircle.radius + otherCircle.getRadius())
  {
    isCollision = true;
  }

  return isCollision;
}

public static boolean doCollideWall(Circle currentCircle)
{
  return currentCircle.position[0]-currentCircle.radius <= 0 + menuWitdh||currentCircle.position[0]+currentCircle.radius >= xSize +menuWitdh||currentCircle.position[1]-currentCircle.radius<=0||currentCircle.position[1]+currentCircle.radius>=ySize;
}

public static void collideWith(Circle currentCircle, Circle otherCircle)
{
  currentCircle.setSpeed(new int[]{0, 0});
  otherCircle.setSpeed(new int[]{0, 0});
}

public static void collideWithWall(Circle currentCircle)
{
  currentCircle.setSpeed(new int[]{0, 0});
}
