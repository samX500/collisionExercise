
public static boolean doCollide(Circle currentCircle, Circle otherCircle)
{
  boolean isCollision = false;
  float distance = dist(currentCircle.getXPosition(), currentCircle.getYPosition(), otherCircle.getXPosition(), otherCircle.getYPosition());
  if (distance <= currentCircle.radius + otherCircle.getRadius())
  {
    isCollision = true;
  }

  return isCollision;
}

public static boolean doCollideWall(Circle currentCircle)
{
  return currentCircle.getXPosition()-currentCircle.radius <= 0 + menuWitdh||currentCircle.getXPosition()+currentCircle.radius >= xSize +menuWitdh||currentCircle.getYPosition()-currentCircle.radius<=0||currentCircle.getYPosition()+currentCircle.radius>=ySize;
}

public static void collideWith(Circle currentCircle, Circle otherCircle)
{
  currentCircle.setSpeed(0, 0);
  otherCircle.setSpeed(0, 0);
}

public static void collideWithWall(Circle currentCircle)
{
  currentCircle.setSpeed(0, 0);
}
