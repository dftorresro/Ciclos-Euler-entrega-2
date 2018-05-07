class Triangle extends Node {
  Triangle (PVector pos, int size) {
    super(pos, size);
  }

  @Override
    void display() {
    pushStyle();
    strokeWeight(5);
    stroke(#050BA5);
    fill(#050BA5);
    if (pick(mouseX, mouseY)) stroke(#6F74FF);
    triangle(position.x, position.y - 10, position.x - 10, position.y + 10, position.x + 10, position.y + 10);
    popStyle();
  }

  @Override
  boolean pick(int x, int y) {
    return abs(x-position().x) <= size()/2 && abs(y-position().y) <= size()/2;
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