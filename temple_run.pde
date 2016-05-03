Sprite Dude;

PImage a;
PImage b;
float x;
PVector position;
PVector velocity;
float jumpSpeed;


float up;
float down;
float gravity = .5;
float ground = 400;

void setup()
{
  size(500,500);
  Dude = new Sprite();
  Dude.SetImage("guy_dangerous.jpg", 100, 100);
  //Dude.Origin(100,100);
  a = loadImage("road1.jpg");
  b = loadImage("road2.jpg");
  Dude.position = new PVector(400, ground);
  Dude.velocity = new PVector(0, 0);
  Dude.jumpSpeed = 10;
}


void draw()
{
  image(a, x, 0, 500, 500);
  image(b, x, 0,500, 500);
  x-=1;
  Dude.Draw();
  updateDude();
}

void updateDude()
{
  if (Dude.position.y < ground)
  {
    Dude.velocity.y += gravity;
  }
  else
  {
    Dude.velocity.y = 0; 
  }
  
    if (Dude.position.y >= ground && up != 0)
  {
    Dude.velocity.y = -Dude.jumpSpeed;
  }

  PVector nextPosition = new PVector(Dude.position.x, Dude.position.y);
  nextPosition.add(Dude.velocity);
  
  float offset = 0;
  if (nextPosition.x > offset && nextPosition.x < (width - offset))
  {
    Dude.position.x = nextPosition.x;
  }
  if (nextPosition.y > offset && nextPosition.y < (height - offset))
  {
    Dude.position.y = nextPosition.y;
  } 
  
  
  translate(Dude.position.x, Dude.position.y);
  image(Dude.img, 0, 0);
}


void keyPressed()
{
 
  if (key == ' ')
  {
    up = -1;
  }
  if (key == 's')
  {
    down = 1;
  }
}

void keyReleased()
{
  if (key == ' ')
  {
    up = 0;
  }
  if (key == 's')
  {
    down = 0;
  }
}