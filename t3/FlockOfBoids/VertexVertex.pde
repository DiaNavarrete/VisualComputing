class VertexVertex {
  String id;
  Vector vertex;
  StringList vertexList;
  
  VertexVertex(float x, float y, float z, String idVertex){
    vertex= new Vector(x,y,z);
    vertexList= new StringList();
    id=idVertex;
  }
  @Override
  public String toString() {
      return "id: " + vertex.toString() + " |  " + vertexList;
  }
}
