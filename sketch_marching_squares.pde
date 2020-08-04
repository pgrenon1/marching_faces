// Marching Squares
// Coding in the Cabana
// The Coding Train / Daniel Shiffman
// https://thecodingtrain.com/challenges/coding-in-the-cabana/005-marching-squares.html
// https://youtu.be/0ZONMNUKTfU
// p5 port: https://editor.p5js.org/codingtrain/sketches/g6-zufS8c
import processing.video.*;

Capture cap;
float[][] field;
int rez = 5;
int cols, rows;
float increment = 0.2;
float zoff = 0;
OpenSimplexNoise noise;
PImage img;
boolean recording = true;
int recordingTime = 0;

void keyPressed() {
  if (key == 'r' || key == 'R') {
    recording = !recording;
  }
}

void setup() {
  
  size(640, 480);
  img = loadImage("thomas.jpg");
  //img.filter(POSTERIZE, 4);
  img.resize(width, height);
  //pixelDensity(2);
  noise = new OpenSimplexNoise();
  cols = 1 + width / rez;
  rows = 1 + height / rez;
  field = new float[cols][rows];
  
  cap = new Capture(this, 640, 480, 30);
  cap.start();
}

void line(PVector v1, PVector v2) {
  line(v1.x, v1.y, v2.x, v2.y);
}

void draw() {
  
  if(cap.available()){
     cap.read(); 
  }
  background(0);
  image(cap, 0,0,width, height);
  
  //textSize(18); text("FRAMERATE: " + int(frameRate), 50, 50);
  //background(0); 
  ////image(img,0,0);
  //float xoff = 0;
  //for (int i = 0; i < cols; i++) {
  //  xoff += increment;
  //  float yoff = 0;
  //  for (int j = 0; j < rows; j++) {
  //    color col = img.get(i * rez, j * rez);
  //    float r = red(col);
  //    float g = green(col);
  //    float b = blue(col);
  //    float bw = (r + g + b) / 3;
  //    float val = bw / 255 * 2 - 1;
  //    field[i][j] = (float)(noise.eval(xoff, val, zoff));

  //    //field[i][j] = (float)(noise.eval(xoff, yoff, zoff));
  //    yoff += increment;
  //  }
  //}
  //zoff += 0.03;

  //for (int i = 0; i < cols; i++) {
  //  for (int j = 0; j < rows; j++) {
  //    fill(field[i][j]*255);
  //    noStroke();
  //    rect(i*rez, j*rez, rez, rez);
  //  }
  //}

  //  for (int i = 0; i < cols-1; i++) {
  //    for (int j = 0; j < rows-1; j++) {
  //      float x = i * rez;
  //      float y = j * rez;
  //      PVector a = new PVector(x + rez * 0.5, y            );
  //      PVector b = new PVector(x + rez, y + rez * 0.5);
  //      PVector c = new PVector(x + rez * 0.5, y + rez      );
  //      PVector d = new PVector(x, y + rez * 0.5);
  //      int state = getState(ceil(field[i][j]), ceil(field[i+1][j]), 
  //        ceil(field[i+1][j+1]), ceil(field[i][j+1]));

  //      color col = img.get(i * rez, j * rez);

  //      stroke(255);
  //      strokeWeight(1);
  //      switch (state) {
  //      case 1:  
  //        line(c, d);
  //        break;
  //      case 2:  
  //        line(b, c);
  //        break;
  //      case 3:  
  //        line(b, d);
  //        break;
  //      case 4:  
  //        line(a, b);
  //        break;
  //      case 5:  
  //        line(a, d);
  //        line(b, c);
  //        break;
  //      case 6:  
  //        line(a, c);
  //        break;
  //      case 7:  
  //        line(a, d);
  //        break;
  //      case 8:  
  //        line(a, d);
  //        break;
  //      case 9:  
  //        line(a, c);
  //        break;
  //      case 10: 
  //        line(a, b);
  //        line(c, d);
  //        break;
  //      case 11: 
  //        line(a, b);
  //        break;
  //      case 12: 
  //        line(b, d);
  //        break;
  //      case 13: 
  //        line(b, c);
  //        break;
  //      case 14: 
  //        line(c, d);
  //        break;
  //      }
  //    }
  //}

  //if (recording){
  //  saveFrame("output/frame_####.png");
  //  fill(0,255,0);
  //  ellipse(width - 10, height - 10, 20, 20);
  //  recordingTime++;
  //  if (recordingTime >= 240)
  //  {
  //    recording = false;
  //    recordingTime = 0;
  //  }
  //}
}

int getState(int a, int b, int c, int d) {
  return a * 8 + b * 4  + c * 2 + d * 1;
}
