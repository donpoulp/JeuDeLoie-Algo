void setup(){
  println(init());
    JoueurInit();
}


int[] Plateau = new int[63];
int Joueur1 = 0;

int[] init(){
  for(int i=1;i<63;i++){
    Plateau[i] = i;
  }
  return Plateau;
}

void JoueurInit(){
  while(Joueur1!=Plateau.length){
      int LancéeDeDés = floor(random(6))+floor(random(6));
      if(Joueur1+LancéeDeDés>63){
      int surplus =(Joueur1+LancéeDeDés)-63;
      println(surplus);
      Joueur1 = 63 - surplus;
      }else{
      Joueur1 = Joueur1 + LancéeDeDés;
      }
      println(Joueur1);
      
      if(Joueur1==63){
      println("YOU WIN");
      }
}
}
