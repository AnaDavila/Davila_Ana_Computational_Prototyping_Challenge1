ArrayList<brushes> vectors = new ArrayList<brushes>();
//calls brushes functions from the class, and applies them to the array of images
PImage[]imgs = new PImage [4];
int pic_index = 0;
//this sets up the boolean that will open our splash/welcome screen
boolean bStart = false;
PFont f;
//--------------------------------------------------------------------------------
void setup() {
  //sets up permanent features of the sketch
  size(800, 800, P2D);
  f = createFont("Arial", 16, true);
  
  //determines array of images
  imgs[0] = loadImage("Miro4.png");
  imgs[1] = loadImage("Miro3.png");
  imgs[2] = loadImage("Miro2.png");
  imgs[3] = loadImage("Miro.png");
  
  
  for (int i = 0; i < 3; i ++) {
    imgs[i].resize(imgs[i].width/4, imgs[i].height/4);
  }
}

//creates welcome screen for sketch 
void draw_splash_screen() {
  background(0);
}
//--------------------------------------------------------------------------------------
//allows functions to run over the time the sketch is open
void draw() {
  //this calls the splash screen when the sketch has been initialized
  if (bStart == false) {
    draw_splash_screen();
    textSize(32);
    text("Hello person, click to make art",height/5.5, width/2);
    
    textSize(12);
    text("press 1, 2, 3, 4 for different brushes",height/2.8, width/3);
    
    textSize(12);
    text("press 's' to save and 'c' to delete",height/2.8, width/1.5);
    
    fill(255);
    
    
    
    
  
}   else if (bStart == true) {
    background(255);
    for (int i = 0; i <vectors.size(); i ++) {
    brushes amazingart = vectors.get(i);

     float norm_lenght = map(i, 0, vectors.size(), 0.0, 1.0);
      float lfo = map(norm_lenght*sin(frameCount*0.02), -9.0, 1.0, 0.0, 1.0);

      amazingart.set_size(lfo);
      amazingart.set_rot_speed(lfo*5.1);
      amazingart.draw();
    }
  }
}

//--------------------------------------------------------------------------------
void mousePressed() {
  //tells the sketch to start the other functions once the mouse has been pressed for the first time
  bStart = true;
}

//--------------------------------------------------------------------------------
void keyPressed() {
  if (key =='1') pic_index = 0;
  if (key =='2') pic_index = 1;
  if (key =='3') pic_index = 2;
  if (key =='4') pic_index = 3;
   
   //By using saveFrame and allocating it to a key function we are able to save particular sketches onto our data folder
  if (key == 's') {
   saveFrame("myDrawing-######.jpg");
   
   //This particular if statement tells the sketch to clear the data once 'c' is pressed
    if (key == 'c'){
         vectors.clear();
  }}}
//--------------------------------------------------------------------------------
//mouseDragged allows us to use our vectors and images as brushes by repeating them as long as the mouse is being dragged
void mouseDragged() {
  vectors.add(new brushes(imgs[pic_index], mouseX, mouseY));
