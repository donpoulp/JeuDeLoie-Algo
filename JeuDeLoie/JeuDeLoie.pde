int sizeX = 1000;
int NbJoueur = 4;
int[] Joueur = new int[NbJoueur];
int[] Plateau = new int[64];
int[] ColorPlayer = new int[NbJoueur*3];
int[] JsizeX = new int[NbJoueur];
int[] PosJoueurY = new int[NbJoueur];
int[] JoueurTour = new int[NbJoueur];
int PosY = 100;
int LancéeDeDés;
int CountTour=0;

void setup(){
  size(1000, 400);
  GenerateColorAndSizeXAndPosJoueury();
  EcranWaitingPlay();
}

void draw(){ 
  if(mousePressed==true){
    init();
    CountTour=CountTour+1; 
    for(int i=0;i<Joueur.length;i++){
      if(JoueurTour[i]==0){
        int dé1 = floor(random(6)+1);
        int dé2 = floor(random(6)+1);
        LancéeDeDés = dé1+dé2;
    
        play(i,LancéeDeDés);
        Anime(Plateau,LancéeDeDés,i);
        VérifCase(i,LancéeDeDés,dé1,dé2);
      }else{
        Anime(Plateau,LancéeDeDés,i);
        JoueurTour[i]=JoueurTour[i]-1;
      }
    }
  }
}

void GenerateColorAndSizeXAndPosJoueury(){
  for(int i = 0;i<JsizeX.length;i++){     
     JsizeX[i] = ((sizeX/NbJoueur)*(i));
  }
  for(int k = 0;k < ColorPlayer.length;k++){
     int RandomColor = floor(random(255));
     ColorPlayer[k] = RandomColor;
  }
  for(int l = 0;l < PosJoueurY.length;l++){
    int RandomPosY = floor(random(140));
    PosJoueurY[l] = RandomPosY;
  }
}

void EcranWaitingPlay(){
  background(127,0,255);
  init();
  fill(0);
  textSize(50);
  textAlign(CENTER);
  text("Clique pour lancer le jeu !",500,50);
  text("Reste appuyer pour une avance fluide :3",500,100);
  fill(255);
  textAlign(LEFT);
  textSize(20);
  text("Tour n°",900,350);
  text(CountTour,970,350);
  for(int i=0;i<Joueur.length;i++){
    fill(ColorPlayer[(i*3)],ColorPlayer[(i*3)+1],ColorPlayer[(i*3)+2]);
    circle(Plateau[Joueur[i]]+7.5, 145+PosJoueurY[i], 10);
  }
}

void init(){
  background(127,0,255);
  int posX = 0;
  for(int i=0;i<=Plateau.length-1;i++){
    posX = posX+15;
    Plateau[i] = posX;
    fill(255);
    rect(Plateau[i], 125, 15, 175);

    if(Plateau[i]==Plateau[9]||Plateau[i]==Plateau[18]||Plateau[i]==Plateau[27]||Plateau[i]==Plateau[36]||Plateau[i]==Plateau[45]||Plateau[i]==Plateau[54]){
      fill(211,211,211);
      rect(Plateau[i], 125, 15, 175);
    }
    if(Plateau[i]==Plateau[19]){
      fill(255,255,210);
      rect(Plateau[i], 125, 15, 175);
    }
    if(Plateau[i]==Plateau[3]){
      fill(119,181,254);
      rect(Plateau[i], 125, 15, 175);
    }
    if(Plateau[i]==Plateau[42]){
      fill(176,242,182);
      rect(Plateau[i], 125, 15, 175);
    }
    if(Plateau[i]==Plateau[52]){
      fill(88,41,0);
      rect(Plateau[i], 125, 15, 175);
    }
    if(Plateau[i]==Plateau[58]){
      fill(240,0,32);
      rect(Plateau[i], 125, 15, 175);
    }
    if(Plateau[i]==Plateau[58]){
      fill(240,0,32);
      rect(Plateau[i], 125, 15, 175);
    }
    if(Plateau[i]==Plateau[63]){
      fill(0);
      rect(Plateau[i], 125, 15, 15);
      rect(Plateau[i], 155, 15, 15);
      rect(Plateau[i], 185, 15, 15);
      rect(Plateau[i], 215, 15, 15);
      rect(Plateau[i], 245, 15, 15);
      rect(Plateau[i], 275, 15, 15);
    }
    fill(0);
    textSize(13);
    textLeading(16);
    textAlign(LEFT);
    text(i,Plateau[i],137);
    
    fill(211,211,211);
    rect(15, 320, 50, 30);
    fill(0);
    text("oies",28,340);
    
    fill(255,255,210);
    rect(75, 320, 50, 30);
    fill(0);
    text("hotel",87,340);
    
    fill(119,181,254);
    rect(135, 320, 50, 30);
    fill(0);
    text("puit",150,340);
    
    fill(176,242,182);
    rect(195, 320, 70, 30);
    fill(0);
    text("labyrinthe",202,340);
    
    fill(88,41,0);
    rect(275, 320, 50, 30);
    fill(0);
    text("prison",285,340);
    
    fill(240,0,32);
    rect(335, 320, 50, 30);
    fill(0);
    text("MORT",343,340);
  }
}

