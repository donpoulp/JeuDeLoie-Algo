int deplacement = 0;
int x=0;
int y=0;
int score =0;

void setup() {
  size (1625, 500);
  frameRate (1);
  CreePlateau();
  drawPawn(deplacement);
  drawPawn2(deplacement);
  background (#BDE0FF);
}



void draw() {
  CreePlateau();
  fill (#BDE0FF);
  rect (x, 300, 1600, 200);
  JeuDeLoie();
  drawPawn(deplacement);
  JeuDeLoie();
  drawPawn2(deplacement);
}

//Partie déplacement du jeu de l'oie




void JeuDeLoie () {//fonction globale du jeu


  int dé1 = int(random(6)+1);
  int dé2 = int(random(6)+1);
  deplacement = Deplacement(deplacement, dé1, dé2) ;
  if (deplacement > 64) {
    int surplus = (deplacement +(dé1 + dé2) -64);
    deplacement = 64 - surplus;
    println ("Vous avez fait plus de 63. Vous retournez sur la case", deplacement);
    textSize (60);
    text ("Vous avez fait plus de 63. Vous retournez sur la case"+ deplacement, 20, 400);
  }
  if (deplacement == 64) {
    WinShow();
    noLoop();
    return;
  }
  if (deplacement == 19) {
    for (int x = 0; x < 2; x ++) {
      deplacement = 19;
      fill (#BDE0FF);
      rect (x, 300, 1600, 200);
      println ("Vous êtes arrivés sur l'hôtel ! Il vous reste", 2-x, "tours avant de sortir !");
      textSize (60);
      text ("Vous êtes arrivés sur l'hôtel !", 20, 400);
    }
  }
}



int Deplacement (int CaseDepart, int dé1, int dé2) {// Déplacement dé sans case spéciale
  int deplacement = CaseDepart + dé1 +dé2;
  if (dé1 == 6 && dé2 == 3 | dé1 == 3 && dé2 == 6) {
    deplacement = 26;
  } else if (dé1 == 5 && dé2 == 4 | dé1 == 4 && dé2 == 5) {
    deplacement = 53;
  } else if (deplacement == 6) {
    deplacement =12;
  }
  println ("Les dés ont fait", dé1, "et", dé2, "Vous vous déplacez sur la case", deplacement);
  textSize (60);
  text ("Les dés ont fait"+ dé1+ "et"+ dé2+ "Vous vous déplacez sur la case"+ deplacement, 20, 400);
  deplacement = CaseSpe (deplacement, dé1, dé2);
  return deplacement;
}




int CaseSpe (int deplacement, int dé1, int dé2) {// Case spéciales
  if (deplacement%9 ==0 && deplacement != 64) {
    deplacement = deplacement + dé1 + dé2;
    fill (#BDE0FF);
    rect (x, 300, 1600, 200);
    println ("Vous êtes tombés sur la case de l'oie ! Vous vous déplacez sur la case", deplacement);
    textSize (60);
    text ("Vous êtes tombés sur la case de l'oie ! Vous vous déplacez sur la case"+ deplacement, 20, 400);
  }
  if (deplacement == 42) {
    deplacement = 30;
    fill (#BDE0FF);
    rect (x, 300, 1600, 200);
    println("Vous êtes arrivés dans le labyrinthe ! Vous retournez sur la case", deplacement);
    textSize (60);
    text ("Vous êtes arrivés dans le labyrinthe ! Vous retournez sur la case"+ deplacement, 20, 400);
  }
  if (deplacement == 58) {
    deplacement =0;
    fill (#BDE0FF);
    rect (x, 300, 1600, 200);
    println ("Vous êtes arrivés sur le crâne ! A cause de la malédiction vous retournez sur la case départ !");
    textSize (60);
    text ("Vous êtes arrivés sur le crâne ! A cause de la malédiction vous retournez sur la case départ !", 20, 400);
  }
  return deplacement;
}



void WinShow() { // Déclarer la victoire
  String win ="Vous avez gagné !";
  fill (#BDE0FF);
  rect (x, 300, 1600, 200);
  textSize (60);
  text ("Vous avez gagné !", 20, 400);
  println (win);
}

// Partie visuelle


void drawPawn(int position) {//Dessine le premier pion et le fait bouger dans draw
  noStroke();
  fill(#FBB7C2);
  ellipse (x+12 + 25*position, y+250, 20, 20);
  fill(#FFFFFF);
  stroke(0);
}

void drawPawn2(int position) {//Dessine le premier pion et le fait bouger dans draw
  noStroke();
  fill(#82AD8E);
  ellipse (x+12 + 25*position, y+270, 20, 20);
  fill(#FFFFFF);
  stroke(0);
}

void CreePlateau() {//Crée le plateau de jeu
  int x ;
  fill (255);
  for (x = 0; x <1620; x = x+25) {
    rect(x, 200, 25, 100);
  }
  fill (153);
  textSize (10);
  text ("Départ", 1, 225, 25, 300);
  text ("Puit", 76, 225, 95, 300);
  text ("Oie", 226, 225, 245, 300);
  text ("Oie", 451, 225, 470, 300);
  text ("Oie", 676, 225, 695, 300);
  text ("Oie", 901, 225, 920, 300);
  text ("Laby", 1051, 225, 1070, 300);
  text ("Oie", 1126, 225, 1145, 300);
  text ("Prison", 1301, 225, 1320, 300);
  text ("Oie", 1351, 225, 1370, 300);
  text ("Mort", 1451, 225, 1470, 300);
  text ("Arrivée", 1601, 225, 1625, 300);
  fill(0);
}
