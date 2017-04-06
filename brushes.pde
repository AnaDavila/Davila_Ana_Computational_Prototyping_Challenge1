class brushes {
  //pulls images from the data folder into sketch
  PImage img;
  int x, y;
  //determines rotation speed for the bruch stroke
  float rot_speed = 2;
  //determines size of the brush stroke
  float size = 1.0;
  
  
  brushes(PImage _pic,int _x, int _y){
  x = _x;
  y = _y;
 img = _pic;
  
  
//calls array of images
}

void set_size(float _size){
size = _size;
}
void set_rot_speed(float _speed){
   rot_speed = _speed;
 }
 
  void draw(){
    int w = img.width/2;
    int h = img.height/2;
    
    pushMatrix();
    translate(x,y);
    //determines the speed in which the strokes are rotating
    rotate(radians(((frameCount*0.1)%360)*rot_speed));
    image(img,0,0,w*size,h*size);
    popMatrix();
  }
    
  }