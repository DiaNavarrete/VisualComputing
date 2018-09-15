  PImage img;
  int h;
  int w;
  float op=0;
  PGraphics cala;
  
void setup(){
  size(460,600);
  img=loadImage("calabera.jpg");
  h=img.height;
  w=img.width;
  op=0;
  cala = createGraphics(w, h);
}


void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  op+=e; 
  if(op>10) op=10;  //maximo 10
  if(op<0) op=0;    //minimo 0
}

void draw(){
  image(img,0,0);
  cala.beginDraw();
  cala.clear();
  cala.noFill();
  cala.stroke(42, 40, 27);
  cala.strokeWeight(op/2);
  //borde calabera
  cala.curve(-115,434, 64,329, 50,222, 0,0);
  cala.curve(128,428, 70,352, 64,329, 49,403);
  cala.curve(312,662, 50,222, 235,24, 674,314);
  cala.curve(-10,284, 236,24, 402,238, 78,996);
  cala.stroke(62, 58, 31);
  cala.curve(488,244, 403,238, 386,352, 400,742);
  cala.stroke(64, 52, 36);
  cala.curve(490,214, 387,352, 360,372, 416,372);
  cala.stroke(60,49,17);
  cala.curve(478,412, 360,372, 332,474, 278,888);
  cala.stroke(71,61,34);
  cala.curve(558,106, 332,474, 130,470, 0,120);
  cala.stroke(56,55,35);
  cala.curve(252,928, 130,470, 70,352, -180,286);
  //borde ojos
  cala.stroke(65, 58, 42);
  cala.curve(78,284, 112,300, 168,302, 370,330);
  cala.curve(78,284, 168,302, 184,228, 124,284);
  cala.curve(280,380, 184,228, 114,226, 146,306);
  cala.curve(246,128, 114,226, 112,300, 132,280);
  cala.stroke(61, 60, 40);
  cala.curve(246,302, 323, 303, 344,292, 396,276);
  cala.curve(250,376, 344,292, 348,242, 346,308);
  cala.curve(280,394, 348,242, 288, 206, 196,304);
  cala.stroke(60, 58, 43);
  cala.curve(624,134, 288, 206, 270,296, 276, 190);
  //borde nariz
  cala.strokeWeight(op/3);
  cala.stroke(41, 46, 42);
  cala.curve(156,278, 248,334, 224,356, 102,262);
  cala.curve(234, 268, 224,356, 220,332, 432,262);
  cala.curve(252,492, 246,310, 222,310, 268,560);
  cala.strokeWeight(op/4);
  cala.stroke(113, 97, 72);
  cala.curve(48,342, 146,418, 326,418, 706, 222);
  cala.curve(202,400, 244, 418, 254,462, 350,586);
  cala.curve(202,400, 264,420, 271,454, 350,586);
  cala.curve(202,400, 226,424, 232,462, 238,552);
  cala.curve(178,434, 210,420, 218,460, 230,614);
  cala.curve(178,434, 186, 414, 196, 456, 290,642);
  cala.curve(184,388, 172, 418, 180,454, 188, 616);
  cala.curve(288,470, 284,452, 278,418, 242,378);
  cala.curve(288,432, 300, 416, 298,444, 306,358);
  cala.curve(288,432, 310, 438, 310,426, 298,454);
  cala.curve(208,492, 164, 434, 158, 418,140, 440);
  cala.endDraw();
//mouseX*2,mouseY*2

  filter(BLUR, op);
  image(cala,0,0);
  if(op>0)
  println(mouseX*2 + " " + mouseY*2);
}
