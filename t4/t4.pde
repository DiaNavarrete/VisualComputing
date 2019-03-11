
import frames.primitives.*;
import frames.core.*;
import frames.core.constraint.*;
import frames.processing.*;

Scene scene;
AxisPlaneConstraint constraint = new AxisPlaneConstraint();

int w=50;
int h=350;
boolean mostrar=true;
PImage img, piedra, zebra, rueda, imgbg; ///imagen background
Frame conilu;  //frame default
PShape bici;
ArrayList<Integer> direcciones;
ArrayList<String> dirname;
int x,y, vel;
int dir;  //0r, 1u,2l, 3d
 
void setup(){
  size(1000, 600, P3D);
  imgbg=loadImage("cielo.jpg");
  img=loadImage("calle.jpg");
  piedra=loadImage("piedra.jpg");
  zebra=loadImage("zebra.jpg");
  //rueda=loadImage("rueda.png");
  dir=0;
  vel=1;
  direcciones=new ArrayList();
  direcciones.add(RIGHT);
  direcciones.add(UP);
  direcciones.add(LEFT);
  direcciones.add(DOWN);
  dirname=new ArrayList();
  dirname.add("RIGHT");
  dirname.add("UP");
  dirname.add("LEFT");
  dirname.add("DOWN");
  bici=drawBici();
  scene = new Scene(this);
  scene.setFieldOfView(PI / 3);
  scene.setRadius(400);
  scene.fitBallInterpolation();
  constraint = new LocalConstraint();
  scene.eye().setConstraint(constraint);
  conilu=new Frame(scene);
  conilu=scene.eye().get();
}

void draw(){
  //255,255,255);// reinicia el fondo a blanco
  background(imgbg);
  noFill();
  sphere(7);  //centro
  lights();
  drawBox();
  controlMove();
  pushMatrix();
  translate(-h/2+x,-h/2-w/4,h/2+w/4+y);
  rotateY(dir*HALF_PI);  //giro para la bici
  shape(bici);    //pinta la bici
  popMatrix();
  noLights();
  fill(255, 255, 255);    //color texto
  scene.beginHUD();
  displayText();
  scene.endHUD();
}
void drawBox(){    //dibuja el cubo
  PShape via;
  textureMode(IMAGE);
  pushStyle();
  noStroke();       //sin lineas de borde
  fill(151, 110, 255);  //color relleno
  rotateX(radians(-27));
  rotateY(radians(-31));
  //h-v-f-b-r-l-d-t =>  (horizontal,vertical, front,back,rigth,left,down,top) 
  pushMatrix();
  translate(h/2,0,h/2);
  via=createShape(BOX,w, h-w,w);  //v f r
  via.setTexture(piedra);
  shape(via);
  popMatrix();
  pushMatrix();
  translate(0,-h/2,h/2);
  via=createShape(BOX,h+w,w,w);  //h f t    
  via.setTexture(img);
  shape(via);
  popMatrix();
  pushMatrix();
  translate(h/2,-h/2,0);
  via=createShape(BOX,w, w,h-w);  //h r t
  via.setTexture(zebra);
  shape(via);
  popMatrix();
  scene.disableDepthTest();
  pushMatrix();
  translate(0,h/2,-h/2);
  via=createShape(BOX,h+w,w,w);  //h b d
  via.setTexture(img);
  shape(via);
  popMatrix();
  pushMatrix();
  translate(-h/2,h/2,0);
  via=createShape(BOX,w, w,h-w);  //h l d
  via.setTexture(zebra);
  shape(via);
  popMatrix();
  pushMatrix();
  translate(-h/2,0,-h/2);
  via=createShape(BOX,w, h-w,w);  //v b l
  via.setTexture(piedra);
  shape(via);
  popMatrix();
  scene.enableDepthTest();
  pushMatrix();
  translate(0,h/2,h/2);
  via=createShape(BOX,h+w,w,w);  //h f d    
  via.setTexture(img);
  shape(via);
  popMatrix();
  pushMatrix();
  translate(h/2,h/2,0);
  via=createShape(BOX,w, w,h-w);  //h r d
  via.setTexture(zebra); //setFill(color(107,110,117)
  shape(via);
  popMatrix();
  pushMatrix();
  translate(h/2,0,-h/2);
  via=createShape(BOX,w, h-w,w);  //v b r
  via.setTexture(piedra);
  shape(via);
  popMatrix();
  pushMatrix();
  translate(-h/2,0,h/2);
  via=createShape(BOX,w, h-w,w);  //v f l
  via.setTexture(piedra);
  shape(via);
  popMatrix();
  pushMatrix();
  translate(-h/2,-h/2,0);
  via=createShape(BOX,w, w,h-w);  //h l t
  via.setTexture(zebra);
  shape(via);
  popMatrix();
  pushMatrix();
  translate(0,-h/2,-h/2);
  via=createShape(BOX,h+w,w,w);  //h b t
  via.setTexture(img);
  shape(via);
  popMatrix();
  popStyle();
}


