

int w=700;
int h=400;
int value= 0;

void setup(){
  size(700,400);
  w=width;
  h=height;
}

PGraphics crearCognitivo(int inicio){
  PGraphics pg=createGraphics(2*w, h);
  pg.beginDraw();
  boolean negro=false;
  for(int i=inicio;i < w; i+=40){  //fila de cuadros
    if(negro)      //color negro
      pg.fill(0);
    else
      pg.fill(255);  //color blanco
    pg.rect(i,0,40,40);   //hace un cuadrado
    negro=!negro;      //cambia color
  }
  pg.stroke(170,170,170);    //lineas de las filas
  pg.strokeWeight(4);
  pg.line(0,0,w,0);
  pg.endDraw();
  return pg;
}

void draw(){
  int pos=(-w/2)-mouseX;
  for(int j=0;j < h; j+=160){
    image(crearCognitivo(0),0,j);      //fila no se mueve
    image(crearCognitivo(pos/4),0,j+40);  //se mueve con el mouse
    image(crearCognitivo(pos/2),0,j+80);
    image(crearCognitivo(pos/4),0,j+120);
  }
}
