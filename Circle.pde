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
  private int[] position = new int[2];
  private int[] speed = new int [2];
  private int stroke;
  private color circleColor;

  public Circle(int[] position)
  {
    mass = DEFAULT_MASS;
    radius = DEFAULT_RADIUS;
    energy = DEFAULT_ENEGERY;
    circleColor = DEFAULT_COLOR;
    this.position = position;
    speed = DEFAULT_SPEED;
  }

  public Circle(int[] position, int[] speed)
  {
    mass = DEFAULT_MASS;
    radius = DEFAULT_RADIUS;
    energy = DEFAULT_ENEGERY;
    circleColor = DEFAULT_COLOR;
    this.position = position;
    this.speed = speed;
  }

  public void update()
  {
    this.moveX();
    this.moveY();
    this.collideWall();
    this.updateColor();
    this.isHovering();
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

  public int getXPosition()
  {
    return position[0];
  }

  public int getYPosition()
  {
    return position[1];
  }

  public void setXPosition(int xPosition)
  {
    //TODO might want to validate
    position[0] = xPosition;
  }

  public void setYPosition(int yPosition)
  {
    //TODO might want to validate
    position[1] = yPosition;
  }

  public int[] getSpeed()
  {
    return speed;
  }

  public int getXSpeed()
  {
    return speed[0];
  }

  public int getYSpeed()
  {
    return speed[1];
  }

  public int getAbsoluteSpeed()
  {
    return (int)sqrt(pow(speed[0], 2)+pow(speed[1], 2));
  }

  public void setSpeed(int[] speed)
  {
    this.speed = speed;
  }

  public void setXSpeed(int xSpeed)
  {
    //TODO might want to validate
    speed[0] = xSpeed;
  }

  public void setYSpeed(int ySpeed)
  {
    //TODO might want to validate
    speed[1] = ySpeed;
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

  private void moveX()
  {
    position[0] += speed[0];
  }

  private void moveY()
  {
    position[1] += speed[1];
  }

  public void collide(Circle otherCircle)
  {
    if (doCollide(this, otherCircle))
    {
      collideWith(this, otherCircle);
    }
  }

  public void collideWall()
  {
    if (doCollideWall(this))
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
    int[] distanceVec =new int[]{mouseX-position[0], mouseY-position[1]};
    int distance = (int)sqrt(pow(distanceVec[0], 2)+pow(distanceVec[1], 2));

    return distance <= radius;
  }

  public void display()
  {
    ellipseMode(RADIUS);
    fill(circleColor);
    strokeWeight(stroke);
    ellipse(position[0], position[1], radius, radius);
  }
}
