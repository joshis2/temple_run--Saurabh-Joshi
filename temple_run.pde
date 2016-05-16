import processing.sound.*;
SoundFile file;

Sprite Dude;


int stateOfGame;
boolean isRunning = true;
boolean buttonPressed;
int buttonX, buttonY, buttonW, buttonH;
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
  buttonPressed = false;
  buttonW = 335;
  buttonH = 100;
  textSize(buttonH);
  buttonX = (width-buttonW)/2;
  buttonY = (height-buttonH)/2;

  Dude = new Sprite();
  Dude.SetImage("guy_dangerous.jpg", 100, 100);
  Dude.position = new PVector(200, ground);
  Dude.velocity = new PVector(0, 0);
  Dude.jumpSpeed = 15;

  a = loadImage("road1.jpg"); 
  b = loadImage("road1.jpg");
  x=0;
  x2=width;

  file = new SoundFile(this, "Hall Of Fame.mp3");
  file.play();
}

void draw()
{
  if (stateOfGame == 0)
  {
    background(255);
    fill(255);
    rect(buttonX, buttonY, buttonW, buttonH);
    fill(0);
    text("START", buttonX+10, buttonY+buttonH-10);
  }
  if (stateOfGame == 1)
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
      XPos1 += -speed;
      if (XPos1 < 0)
      {
        XPos1 = width;
        speed += 1;
      }
      updateDude();
      CheckCollisions();
    } 
    if (stateOfGame == 2)
    {
      background(0);
      textSize(32);
      textAlign(CENTER);
      fill(255);
      file.stop();
      text("Game Over", 250, 250);
    }
  }
}


void mousePressed() 
{
  if (mouseX > buttonX && mouseX < buttonX+buttonW && mouseY > buttonY && mouseY < buttonY+buttonH)
  {  
    buttonPressed = true;                                                                
    stateOfGame=1;
    isRunning = true;
  } 

  if (stateOfGame == 2)   
  {
    if (mousePressed == true)
    { 
      stateOfGame = 0;
      XPos1 = width;
    }
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
  if (Dude.position.x < XPos1 + 55 &&
    Dude.position.x + 100 > XPos1 &&
    Dude.position.y < YPos1 + 55 &&
    Dude.position.y + 100 > YPos1)
  {
    isRunning=false;
    stateOfGame = 2;
  }
}