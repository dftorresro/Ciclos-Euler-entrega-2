ArrayList<Graph> levels;
int current, draw_pos, menu, rand;
float angle, angle2;
//String[] tables ={"Nivel1(Cometa).csv", "Nivel2(Pez).csv", "Nivel3(Estrella).csv", "Nivel4(Cuadrado).csv", "Nivel(Creado).csv"};
String[] tables ={"Nivel(Creado).csv"};

void setup() {
  size(600, 600);
  rand = int(random(3));
  levels = new ArrayList<Graph>();
  for (int i = 0; i < tables.length; i++)
    levels.add(new Graph(tables[i]));
}

void draw() {
  background(250);
  if (menu == 0)menu_display();
  if (menu == 1)levels.get(current).display();
  if (menu == 2)win_display();
  if (menu == 3)lose_display();
}

void keyPressed() {
  clear();
}

void mouseClicked() {
  levels.get(levels.size()-1).play();
}

void menu_display() {
  pushMatrix();
  fill(0);
  rotate(angle);
  textSize(30);
  stroke(0, 70);
  strokeWeight(20);
  noFill();
  rect(-150, -150, 200, 200);
  fill(#1B8121);
  stroke(0, 70);
  ellipse(50, 50, 20, 20);
  ellipse(-150, -150, 20, 20);
  ellipse(50, -150, 20, 20);
  ellipse(-150, 50, 20, 20);
  popMatrix();
  angle += 0.01;

  pushMatrix();
  fill(0);
  rotate(angle2 + 180);
  stroke(0, 70);
  strokeWeight(20);
  noFill();
  rect(400, 400, 600, 600);
  rect(-400, -400, -600, -600);
  rect(400, 400, -600, -600);
  fill(#FF6F00);
  stroke(0, 70);
  rect(-210, -210, 20, 20);
  rect(390, -210, 20, 20);
  rect(390, 390, 20, 20);
  rect(-215, 390, 20, 20);
  popMatrix();
  angle2 -= 0.01;

  pushMatrix();
  noFill();
  stroke(#FF6F00);
  strokeWeight(15);
  rect(100, 250, 550, 150);
  textSize(40);
  text("CICLOS EULERIANOS", 160, 340);
  textSize(28);
  text("- Presione cualquier tecla para comenzar -", 10, 550);
  popMatrix();
}

void win_display() {
  redraw();
  stroke(#1A78E8);
  strokeWeight(5);
  fill(#1A78E8, 200);
  beginShape();
  vertex(5, 200);
  vertex(60, 300);
  vertex(5, 400);
  vertex(595, 400);
  vertex(540, 300);
  vertex(595, 200);
  vertex(5, 200);
  endShape();
  fill(250);
  textSize(85);
  text("¡GANASTE!", 80, 330);
}

void lose_display() {
  redraw();
  stroke(#D81818);
  strokeWeight(5);
  fill(#D81818, 200);
  beginShape();
  vertex(5, 200);
  vertex(60, 300);
  vertex(5, 400);
  vertex(595, 400);
  vertex(540, 300);
  vertex(595, 200);
  vertex(5, 200);
  endShape();
  fill(250);
  textSize(85);
  text("¡PERDISTE!", 80, 330);
}

void clear() {
  current = current < levels.size()-1 ? current+1 : 0;
  draw_pos = 0;
  menu = 1;
}