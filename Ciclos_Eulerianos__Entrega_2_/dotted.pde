class Dotted extends Line {
  Dotted (Node node1, Node node2, int aux_line1, int aux_line2) {
    super(node1, node2, aux_line1, aux_line2);
  }

  @Override
    void display() {
    strokeWeight(5);
    noStroke();
    if (aux1 == 0) graph();
    if (aux1 == 1) one_time();
    if (aux1 == 2) two_times();
  }

  void graph() {
    fill(0, 70);
    for (int i = 0; i <= 10; i++) {
      float x = lerp(origin.position.x, end.position.x, i/10.0);
      float y = lerp(origin.position.y, end.position.y, i/10.0);
      ellipse(x, y, 10, 10);
    }
  }

  void one_time() {
    fill(0, 0, 250);
    for (int i = 0; i <= 10; i++) {
      float x = lerp(origin.position.x, end.position.x, i/10.0);
      float y = lerp(origin.position.y, end.position.y, i/10.0);
      ellipse(x, y, 10, 10);
    }
  }

  void two_times() {
    fill(0, 250, 0);
    for (int i = 0; i <= 10; i++) {
      float x = lerp(origin.position.x, end.position.x, i/10.0);
      float y = lerp(origin.position.y, end.position.y, i/10.0);
      ellipse(x, y, 10, 10);
    }
  }
}