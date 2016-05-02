Sprite Dude;
PImage a;
PImage b;
float x;
void setup()
{
  size(500,500);
  Dude = new Sprite();
  Dude.SetImage("guy_dangerous.jpg", 100, 100);
  Dude.Origin(100,100);
  a = loadImage("road1.jpg");
  b = loadImage("road2.jpg");
}

void draw()
{
  image(a, x, 0, 500, 500);
  image(b, x, 0,500, 500);
  x-=1;
  Dude.Draw();
}



void keyPressed()
{
  if ( key == 's')
  {
    Dude.Origin(0,100);
  }
  else if (key == 'w')
  {
    Dude.Origin(0,-100);
  }
}

void keyReleased()
{
  Dude.Origin(0,0);
}