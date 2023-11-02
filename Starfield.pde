Particle[] parts = new Particle[1000];
boolean start = false;
void setup(){
  size(500,500);
  noStroke();
  for (int i = 0; i<parts.length; i++){
    parts[i] = new Particle();
  }
  for (int i = 999; i<parts.length; i++){
    parts[i] = new OddballParticle();
  }
}
void draw(){
  background (0);
  for (int i = 0; i<parts.length; i++){
    parts[i].show();
    parts[i].drift();
  }
}


class Particle{
  double myX, myY, mySpeed,myAngle;
  int myColor;
  Particle(){
    myX = myY = 250;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = Math.random()*10;
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  }
  void show(){
    fill(myColor);
    ellipse((float)myX, (float)myY, 3,3);
  }
  void drift(){
   myX = myX + (Math.cos(myAngle)*mySpeed);
   myY = myY + (Math.sin(myAngle)*mySpeed);
  }
}
class OddballParticle extends Particle{
  OddballParticle(){
    myX = myY =250;
    myColor = 255;
    mySpeed = 1;
  }
  void show(){
    fill(myColor);
    rect((float)myX, (float)myY, 10,10);
  }
  void drift(){
  if (mouseX>myX){
   myX = myX+(int)(Math.random()*5)-1;
} else{
  myX = myX+(int)(Math.random()*5)-3;
}
  if (mouseY>myY){
   myY = myY+(int)(Math.random()*5)-1;
} else{
  myY = myY+(int)(Math.random()*5)-3;
}
  }
}
