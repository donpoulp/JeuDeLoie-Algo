void setup() {
  int dé1;
  int dé2;
  int player;
  int plateau[] = new int[64];
}

void playerSetup(int player) {
  if (player == 2) {
    String Player1 = "Player1";
    String Player2 = "Player2";
}
   else if (player ==3) {
    String Player1 = "Player1";
    String Player2 = "Player2";
    String Player3 = "Player3";
}
   else if (player == 4) {
    String Player1 = "Player1";
    String Player2 = "Player2";
    String Player3 = "Player3";
    String Player4 = "Player4";
}
  else {
    String erreur = "Vous 'avez pas le nombre de joueurs requis pour lancer la partie";
  }
}
void Deplacement (int tab[], int dé1, int dé2, int player){
  int deplacement = 0;
  while (player <63) {
    dé1 = int(random(6)+1);
    dé2 = int(random(6)+1);
    deplacement = dé1 + dé2;
    if (dé1 == 6 && dé2 == 3 | dé1 == 3 && dé2 == 6) {
      deplacement = 26;
    } else if (dé1 == 5 && dé2 == 4 | dé1 == 4 && dé2 == 5){
      deplacement = 53;
  } else if (deplacement == 6){
    deplacement =12;
  } else {
    deplacement = deplacement + dé1 +dé2;
  }
  
}
