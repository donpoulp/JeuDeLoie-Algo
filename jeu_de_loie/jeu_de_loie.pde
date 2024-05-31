void setup() {
  size (1200, 1200);
  int player;
  int TableauVide[] = new int[64];
  JeuDeLoie();
}
void draw() {
}

void playerSetup(int player) {
  if (player == 2) {
    String Player1 = "Player1";
    String Player2 = "Player2";
  } else if (player ==3) {
    String Player1 = "Player1";
    String Player2 = "Player2";
    String Player3 = "Player3";
  } else if (player == 4) {
    String Player1 = "Player1";
    String Player2 = "Player2";
    String Player3 = "Player3";
    String Player4 = "Player4";
  } else {
    String erreur = "Vous 'avez pas le nombre de joueurs requis pour lancer la partie";
  }
}
//Partie déplacement du jeu de l'oie
void JeuDeLoie () {//fonction globale du jeu
  int deplacement = 0;
  for (int i =0; i<100; i++) {
    int dé1 = int(random(6)+1);
    int dé2 = int(random(6)+1);
    deplacement = Deplacement(deplacement, dé1, dé2) ;
    if (deplacement > 63) {
      int surplus = (deplacement +(dé1 + dé2) -63);
      deplacement = 63 - surplus;
      println ("J.1 a fait plus de 63. Il retourne sur la case", deplacement);
    }
    if (deplacement == 63) {
      WinShow();
      break;
    }
    if (deplacement == 19){
      for (int x = 0; x < 2; x ++) {
        deplacement = 19;
        println ("Vous êtes arrivés sur l'hôtel ! Il vous reste", 2-x ,"tours avant de sortir !");
      }
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
  if (deplacement%9 ==0 && deplacement != 63){
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
int CoordoPlat(int tab[]) {
  int i ;
  int mid =0;
  for ( i=0; i <tab.length-1; i++) {
    tab[i] = mid +9;
    mid = mid+9;
  }
  return tab[i];
}
void CreePlateau() {
  int x ;
  for (x = 0; x <1182; x = x+18) {
    rect(x, 50, 18, 100);
  }
}
