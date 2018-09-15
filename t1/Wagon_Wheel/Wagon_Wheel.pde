
int w=700;
int h=600;
PGraphics pg;
float vel=0.2;
float mov=0;
void setup(){
  size(700,600);
  w=width;
  h=height;
  pg=createGraphics(w, h);

  
}
void draw(){
  pg.beginDraw();
  pg.translate(w/2,h/2);    //centraliza
  pg.background(255,255,255);// reinicia el fondo a blanco
  pg.fill(0);      //figura de negro
  pg.rotate(radians(mov));  //rota segun mov
  for (int i = 0; i < 8; i ++) {
    pg.rotate(radians(i*45));//i*PI/4)    //rota cada 45°
    pg.quad(-7,7,7,7,40,200,-40,200);    //dibuja cada helice
  }
  pg.endDraw();
  image(pg,0,0);
  mov+=vel;
  vel+=0.2;
}
