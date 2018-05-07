class Graph {
  Node [] nodes;
  ArrayList<Line> lines = new ArrayList();
  int lines_num = 0, cont, win, y;
  float [] draw_aux = new float [4];
  Table level;
  color line;
  int user [][];

  Graph(String file) {

    level = loadTable(file);
    nodes = new Node[level.getColumnCount()];
    user = new int[level.getColumnCount()][level.getColumnCount()];

    for (int i = 0; i < level.getColumnCount(); i++) {
      PVector position = new PVector(level.getInt(0, i), level.getInt(1, i));
      //if (rand == 0)nodes[i] = new Rectangle(position, 20);
      //if (rand == 1)nodes[i] = new Circle(position, 20);
      //if (rand == 2)nodes[i] = new Triangle(position, 20);
      nodes[i] = new Rectangle(position, 20);
    }

    for (int i = 0; i < level.getColumnCount(); i++) 
      for (int j = 0; j < level.getColumnCount(); j++) {
        int value = level.getInt(i + 2, j);
        if (value == 1) { 
          if (level.getInt(i + 2, j) == level.getInt(j + 2, i)) lines.add(new Straight(nodes[i], nodes[j], 0, 0));
          else lines.add(new Straight(nodes[i], nodes[j], 0, 1));
        }
        if (value == 2) lines.add(new Dotted(nodes[i], nodes[j], 0, 0));
        if (value == 3) lines.add(new Curve(nodes[i], nodes[j], 0, 0));
      }
  }

  void play() {
    if (draw_pos == 0)first_Click();
    else next_Click();
    print(win);
    print("    ");
    println(cont);
    if (win == cont) menu = 2;
  }

  void display() {
    pushStyle();
    strokeWeight(10);
    stroke(255, 255, 0);
    for (int i = 0; i < lines.size(); i++) lines.get(i).display();
    for (int i = 0; i < nodes.length; i++) nodes[i].display();
    popStyle();
  }

  void first_Click() {
    for (int i = 0; i < nodes.length; i ++) 
      if ((abs(nodes[i].position.x - mouseX) <= 10) && (abs(nodes[i].position.y - mouseY) <= 10)) {
        nodes[i].select(draw_aux);
        y = i;
        draw_pos ++;
      }

    for (int row = 0; row < level.getColumnCount(); row ++) 
      for (int col = 0; col < level.getColumnCount(); col ++)  
        if (level.getInt(row + 2, col) == 1 || level.getInt(row + 2, col) == 3) {
          if (level.getInt(row + 2, col) == level.getInt(col + 2, row)) win += 1;
          else win += 2;
        } else if (level.getInt(row + 2, col) == 2) win += 2;
    win /= 2;
  }

  void next_Click() {
    draw_lines();
    user_matrix();
    comparison();
  }

  void draw_lines() {  
    for (int x = 0; x < nodes.length; x++) 
      if ((abs(nodes[x].position.x - mouseX) <= 15) && (abs(nodes[x].position.y - mouseY) <= 15)) {
        cont ++;
        nodes[x].select(draw_aux);
        int value = level.getInt(x + 2, y);
        if (value == 1) lines.add(new Straight(nodes[x], nodes[y], 1, 0));
        if (value == 2) {
          if (user[x][y] == 0)lines.add(new Dotted(nodes[x], nodes[y], 1, 0));
          if (user[x][y] == 1)lines.add(new Dotted(nodes[x], nodes[y], 2, 0));
        } 
        if (value == 3) lines.add(new Curve(nodes[x], nodes[y], 1, 0));
        y = x;
      }
  }

  void user_matrix() {
    for (int i = 0; i < nodes.length; i++) {
      user[i][i] = -5;
      if ((abs(draw_aux[0] - nodes[i].position.x) <= 10) && (abs(draw_aux[1] - nodes[i].position.y) <= 10)) 
        for (int j = 0; j < nodes.length; j++) 
          if ((abs(draw_aux[2] - nodes[j].position.x) <= 10) && (abs(draw_aux[3] - nodes[j].position.y) <= 10)) {
            if (level.getInt(i + 2, j) == level.getInt(j + 2, i)) {
              user[i][j] += 1;
              user[j][i] += 1;
            } else user[i][j] += 1;
          }
    }
    //for (int i = 0; i < nodes.length; i ++) {
    //  for (int j = 0; j < nodes.length; j ++) {
    //    print(user[i][j]);
    //  }
    //  println();
    //}
  }  

  void comparison() {
    for (int row = 0; row < level.getColumnCount(); row ++) 
      for (int col = 0; col < level.getColumnCount(); col ++) { 
        if (level.getInt(row + 2, col) == level.getInt(col + 2, row)) {
          if (user[row][col] > level.getInt(row + 2, col)) menu = 3;
        } else if (user[row][col] > level.getInt(row + 2, col)) menu = 3;
      }
  }
}