void setup() {
  size (1200, 1200);
  int dé1;
  int dé2;
  int player;
  int TableauVide[] = new int[64];
  Deplacement(0,0);
}
void draw(){
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
void Deplacement ( int dé1, int dé2){
  int deplacement = 0;
  for (int i =0; i<100; i++) {
    dé1 = int(random(6)+1);
    dé2 = int(random(6)+1);
    deplacement = deplacement + dé1 +dé2;
    if (dé1 == 6 && dé2 == 3 | dé1 == 3 && dé2 == 6) {
      deplacement = 26;
    } else if (dé1 == 5 && dé2 == 4 | dé1 == 4 && dé2 == 5){
      deplacement = 53;
  } else if (deplacement == 6){
    deplacement =12;
  } 
  println ("Les dés ont fait", dé1 ,"et", dé2,"J.1 se déplace sur la case" ,deplacement);
  if (deplacement == 63) {
    String win = "Vous avez gagné !";
    println (win); break;
  }
  if (deplacement > 63){
  int surplus = (deplacement + (dé1 + dé2) -63);
  deplacement = 63 - surplus;
  println ("J.1 a fait plus de 63. Il retourne sur la case", deplacement);
  }
  }
  
}
int CoordoPlat(int tab[]){
  int i ;
  int mid =0;
  for ( i=0; i <tab.length-1; i++){
    tab[i] = mid +9;
    mid = mid+9;
  }
  return tab[i];
}
void CreePlateau() {
  int x ;
  for (x = 0; x <1182; x = x+18) {
    rect(x,50,18,100);
  }

}  
  
