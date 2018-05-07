class Rectangle extends Node {
  Rectangle (PVector pos, int size) {
    super(pos, size);
  }

  @Override
    void display() {
    pushStyle();
    rectMode(CENTER);
    strokeWeight(5);
    stroke(#FF6F00);
    fill(#FF6F00);
    if (pick(mouseX, mouseY)) stroke(#FFB295);
    rect(position.x, position.y, 20, 20);
    popStyle();
  }

  @Override
  boolean pick(int x, int y) {
    return abs(x-position().x) <= size()/2 && abs(y-position().y) <= size()/2;
  }

  @Override
    void select(float draw_aux[]) {
    if (draw_pos != 0) {
      draw_aux[2] = draw_aux[0];
      draw_aux[3] = draw_aux[1];
      draw_aux[0] = position.x;
      draw_aux[1] = position.y;
    } else {
      draw_aux[0] = position.x;
      draw_aux[1] = position.y;
    }
  }
}