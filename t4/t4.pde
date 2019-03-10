
import frames.primitives.*;
import frames.core.*;
import frames.core.constraint.*;
import frames.processing.*;

Scene scene;
AxisPlaneConstraint constraint = new AxisPlaneConstraint();

int w=50;
int h=350;
boolean mostrar=true;
PImage img;
PImage imgbg; ///imagen background
Frame conilu;  //frame default
int x,y;
Bici bici;
 
void setup(){
  size(1000, 600, P3D);
  img=loadImage("calle.jpg");
  imgbg=loadImage("cielo3.jpg");
  scene = new Scene(this);
  scene.setFieldOfView(PI / 3);
  scene.setRadius(400);
  scene.fitBallInterpolation();
  constraint = new LocalConstraint();
  scene.eye().setConstraint(constraint);
  conilu=new Frame(scene);
  conilu=scene.eye().get();
  bici=new Bici(new Vector(0,300,0));
  x=0;
  y=0;
}

void draw(){
  background(imgbg);//255,255,255);// reinicia el fondo a blanco
  sphere(7);  //centro
  lights();
  pushStyle();
  noStroke();       //sin lineas de borde
  fill(151, 110, 255);  //color relleno
  drawBox();
  popStyle();
  conilu=scene.eye().get();
  bici.render();
  fill(255, 255, 255);    //color texto
  scene.beginHUD();
  scene.disableDepthTest();
  displayText();
  scene.enableDepthTest();
  scene.endHUD();
}
void drawBox(){    //dibuja el cubo
  rotateX(radians(-27));
  rotateY(radians(-31));
  texture(img);
  //h-v f-b-r-l d-t   (horizontal,vertical, front,back,rigth,left,down,top) 
  pushMatrix();
  translate(h/2,0,h/2);
  box(w, h+w,w);  //v f r
  popMatrix();
  pushMatrix();
  translate(0,-h/2,h/2);
  box(h+w,w,w);  //h f t    
  popMatrix();
  //fill(200,0,255);
  scene.disableDepthTest();
  pushMatrix();
  translate(0,h/2,-h/2);
  box(h-w,w,w);  //h b d
  popMatrix();
  pushMatrix();
  translate(-h/2,0,-h/2);
  box(w, h+w,w);  //v b l
  popMatrix();
  scene.enableDepthTest();
  pushMatrix();
  translate(-h/2,h/2,0);
  box(w, w,h-w);  //h l d
  popMatrix();
  pushMatrix();
  translate(0,h/2,h/2);
  box(h+w,w,w);  //h f d    
  popMatrix();
  pushMatrix();
  translate(h/2,h/2,0);
  box(w, w,h+w);  //h r d
  popMatrix();
  pushMatrix();
  translate(h/2,0,-h/2);
  box(w, h+w,w);  //v b r
  popMatrix();
  pushMatrix();
  translate(-h/2,0,h/2);
  box(w, h+w,w);  //v f l
  popMatrix();
  pushMatrix();
  translate(h/2,-h/2,0);
  box(w, w,h+w);  //h r t
  popMatrix();
  pushMatrix();
  translate(-h/2,-h/2,0);
  box(w, w,h+w);  //h l t
  popMatrix();
  pushMatrix();
  translate(0,-h/2,-h/2);
  box(h+w,w,w);  //h b t
  popMatrix();
}

void mouseClicked() {
  mostrar=!mostrar;
 // scene.setEye(conilu);
}

void keyPressed() {
  switch (key) {
  case ' ':
    println("reset scene");
     scene.setEye(conilu);
    // scene.eye().setReference(conilu);
    break;
  case 'r':
    constraint.setRotationConstraintType(nextRotationConstraintType(constraint.rotationConstraintType()));    
    Vector dir = new Vector(0.0f, 1.0f, 0.0f);
    constraint.setRotationConstraintDirection(dir);
    break;
  case CODED:
    if(keyCode==UP) y+=1;
    else if(keyCode==UP) y+=1;
    else if(keyCode==DOWN) y-=1;
    else if(keyCode==LEFT) x-=1;
    else if(keyCode==RIGHT) x+=1;
    println(x,y);
    break;
  }
}


static AxisPlaneConstraint.Type nextRotationConstraintType(AxisPlaneConstraint.Type type) {
  AxisPlaneConstraint.Type rType;
  switch (type) {
  case FREE:
    rType = AxisPlaneConstraint.Type.AXIS;
    break;
  case AXIS:
    rType = AxisPlaneConstraint.Type.FREE;
    break;
  default:
    rType = AxisPlaneConstraint.Type.AXIS;
  }
  return rType;
}

void mouseDragged() {
 // if (scene.eye().reference() == null)
    if (mouseButton == LEFT)
      // same as: scene.spin(scene.eye());
      scene.spin();
    else if (mouseButton == RIGHT)
      // same as: scene.translate(scene.eye());
      scene.translate();
}
void mouseWheel(MouseEvent event) {
  scene.zoom(event.getCount() * 20);
}


void displayType(AxisPlaneConstraint.Type type, int x, int y, String c) {
  String textToDisplay = c;
  switch (type) {
  case FREE:
    textToDisplay += "FREE";
    break;
  case AXIS:
    textToDisplay += "AXIS";
    break;
  default:
    break;
  }
  text(textToDisplay, x, y);
}

void displayText() {
  displayType(constraint.rotationConstraintType(), 30, 50, "Rotate (R)=");

}
