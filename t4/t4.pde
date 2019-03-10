
import frames.primitives.*;
import frames.core.*;
import frames.core.constraint.*;
import frames.processing.*;

Scene scene;

int ancho=20;
int largo=200;
boolean mostrar=true;

 
void setup(){
  size(1000, 600, P3D);
  
  scene = new Scene(this);
  scene.setFieldOfView(PI / 3);
  scene.setRadius(400);
  scene.fitBallInterpolation();
  scene.eye().setConstraint(new WorldConstraint());
}
void draw(){
  background(255,255,255);// reinicia el fondo a blanco
  lights();
  noStroke();       //sin lineas de borde
  fill(191, 128, 255);  //color relleno
  box(5,5,5);
  pushMatrix();
  translate(ancho/2,ancho/2,ancho/2);
  box(largo,ancho,ancho);
  popMatrix();
  /*
  //translate(500, 200, 0); //mover al centro
  box(largo+ancho, ancho, ancho);  //horizontal arriba fondo
  
  pushMatrix();     //horizontal z arriba der 
  translate(largo/2,0,largo/2);
  box(ancho,ancho,largo+ancho);
  popMatrix();  
  
  pushMatrix();    //horizontal z arriba izq
  translate(-largo/2,0,largo/2);
  box(ancho,ancho,largo+ancho);
  popMatrix();
  
  pushMatrix();  //horizontal arriba frente
  translate(0,0,largo);
  box(largo+ancho,ancho,ancho);
  popMatrix();
  
  
  /*
  translate(500, 200, 0); //mover al centro
  
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
  }*/
}

void mouseClicked() {
  mostrar=!mostrar;
}

// 'first-person' interaction
void mouseDragged() {
  if (scene.eye().reference() == null)
    if (mouseButton == LEFT)
      // same as: scene.spin(scene.eye());
      scene.spin();
    else if (mouseButton == RIGHT)
      // same as: scene.translate(scene.eye());
      scene.translate();
    else
      // same as: scene.zoom(mouseX - pmouseX, scene.eye());
      scene.zoom(mouseX - pmouseX);
}
