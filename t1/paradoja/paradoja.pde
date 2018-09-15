PImage imgK;
PImage imgA;
PImage imgS;

void setup(){
  size(800,550);
  imgK=loadImage("kirito.png");
  imgA=loadImage("asuna.png");
  imgS=loadImage("sinon.png");
}

void draw(){
  background(77, 153, 0);
  for(int i= -400; i <500;i+=50){ //lineas "pared"
    line(0,i, 1000,100+i/7);    //lineas "piso"
  }
  for(int j= 0; j<20; j++){
    line(47*j,450-13.5*j,200+j*250,600);
  }
  stroke(0, 26, 0);
  image(imgS,150,150);
  image(imgK,350,100);
  image(imgA,550,50);
  noFill();
  rectMode(CENTER);
  rect(mouseX,mouseY, 200, 272);
}
