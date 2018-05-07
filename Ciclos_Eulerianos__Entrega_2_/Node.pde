abstract class Node {
  PVector position;
  float size;

  Node(PVector position, int size) {
    setPosition(position);
    setSize(size);
  }

  abstract void display();
  abstract boolean pick(int x, int y);
  abstract void select(float draw_aux[]);

  void setPosition(PVector pos) {
    position = pos;
  }

  void setPosition(float x, float y) {
    setPosition(new PVector(x, y));
  }

  void setSize(float s) {
    size = s;
  }

  PVector position() {
    return position;
  }

  float size() {
    return size;
  }
}