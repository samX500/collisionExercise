class Circle //<>//
{
  public final int DEFAULT_MASS = 30;
  public final int DEFAULT_RADIUS = 30;
  public final int DEFAULT_ENEGERY = 100;
  public final int DEFAULT_STROKE = 1;
  public final color DEFAULT_COLOR = color(255-DEFAULT_MASS);
  ;
  public final int[] DEFAULT_SPEED = new int[]{0, 0};

  private int mass;
  private int radius;
  private int energy;
  private PVector position;
  private PVector speed; 
  private int stroke;
  private color circleColor;
  private int cuteGirl = (int)random(0,cuteGirlList.size()); 

  public Circle(int xPosition, int yPosition)
  {
    mass = DEFAULT_MASS;
    radius = DEFAULT_RADIUS;
    energy = DEFAULT_ENEGERY;
    circleColor = DEFAULT_COLOR;;
    position = new PVector(xPosition, yPosition);
    speed = new PVector(0, 0);
  }

  public Circle(float xPosition, float yPosition, float xVelocity, float yVelocity )
  {
    mass = DEFAULT_MASS;
    radius = DEFAULT_RADIUS;
    energy = DEFAULT_ENEGERY;
    circleColor = DEFAULT_COLOR;
    position = new PVector(xPosition, yPosition);
    speed = new PVector(xVelocity, yVelocity);
  }

  public void update()
  {
    this.move();
    this.collideWall();
    this.updateColor();
    this.isHovering();
    this.display();
  }

  public int getMass()
  {
    return mass;
  }

  public void setMass(int mass)
  {
    if (validateMass(mass))
    {
      this.mass = mass;
    }
  }

  private boolean validateMass(int mass)
  {
    return mass > 0;
  }

  public int getRadius()
  {
    return radius;
  }

  public void setRadius(int radius)
  {
    if (validateRadius(radius))
    {
      this.radius = radius;
    }
  }

  private boolean validateRadius(int radius)
  {
    return radius > 0;
  }

  public int getEnergy()
  {
    return energy;
  }

  private void calculateEnergy()
  {
    energy = (1/2) * mass * (int)pow(getAbsoluteSpeed(), 2);
  }

  public float getXPosition()
  {
    return position.x;
  }

  public float getYPosition()
  {
    return position.y;
  }

  public void setXPosition(float xPosition)
  {
    //TODO might want to validate
    position.x = xPosition;
  }

  public void setYPosition(float yPosition)
  {
    //TODO might want to validate
    position.y = yPosition;
  }

  public PVector getSpeed()
  {
    return speed;
  }

  public float getXSpeed()
  {
    return speed.x;
  }

  public float getYSpeed()
  {
    return speed.y;
  }

  public float getAbsoluteSpeed()
  {
    return speed.mag();
  }

  public void setSpeed(float xSpeed, float ySpeed)
  {
    speed.set(xSpeed, ySpeed);
  }

  public void setXSpeed(float xSpeed)
  {
    //TODO might want to validate
    speed.x = xSpeed;
  }

  public void setYSpeed(float ySpeed)
  {
    //TODO might want to validate
    speed.y = ySpeed;
  }

  public color getColor()
  {
    return circleColor;
  }

  public void setColor(color circleColor)
  {
    //TODO might want to validate
    this.circleColor = circleColor;
  }

  public void updateColor()
  {
    setColor(color(255-mass));
  }

  public int getStroke()
  {
    return stroke;
  }

  public void setStroke(int stroke)
  {
    this.stroke = stroke;
  }

  private void move()
  {
    position.add(speed);
  }


  public void collide(Circle otherCircle)
  {
      collideWith(this, otherCircle);
  }

  public void collideWall()
  {

    if (doCollideWall(this,width,height))
    {
       collideWithWall(this);
    }

  }

  public void isHovering()
  {
    if (mouseTouch())
    {
      setStroke(3);
    } else 
    {
      setStroke(1);
    }
  }

  public boolean mouseTouch()
{
    float distance = dist(mouseX, mouseY, position.x, position.y);


  return distance <= radius;
}

public void display()
{
 
  imageMode(CENTER);
  ellipseMode(RADIUS);
  fill(circleColor);
  strokeWeight(stroke);
  ellipse(position.x, position.y, radius, radius);
   if(isLoli)
   {
    image(cuteGirlList.get(cuteGirl),position.x,position.y);
   }
 
}
}
