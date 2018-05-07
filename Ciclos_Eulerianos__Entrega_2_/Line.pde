abstract class Line {
  Node origin, end;
  Table usuario;
  int aux1, aux2;
  Line(Node node1, Node node2, int aux_line1, int aux_line2) {
    origin = node1;
    end = node2;
    aux1 = aux_line1;
    aux2 = aux_line2;
  }

  abstract void display();  

  Node origin() {
    return origin;
  }

  Node end() {
    return end;
  }
}