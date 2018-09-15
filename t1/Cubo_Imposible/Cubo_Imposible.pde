
int ancho=20;
int largo=200;
boolean mostrar=true;
 
void setup(){
  size(1000, 600, P3D);
}
void draw(){
  background(255,255,255);// reinicia el fondo a blanco
  lights();
  translate(500, 200, 0); //mover al centro
  fill(191, 128, 255);  //color relleno
  noStroke();       //sin lineas de borde
  
  //tapa
  rotateX(5.8);
  rotateY(-PI/8);
  if(!mostrar){      //gira de frente
    rotateY(PI/8);
  }
  box(largo, ancho, ancho);
  
  translate(90, 90, 0); 
  box(ancho, largo, ancho);
  
  translate(-90, 90, 0); 
  box(largo, ancho, ancho);
  
  translate(-90, -90, 0); 
  box(ancho, largo, ancho);
  
  //tapa
  translate(90,-90,200);
  box(largo, ancho, ancho);
  
  translate(90, 90, 0); 
  box(ancho, largo, ancho);
  
  translate(-90, 90, 0); 
  box(largo, ancho, ancho);

  translate(-90, -90, 0); 
  box(ancho, largo, ancho);
  //tapa
  rotateY(PI/2);
  translate(100, -90, 0); 
  box(largo, ancho, ancho);
  
  translate(100, 90, 0); 
  box(ancho, largo, ancho);
  
  translate(-100, 90, 0); 
  box(largo, ancho, ancho);
  
  translate(-100, -90, 0); 
  box(ancho, largo, ancho);
  
   //tapa
  translate(100, -90, 180); 
  box(largo, ancho, ancho);
  
  translate(100, 90, 0); 
  box(ancho, largo, ancho);
  
  translate(-100, 90, 0); 
  box(largo, ancho, ancho);
  
  translate(-100, -90, 0); 
  box(ancho, largo, ancho);
  
  if(mostrar){        //muestra ilusion
    translate(-20,-67,0);
    box(ancho*0.5, ancho*0.5, largo*0.42);
    translate(0,-45,-47);
    box(ancho*0.5, largo*0.4, ancho*0.5);
  }
}

void mouseClicked() {
  mostrar=!mostrar;
}
