class Circle extends Node {
  Circle (PVector pos, int size) {
    super(pos, size);
  }

  @Override
    void display() {
    pushStyle();
    strokeWeight(5);
    stroke(#1B8121);
    fill(#1B8121);
    if (pick(mouseX, mouseY)) stroke(#19CE20);
    ellipse(position.x, position.y, size, size);
    popStyle();
  }

  @Override
    boolean pick(int x, int y) {
    return sqrt(sq(x-position().x) + sq(y-position().y)) <= size()/2;
  }

  @Override
    void select(float draw_aux[]) {
    if (draw_pos == 0) {
      draw_aux[0]=position.x;
      draw_aux[1]=position.y;
    } else {
      draw_aux[2]=position.x;
      draw_aux[3]=position.y;
    }
  }
}