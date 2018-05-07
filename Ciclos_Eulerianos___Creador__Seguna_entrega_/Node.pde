class Node {
  int x, y;
  PVector click;
  Node(PVector pos) {
    click = pos;
    display();
  }

  void display() {
    strokeWeight(10);
    stroke(250);
    fill(250);
    ellipse(click.x, click.y, 20, 20);
  }
}