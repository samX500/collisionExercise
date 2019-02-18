static int menuWidth = 200;
boolean touchCircle = false;
Circle currentCircle;
public void displayMenu()
{
  fill(color(255));
  strokeWeight(5);
  rect(0, 0, menuWidth, width);
  strokeWeight(1);

  for (Circle circle : circleList)
  {
    if (circle.mouseTouch())
    {
      touchCircle = true;
      currentCircle = circle;
    }
    else
    {
      touchCircle = false;
    }
  }
  if (touchCircle)
  {
    circleMenu(currentCircle);
  } else
  {
    normalMenu();
  }
}

public void normalMenu()
{
  fill(color(0, 255, 100));
  textSize(30);
  text("Press space\n to pause", 10, 30);
   fill(color(255, 0, 100));
  if (stop)
  {
    text("Paused", 25, 130);
  } else {
    text("Unpaused", 25, 130);
  }
  
  if(isLoli)
  {
    text("Loli currently \ndisplayed\npress l to\ndisable",1,230);
  }
  else
  {
   text("Loli currently \nnot displayed\npress l to\nenable",1,230);
  }
}

public void circleMenu(Circle currentCircle)
{
  fill(color(0, 255, 100));
  textSize(30);
  text("This is the\n circle menu", 10, 30);
}
