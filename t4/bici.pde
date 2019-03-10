class Bici{
  public Frame frame;
  Vector position;
  PShape shapeBici,silla,ruedas;
  
  Bici(Vector inipos){
    position = new Vector();
    position.set(inipos);
    shapeBici=createShape(GROUP); 
    frame = new Frame(scene);
    frame.setPosition(new Vector(position.x(), position.y(), position.z()));
  }
  
  void move(){
    frame.setPosition(position);
    
  }
  
  void checkBounds(){
  }
  
  void render(){
    pushStyle();
    noFill();
    strokeWeight(10);
    ellipseMode(CENTER);
    silla=createShape();
    silla.beginShape(TRIANGLE_STRIP);
    silla.vertex(40,-100,20);
    silla.vertex(40,-100,-20);
    silla.vertex(70,-100,0);
    silla.vertex(40,-90,20);
    silla.vertex(40,-90,-20);
    silla.endShape(CLOSE);
    silla.setFill(color(0));
    shapeBici.addChild(silla);
    shapeBici.addChild(createShape(ELLIPSE,0,0,50,50));//rueda de atras
    shapeBici.addChild(createShape(ELLIPSE,100,-20,90,90)); //rueda de adelante
    pushStyle();
    stroke(128,0,0);
    shapeBici.addChild(createShape(LINE,100,-20,0,100,-130,0));  //vertical
    shapeBici.addChild(createShape(LINE,100,-130,50,100,-130,-50));  //horizontal
    shapeBici.addChild(createShape(ARC,100, 0, 200, 200, PI, PI+HALF_PI)); //arco
    popStyle();
    shape(shapeBici);
  }
}