void VérifCase(int i,int LancéeDeDés,int dé1, int dé2){  //<>//
      if(CountTour==1 && dé1==6 && dé2==3 || CountTour==1 && dé1==3 && dé2==6){
        Joueur[i] = 26;
      }
      if(CountTour==1 && dé1==4 && dé2==5 || CountTour==1 && dé1==5 && dé2==4){
        Joueur[i] = 53;
      }
      if(CountTour==1 && LancéeDeDés==6){
        Joueur[i] = 12;
      }
      if(Joueur[i]==19){
        JoueurTour[i]=2;
      }
      if(Joueur[i]==3){
        JoueurTour[i]=9999;
        for(int k = 0;k<Joueur.length;k++){
          if(i!=k){
          if(Joueur[i]==Joueur[k]){
            JoueurTour[i]=0;
          }
        }
        }
      }
      if(Joueur[i]==42){
        Joueur[i] = 30;
      }
      if(Joueur[i]==52){
        JoueurTour[i]=9999;
        for(int k = 0;k<Joueur.length;k++){
          if(i!=k){
            if(Joueur[i]==Joueur[k]){
              JoueurTour[i]=0;
              JoueurTour[k]=0;
            }
          }
        }
      }
      if(Joueur[i]==58){
        Joueur[i]=0;
      }
}

void play(int i,int LancéeDeDés){
     if(Joueur[i]==9 || Joueur[i]==18 || Joueur[i]==27 || Joueur[i]==36 || Joueur[i]==45 || Joueur[i]==54){
        if(Joueur[i]+LancéeDeDés+LancéeDeDés>63){
          int surplus2 =(Joueur[i]+LancéeDeDés+LancéeDeDés)-63;
          Joueur[i] = 63 - surplus2; 
        }else{
          Joueur[i] = Joueur[i] + LancéeDeDés + LancéeDeDés;
        }
      }else{
        if(Joueur[i]+LancéeDeDés>63){
          int surplus =(Joueur[i]+LancéeDeDés)-63;
          Joueur[i] = 63 - surplus;
        }else{
          Joueur[i] = Joueur[i] + LancéeDeDés;
        }
      }
}

void Anime(int[] Tab,int LancéeDeDés,int i){
      if(Joueur[i]==63){ 
        println(Joueur[i],"YOU WIN");
        //noLoop();
        Joueur[i]=52;
        
        fill(0,255,0);
        textSize(20);
        text("YOU WIIIIIIIIIIN",JsizeX[i]+100,20);
        
        fill(ColorPlayer[(i*3)],ColorPlayer[(i*3)+1],ColorPlayer[(i*3)+2]);
        rect(Tab[Joueur[i]],125,15,175);
        circle(Tab[Joueur[i]]+7.5, 145+PosJoueurY[i], 10);
        text("Joueur",JsizeX[i],20);
        text(i+1,JsizeX[i]+70,20);
        text("Position =",JsizeX[i],50);
        text(Joueur[i],JsizeX[i]+90,50);
        text("Valeur du dé =",JsizeX[i],80);
        text(LancéeDeDés,JsizeX[i]+130,80);
        
        fill(255);
        text("Tour n°",900,350);
        text(CountTour,970,350);
        
        delay(1000/NbJoueur);
      }else{
        fill(255);
        textSize(20);
        text("Tour n°",900,350);
        text(CountTour,970,350);
        
        fill(ColorPlayer[(i*3)],ColorPlayer[(i*3)+1],ColorPlayer[(i*3)+2]);
        circle(Tab[Joueur[i]]+7.5, 145+PosJoueurY[i], 10);
        
        text("Joueur",JsizeX[i],20);
        text(i+1,JsizeX[i]+70,20);
        
        text("Position =",JsizeX[i],50);
        text(Joueur[i],JsizeX[i]+90,50);
        text("Valeur du dé =",JsizeX[i],80);
        text(LancéeDeDés,JsizeX[i]+130,80);
        
        
        println("Pos Joueur =",Joueur[i]);
        println("Valeur du dé =",LancéeDeDés);
        
        delay(1000/NbJoueur);
        }  
}