PShape drawBici(){
  PShape shapeBici=createShape(GROUP); 
  pushStyle();
  noFill();
  strokeWeight(5);
  ellipseMode(CENTER);
  PShape silla=createShape();
  silla.beginShape(TRIANGLE_STRIP);
  silla.vertex(-10,-53,5);
  silla.vertex(-10,-53,-5);
  silla.vertex(0,-52,0);
  silla.vertex(-10,-48,5);
  silla.vertex(-10,-53,5);
  silla.vertex(-10,-48,-5);
  silla.vertex(-10,-53,-5);
  silla.vertex(0,-52,0);
  silla.endShape(CLOSE);
  silla.setFill(color(0));
  PShape r=createShape(ELLIPSE,15,-29,30,30);
  shapeBici.addChild(silla);
  //shapeBici.addChild(createShape(LINE,-0,-25,0,0,-50,0));
  shapeBici.addChild(createShape(ELLIPSE,-18,-22,17,17));//rueda de atras
  shapeBici.addChild(createShape(ELLIPSE,15,-29,30,30)); //rueda de adelante
  pushStyle();
  stroke(128,0,0);
  shapeBici.addChild(createShape(LINE,15,-28,0,15,-60,0));  //vertical
  shapeBici.addChild(createShape(LINE,15,-60,15,15,-60,-15));  //horizontal
  shapeBici.addChild(createShape(ARC,15, -23, 67, 65, PI, PI+HALF_PI)); //arco
  popStyle();
  return shapeBici;
}

void controlMove(){  //mover mientras se mantenga oprimida la tecla
  if(keyPressed){
    if(keyCode==RIGHT && x<340) x+=vel;
    else if(keyCode==LEFT && x>5) x-=vel;
    else if(keyCode==UP && y >-345) y-=vel;
    else if(keyCode==DOWN && y <-18) y+=vel;
  }
}
void mouseClicked() {
  mostrar=!mostrar;
 // scene.setEye(conilu);
}

void keyPressed() {
  switch (key) {
  case ' ':
    println("reset scene");
     scene.eye().resetReference();
     scene.setEye(conilu.get());
     //scene.lookAt(scene.center());
     scene.fitBallInterpolation();
    break;
  case 'r':
    constraint.setRotationConstraintType(nextRotationConstraintType(constraint.rotationConstraintType()));    
    constraint.setRotationConstraintDirection(new Vector(0.0f, 1.0f, 0.0f));  //restricción de giro solo horizontal
    break;
  case 'v':
    vel=vel%3+1;
    break;
  case CODED:
    println(dir);
    int newdir=direcciones.indexOf(keyCode);
    if(newdir>-1){
      int dif=abs(dir-newdir);
      if(dif==1||dif==3) dir=newdir;
    }
   /* if(keyCode==UP) y+=1;
    else if(keyCode==UP) y-=1;
    else if(keyCode==DOWN) y+=1;
    else if(keyCode==LEFT) x-=1;
    else if(keyCode==RIGHT) x+=1;*/
    println(x,y);
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
  displayType(constraint.rotationConstraintType(), 30, 50, "Rotate ( R )=");
  text("Restart ( Espace )", 30, 65);
  text("Bicycle direction: "+ dirname.get(dir), 30,80);
  text("Bicycle velocity ( V ): "+vel + "x", 30,95);
  
}
