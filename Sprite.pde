class Sprite
{
  int _x;
  int _y;
  int _w;
  int _h;
  int _dirX;
  PImage img;
  PVector position;
  PVector velocity;
  float jumpSpeed;


  float up;
  float down;
  float gravity = .5;
  float ground = 700;

  Sprite()
  {
    _x = 0;
    _y = 0;
    _w = 0;
    _h = 0;
    img = null;
    _dirX =0;
  }

  public void SetImage(String fileName)
  {
    img = loadImage(fileName);
    _w = img.width;
    _h = img.height;
  }
  public void SetImage(String fileName, int w, int h)
  {
    img = loadImage(fileName);
    _w = w;
    _h = h;
    img.resize(_w, _h);
  }

  public void Origin(int dirX, int dirY) 
  { 
    _dirX = dirX;
  }

  void Draw()
  {
  }
}