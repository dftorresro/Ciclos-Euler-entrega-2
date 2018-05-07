Table level = new Table();
ArrayList <Graph> levels = new ArrayList();
ArrayList <Line> lines = new ArrayList();
ArrayList<Node> nodes = new ArrayList();
int menu, aux_line, aux_table, col;
float line[] = new float [4];
int [][] matrix;
TableRow newRow = level.addRow();

void setup() {
  size(600, 600);
  background(0);
}

void draw() {
  textSize(50);
  fill(120, 20);
  text("CICLOS EULERIANOS", 60, 80);
  text("CREADOR", 190, 130);
  noFill();
  rect(10, 10, 580, 580);
  textSize(23);
  text("Click para colocar nodo. ENTER para continuar", 40, 540);
}

void mouseClicked() {
  PVector Click = new PVector(mouseX, mouseY);
  if (menu == 0) levels.add(new Graph(Click));
  if (menu == 1) {
    levels.add(new Graph(Click));
    lines.add(new Line(Click));
  }
}

void keyPressed() {
  if (menu == 0 || menu == 1) menu ++;
  if (menu == 2) set_table();
  if ( key == 'E' ||key == 'e') exit();
}

void set_table() {
  println("Setting table.../Volumes/DANIEL T/Ciclos_Eulerianos__Entrega_2_/data/Nivel(Creado).csv");
  for (int i = 0; i < nodes.size(); i++) {
    for (int j = 0; j < nodes.size(); j++) {
      level.setFloat(i+2, j, matrix[i][j]);
    }
  }
  saveTable(level, "/Volumes/DANIEL T/Ciclos_Eulerianos__Entrega_2_/data/Nivel(Creado).csv");
  print("Press E to exit.");
}