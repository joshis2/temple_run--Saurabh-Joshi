// to move the image back you must make the x point of image 1 to be no less than the negative value of the width of image one. ie at -501 must comeback cannot be greater than -500. 

Sprite Dude;

boolean isRunning = true;
PImage a;
PImage b;
float x;
float y;
float x2;
float y2;
PVector position;
PVector velocity;
float jumpSpeed;


float up;
float down;
float gravity = .5;
float ground = 400;

float XPos1 = 450;
float YPos1 = 450;
float speed = 3;
void setup()
{
  size(500, 500, P3D);
  Dude = new Sprite();
  Dude.SetImage("guy_dangerous.jpg", 100, 100);
  Dude.position = new PVector(200, ground);
  Dude.velocity = new PVector(0, 0);
  Dude.jumpSpeed = 15;
  a = loadImage("road1.jpg"); 
  b = loadImage("road1.jpg");
  x=0;
  x2=width;
  
}


void draw()
{
  if (isRunning)
  {
    background(0); 
    image(a, x, 0, 500, 500);
    image(b, x2, 0, 500, 500);
    x-=1;
    x2-=1;

    if (x<-width)
    {
      x=width;
    }

    if (x2<-width)
    {
      x2=width;
    }
    rect(XPos1, YPos1, 55, 55);
    Dude.Draw();
    updateDude();



     XPos1 += -speed;
    if (XPos1 < 0)
    {
     XPos1 = width;
     speed += 1;
    }
    CheckCollisions();
    
  } else
  {
    background(0);
  }
}

void updateDude()
{
  if (Dude.position.y < ground)
  {
    Dude.velocity.y += gravity;
  } else
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

  image(Dude.img, Dude.position.x, Dude.position.y);
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


void CheckCollisions()
{
  //Check collisions with Sprite
  if (Dude.position.x < XPos1 + 55 &&
    Dude.position.x + 100 > XPos1 &&
    Dude.position.y < YPos1 + 55 &&
    Dude.position.y + 100 > YPos1)
  {
    isRunning=false;
    println("LOOLOLOL");
  }
}