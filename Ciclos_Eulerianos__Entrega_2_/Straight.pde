class Straight extends Line {
  Straight (Node node1, Node node2, int aux_line1, int aux_line2) {
    super(node1, node2, aux_line1, aux_line2);
  }

  @Override
    void display() {
    pushStyle();
    strokeWeight(10);
    if (aux1 == 0) stroke(0, 70);
    else stroke(0, 250, 0);
    line(origin.position.x, origin.position.y, end.position.x, end.position.y);
    if(aux2 == 1) {
      noStroke();
      fill(0, 70);
      triangle(origin.position.x, origin.position.y, origin.position.x - 30, origin.position.y - 15, origin.position.x - 30, origin.position.y + 15);
    }
    popStyle();
  }
}