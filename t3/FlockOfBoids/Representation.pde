class Vertex{
  IntList adjacent; //Lista de objetos adyacentes al vertice
  Vector vertex;
  
  Vertex(Vector vertex_, IntList adjacent_){
    this.adjacent=adjacent_;
    this.vertex=vertex_;
  }
}

public class VertexVertex {
  ArrayList<Vertex> vertexList; //lista de los vertices con sus vertices adyacentes
  
  
  
  VertexVertex(ArrayList<Vertex> vertexList_){
    this.vertexList=vertexList_;
  }
  
  void renderInmediate(){  // renderizacion modo inmediato
    for(Vertex v :vertexList){  // recorre lista de vertices
      for(int adj: v.adjacent){    // recorre lista de vertices adyacentes a un vertice
        Vertex vadj=vertexList.get(adj);   // obtiene el vertice adyacente
        //crea la linea entre el vertice y su adyacente
        line(v.vertex.x(), v.vertex.y(),v.vertex.z(), vadj.vertex.x(), vadj.vertex.y(), vadj.vertex.z());
      }
    }
  }
  PShape renderRetained(){    // renderizacion modo retenido
    PShape shapeVertex = createShape();
    shapeVertex.beginShape(TRIANGLE_STRIP);    //crea el shape
    for(Vertex v :vertexList){  // recorre lista de vertices
      for(int adj: v.adjacent){    // recorre lista de vertices adyacentes a un vertice
        Vertex vadj=vertexList.get(adj);   // obtiene el vertice adyacente
        shapeVertex.vertex(v.vertex.x(), v.vertex.y(),v.vertex.z());  //vertice actual
        shapeVertex.vertex(vadj.vertex.x(), vadj.vertex.y(), vadj.vertex.z());  // vertice adjacente
      }
    }
    shapeVertex.endShape();
    return shapeVertex;
  }  
}

class Face{
  Vector v1;
  Vector v2;
  Vector v3;
  Face(Vector v1_, Vector v2_, Vector v3_){
    this.v1=v1_;
    this.v2=v2_;
    this.v3=v3_;
  }
}

public class FaceVertex {
  ArrayList<Vertex> vertexList; //lista de los vertices con sus caras adjacentes
  ArrayList<Face> faceList; //lista de las caras con sus vertices 
  
  FaceVertex(ArrayList<Vertex> vertexList_, ArrayList<Face> faceList_){
    this.vertexList=vertexList_;
    this.faceList=faceList_;
  }

  
  void renderInmediate(){  // renderizacion modo inmediato
    for(Face cadj: faceList){ //recorre la lista de vertices que tiene una cara
      beginShape(TRIANGLE_STRIP);    // crea la cara 
      vertex(cadj.v1.x(), cadj.v1.y(), cadj.v1.z());
      vertex(cadj.v2.x(), cadj.v2.y(), cadj.v2.z());
      vertex(cadj.v3.x(), cadj.v3.y(), cadj.v3.z());
      endShape();
    }
  }
  PShape renderRetained(){    // renderizacion modo retenido
    PShape shapeFace = createShape();
    shapeFace.beginShape();  
    for(Face cadj: faceList){ //recorre la lista de vertices que tiene una cara 
      vertex(cadj.v1.x(), cadj.v1.y(), cadj.v1.z());
      vertex(cadj.v2.x(), cadj.v2.y(), cadj.v2.z());
      vertex(cadj.v3.x(), cadj.v3.y(), cadj.v3.z());
      
    }
    shapeFace.endShape();
    return shapeFace;
  }  
}
