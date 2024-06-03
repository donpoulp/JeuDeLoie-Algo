int deplacement = 0;
int x=0;
int y=0;

void setup() {
  size (1625, 500);
  frameRate (15);
  CreePlateau();
  fill(#FBB7C2);
  noStroke();
  ellipse (x+12, y+110, 20,20); 
}

void drawPawn(int position){
  fill(#FBB7C2);
  ellipse (x+12 + 25*position, y+110, 20,20);
}

void draw() { 
  ClearPawn (deplacement);
  JeuDeLoie();
  drawPawn(deplacement);
  
}

void ClearPawn( int position){
  fill (255);
  ellipse (x+12 + 25*position, y+110, 20,20);
}



//Partie déplacement du jeu de l'oie




void JeuDeLoie () {//fonction globale du jeu
  
  
    int dé1 = int(random(6)+1);
    int dé2 = int(random(6)+1);
    deplacement = Deplacement(deplacement, dé1, dé2) ;
    if (deplacement > 64) {
      int surplus = (deplacement +(dé1 + dé2) -64);
      deplacement = 64 - surplus;
      println ("J.1 a fait plus de 63. Il retourne sur la case", deplacement);
    }
    if (deplacement == 64) {
      WinShow();
      noLoop();
      return;
    }
    if (deplacement == 19){
      for (int x = 0; x < 2; x ++) {
        deplacement = 19;
        println ("Vous êtes arrivés sur l'hôtel ! Il vous reste", 2-x ,"tours avant de sortir !");
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
  println ("Les dés ont fait", dé1, "et", dé2, "J.1 se déplace sur la case", deplacement);
  deplacement = CaseSpe (deplacement, dé1, dé2);
  return deplacement;
}




int CaseSpe (int deplacement, int dé1, int dé2) {// Case spéciales
  if (deplacement%9 ==0 && deplacement != 64){
    deplacement = deplacement + dé1 + dé2;
    println ("Vous êtes tombés sur la case de l'oie ! Vous vous déplacez sur la case", deplacement);
  }
  if (deplacement == 42){
    deplacement = 30;
    println("Vous êtes arrivés dans le labyrinthe ! Vous retournez sur la case", deplacement);
  }
  if (deplacement == 58) {
    deplacement =0;
    println ("Vous êtes arrivés sur le crâne ! A cause de la malédiction vous retournez sur la case départ !");
  }
return deplacement;
}



void WinShow() { // Déclarer la victoire
  String win ="Vous avez gagné !";
  println (win);
}

// Partie visuelle

void PawnMv(int mv){
  int MvPawn;
  MvPawn = (mv*25)+10;
}

int CoordoPlat(int tab[]) {
  int i ;
  int mid =0;
  for ( i=0; i <tab.length-1; i++) {
    tab[i] = mid +12;
    mid = mid+13;
  }
  return tab[i];
}



void CreePlateau() {
  int x ;
  for (x = 0; x <1620; x = x+25) {
    rect(x, 50, 25, 100);
  }
  fill (153);
  text ("Départ", 1, 75, 25, 100);
  text ("Puit", 76, 75, 95, 100);
  text ("Oie", 226, 75, 245, 100);
  text ("Oie", 451, 75, 470, 100);
  text ("Oie", 676, 75, 695, 100);
  text ("Oie", 901, 75, 920, 100);
  text ("Laby", 1051, 75, 1070, 100);
  text ("Oie", 1126, 75, 1145, 100);
  text ("Prison", 1301, 75, 1320, 100);
  text ("Oie", 1351, 75, 1370, 100);
  text ("Mort", 1451, 75, 1470, 100);
  text ("Arrivée", 1601, 75, 1625, 100);
}
