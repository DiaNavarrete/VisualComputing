PGraphics pg;
int w,h;
int op=0;

void setup(){
  size(500,400);
  w=width;
  h=height;
  pg = createGraphics(w, h);

}

void draw(){
  noStroke();
  for(int j= 0; j<=h; j+=30){ //piso
    for(int i=0; i<= w; i+=50){
      fill(0);
      quad(i+25,j,i,j+15,i-25,j,i,j-15);
      fill(255);
      quad(i+50,j+15,i+25,j+30,i,j+15, i+25,j);
    }
  }
  stroke(0);
  strokeWeight(3);
  fill(102, 153, 204);
  triangle(-50*7,0,200,315,w+50*5,0);
  fill(0);
  for(int j= 315,i=0; j>0; j-=20,i++){  //barandas
    line(200+i*35,j,200+i*35,j-30);
    line(200-i*35,j,200-i*35,j-30);
  }
  
  strokeWeight(8);
  line(200,313,200,283);
  line(200,283,0,165);
  line(200,283,w,110);
  stroke(50*op);
  fill(50*op);
  ellipse(295,180, 17, 20);  //cabeza
  stroke(100*op);
  fill(100*op);
  quad(308,226,307,260,295,262,293,228); //piernas
  stroke(80*op);
  fill(80*op);
  rect(290, 195, 20, 35, 25, 3, 1, 1); //cuerpo
  noFill();
  stroke(255);
  strokeWeight(1);
  if(op==1)
  {
    line(291,235,312,232);
    line(302,247,303,269);
    curve(269,214,295,189,282,177,248,230);
    curve(423,207,292,265,312,263,258,212);
  }
  if(op==2)
  {
    curve(302,222,283,179,306,177,288,219);
    line(291,235,312,232);
    line(302,247,302,255);
    strokeWeight(8);
    stroke(0);
    line(320,214,281,236);
    strokeWeight(3);
    line(200+3*35,255,200+3*35,225);
    noStroke();
    fill(0);
    quad(325,270,300,285,277,270,300,257);
    fill(255);
    quad(350,255,325,270,300,257,325,245);
    stroke(0);
    strokeWeight(3);
    line(280,270,330,240);
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP)
      op=1;
    else if (keyCode == DOWN) 
      op=2;
    else
      op=0;
  } 
}
