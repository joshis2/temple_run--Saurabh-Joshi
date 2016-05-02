Sprite Dude;
PImage a;
PImage b;

void setup()
{
  size(500,500);
  Dude = new Sprite();
  Dude.SetImage("guy_dangerous.jpg", 100, 100);
  Dude.Origin(100,100);
  a = loadImage("empty-road-pictures-2.jpg");
  a.resize(500, 500);
  b = loadImage("empty-road-pictures-1.jpg");
  b.resize(500, 500);
}

void draw()
{
  image(a);
  image(b);
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