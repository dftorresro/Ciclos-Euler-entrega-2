class Graph {
  PVector click;
  Graph(PVector pos) {
    if (menu == 0) {
      click = pos;
      nodes.add(new Node(click));
      table_coord();
    } else if (menu == 1) {
      if (aux_table == 0) matrix = new int [nodes.size()][nodes.size()];
      aux_table = 1;
      for (int x = 0; x < nodes.size(); x++) {
        if ((abs(nodes.get(x).click.x - mouseX) <= 15) && (abs(nodes.get(x).click.y - mouseY) <= 15)) {
          table_matrix();
          print_matrix();
        }
      }
    }
  }

  void display() {
  }

  void table_coord() {
    level.addColumn();      
    level.setFloat(0, col, click.x);
    level.setFloat(1, col, click.y);
    col++;
  }

  void table_matrix() {

    for (int i = 0; i < nodes.size(); i++) 
      for (int j = 0; j < nodes.size(); j++) 
        if (i == j) matrix[i][j] = -5;

    for (int i = 0; i < nodes.size(); i++) {
      if ((mouseX >= nodes.get(i).click.x-15 && mouseX <= nodes.get(i).click.x+15) && (mouseY >= nodes.get(i).click.y-15 && mouseY <= nodes.get(i).click.y+15)) {
        for (int j = 0; j < nodes.size(); j++) {
          if ((line[2] >= nodes.get(j).click.x-15 && line[2] <= nodes.get(j).click.x+15) && (line[3] >= nodes.get(j).click.y-10 && line[3] <= nodes.get(j).click.y+15)) {
            matrix[i][j] = 1;
            matrix[j][i] = 1;
          }
        }
      }
    }
  }

  void print_matrix() {
    for (int i = 0; i < nodes.size(); i++) {
      for (int j = 0; j < nodes.size(); j++) {
        print(matrix[i][j]);
      }
      println();
    }
    println();
  }
}