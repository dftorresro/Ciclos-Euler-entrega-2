class Line {
  PVector origin, end;

  Line(PVector pos) {
    if (aux_line == 0) {
      line[2] = pos.x;
      line[3] = pos.y;
      aux_line = 1;
    } else {
      line[0] = line[2];
      line[1] = line[3];
      line[2] = pos.x;
      line[3] = pos.y;
      for (int x = 0; x < nodes.size(); x++) 
        if ((abs(nodes.get(x).click.x - mouseX) <= 10) && (abs(nodes.get(x).click.y - mouseY) <= 10)) display();
    }
  }

  void display() {
    fill(250);
    strokeWeight(5);
    strokeCap(ROUND);
    line(line[0], line[1], line[2], line[3]);
  }
}