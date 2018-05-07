class Curve extends Line {
  Curve (Node node1, Node node2, int aux_line1, int aux_line2) {
    super(node1, node2, aux_line1, aux_line2);
  }

  @Override
    void display() {
    pushStyle();
    noFill();
    strokeWeight(10);
    if (aux1 == 0) stroke(0, 100);
    if (aux1 == 1) stroke(0, 250, 0);
    curveTightness(-2);
    curve(origin.position.x + 100, origin.position.y - 100, origin.position.x, origin.position.y, end.position.x, end.position.y, end.position.x + 100, end.position.y + 100);
    popStyle();
  }

}