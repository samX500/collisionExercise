
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

public static boolean doCollideObst(Circle currentCircle,Obstacle currentObst)
{
  boolean isCollision = false;
  PVector distance = PVector.sub(currentObst.position,currentCircle.position);
  float theta = distance.heading();
  float obstMinDist = currentObst.obstWitdh/cos(theta);
  float minLenght = currentCircle.radius + obstMinDist;
  
  if(distance.mag() > minLenght)
  {
    isCollision = true;
  }
  return isCollision;
}

public static void collideWith(Circle currentCircle, Circle otherCircle)
{
  PVector distanceVect = PVector.sub(otherCircle.position, currentCircle.position);
  float distanceVectMag = distanceVect.mag();

  float minDistance = currentCircle.radius + otherCircle.radius;

  if (distanceVectMag < minDistance)
  {
    float distanceCorrection = (minDistance-distanceVectMag)/2.0;
    PVector d = distanceVect.copy();
    PVector correctionVector = d.normalize().mult(distanceCorrection);
    otherCircle.position.add(correctionVector);
    currentCircle.position.sub(correctionVector);

    float theta = distanceVect.heading();
    float sine = sin(theta);
    float cosine = cos(theta);

    PVector[] bTemp = {new PVector(), new PVector()};
    bTemp[1].x = cosine * distanceVect.x + sine*distanceVect.y;
    bTemp[1].y = cosine * distanceVect.y - sine * distanceVect.y;

    PVector[] vTemp = {new PVector(), new PVector()};
    vTemp[0].x = cosine * currentCircle.speed.x + sine * currentCircle.speed.y;
    vTemp[0].y = cosine * currentCircle.speed.y - sine * currentCircle.speed.x;
    vTemp[1].x = cosine * otherCircle.speed.x + sine * otherCircle.speed.y;
    vTemp[1].y = cosine * otherCircle.speed.y - sine * otherCircle.speed.x;

    PVector[] vFinal = {new PVector(), new PVector()};
    vFinal[0].x = ((currentCircle.mass-otherCircle.mass)*vTemp[0].x+2*otherCircle.mass*vTemp[1].x)/(currentCircle.mass+otherCircle.mass);
    vFinal[0].y= vTemp[0].y;
    vFinal[1].x = ((otherCircle.mass-currentCircle.mass)*vTemp[1].x+2*currentCircle.mass*vTemp[0].x)/(currentCircle.mass+otherCircle.mass);
    vFinal[1].y = vTemp[1].y;

    bTemp[0].x += vFinal[0].x;
    bTemp[1].x += vFinal[1].x;

    PVector[] bFinal = {new PVector(), new PVector()};
    bFinal[0].x = cosine * bTemp[0].x - sine * bTemp[0].y;
    bFinal[0].y = cosine * bTemp[0].y + sine * bTemp[0].x;
    bFinal[1].x = cosine * bTemp[1].x - sine * bTemp[1].y;
    bFinal[1].y = cosine * bTemp[1].y + sine * bTemp[1].x;

    otherCircle.position.x = currentCircle.position.x + bFinal[1].x;
    otherCircle.position.y = currentCircle.position.y + bFinal[1].y;

    currentCircle.position.add(bFinal[0]);

    currentCircle.speed.x = cosine * vFinal[0].x - sine* vFinal[0].y;
    currentCircle.speed.y = cosine * vFinal[0].y + sine*vFinal[0].x;
    otherCircle.speed.x = cosine*vFinal[1].x-sine*vFinal[1].y;
    otherCircle.speed.y = cosine*vFinal[1].y+sine*vFinal[1].x;
  }
}

public static void collideWithWall(Circle currentCircle)
{
  currentCircle.setSpeed(-currentCircle.speed.x, -currentCircle.speed.y);
}
