int sizeX = 1000; //Creation des variables globals 
int NbJoueur = 4;
int[] Joueur = new int[NbJoueur];
int[] Plateau = new int[64];
int[] ColorPlayer = new int[NbJoueur*3];
int[] JsizeX = new int[NbJoueur];
int[] PosJoueurY = new int[NbJoueur];
int[] JoueurTour = new int[NbJoueur];
int PosY = 100;
int LancéeDeDés;
int CountTour=0;  //Creation des variables globals 

void setup(){  // setup "" launch 1 seul fois les fonction 
  size(1000, 400); // definie la taille de l'ecran
  GenerateColorAndSizeXAndPosJoueury(); // genere des couleurs "" sizeX et posYjoueur en fonction du nombre de joueur
  EcranWaitingPlay();  // crée un ecran d'attente avant le lancement du jeu
}

void draw(){ // draw "" boucle mes fonction en boucle tant que noloop() n'est pas lancer (noloop erst lancée quand 1 joueur attend 63 pile)
  if(mousePressed==true){  // condition passer selement si un clique sourie est detecter
    init();  // desine toute les case du tableau et reset le tableau a chaque iteration
    CountTour=CountTour+1; // ajoute 1 au compteur de tour a chaque iteration
    for(int i=0;i<Joueur.length;i++){  // boucle mes fonction en fonction du nombre de joueur a chaque iteration de draw()
      if(JoueurTour[i]==0){  // compteur qui verifie si un joueur a des tours a attenre
        int dé1 = floor(random(6)+1);  // genère 2 dé de 6 aleatoire
        int dé2 = floor(random(6)+1);
        LancéeDeDés = dé1+dé2;  //attribut la somme des 2 dé
    
        play(i,LancéeDeDés);  // fonction qui fait avancer le joueur en fonction des dé "" verifie les oies pour doublé les dé si besoin et virifie que le joueur ne depasse pas 63
        Anime(Plateau,LancéeDeDés,i); // fonction qui redessine les joueurs apres avoir avancer
        VérifCase(i,LancéeDeDés,dé1,dé2);  // fonction qui verifie les cases spéciale et reatribue les bonne valeurs de case si necessaire
      }else{ // dans le cas ou le joueurs a des temps d'attente
        Anime(Plateau,LancéeDeDés,i); // dessine les infos annexe meme si le joueur ne bouge pas (ex NBtour) 
        JoueurTour[i]=JoueurTour[i]-1; // décrémente le nombre de tour que le joueur a a attendre
      }
    }
  }
}

void GenerateColorAndSizeXAndPosJoueury(){ // genere des couleurs "" sizeX et posYjoueur en fonction du nombre de joueur
  for(int i = 0;i<JsizeX.length;i++){     // boucle pour gérer l'espace entre chaque affichage des score des joueur
     JsizeX[i] = ((sizeX/NbJoueur)*(i));  // attribut la division de la taille de mon ecran par mon nombre de joueur a chaque joueur (pour afficher leur resultat espacé)
  }
  for(int k = 0;k < ColorPlayer.length;k++){ // Boucle sur le tableau colors qui prend en length le nombre de joueur * 3
     int RandomColor = floor(random(255)); // genere 3 chiffre random entre 0 et 255 pour faire une couleur RGB
     ColorPlayer[k] = RandomColor;  // attribut un chiffre randome entre 0 et 255 au tableau 
  }
  for(int l = 0;l < PosJoueurY.length;l++){ // Boucle sur le tableau PosJoueurY qui prend en length le nombre de joueur
    int RandomPosY = floor(random(140)); // genere une posY aleatoire entre 0 et 140
    PosJoueurY[l] = RandomPosY; // attribut le chiffre aleatoire generer juste avant au tableau PosJoueurY
  }
}

void EcranWaitingPlay(){ // fonction qui crée un ecran en attendant le lancement du programme
  background(127,0,255);  // donne une couleur au fond de l'ecran (mauve)
  init();  // lance la fonction init pour recupere notre parcour de 63case
  fill(0);  // couleur noir pour le text
  textSize(50);  // taille du txt 50px
  textAlign(CENTER);  // setup la posx et posY du txt au centre et plus a (gauche de base)
  text("Clique pour lancer le jeu !",500,50); 
  text("Reste appuyer pour une avance fluide :3",500,100);
  fill(255); // couleur blanche
  textAlign(LEFT);  // resetup la pos du txt a gauche
  textSize(20);  // resetup la taille du txt a 20
  text("Tour n°",900,350);
  text(CountTour,970,350);
  for(int i=0;i<Joueur.length;i++){  // boucle pour positionner les joueur sur la ligne de depart avec leurs PosY et Couleur generer aleatoirement dans la fontcion GenerateColorAndSizeXAndPosJoueury()
    fill(ColorPlayer[(i*3)],ColorPlayer[(i*3)+1],ColorPlayer[(i*3)+2]);  //recupere les valeurs par 3 dans le tableau colors player pour attribuer une coulleur RGB au joueur
    circle(Plateau[Joueur[i]]+7.5, 145+PosJoueurY[i], 10);  // positione les joueurs avec la PosY generer aleatoirement
  }
}

void init(){  // initialise le terrain
  background(127,0,255);  // initialise la couleurs de fond (mauve)
  int posX = 0;  // crée une variable local a 0
  for(int i=0;i<=Plateau.length-1;i++){  // boucle de 63 pour crée chaque case du plateeau
    posX = posX+15;  // increment posX de 15 pour décaler chaque rectangle de 15
    Plateau[i] = posX;  // stock les posX de chaque carrer dans le tableau plateau
    fill(255);  // couleur blanche
    rect(Plateau[i], 125, 15, 175);  // desine des rectagle de 15 de largeur avec les PosX stocker dans le tableau 

    if(Plateau[i]==Plateau[9]||Plateau[i]==Plateau[18]||Plateau[i]==Plateau[27]||Plateau[i]==Plateau[36]||Plateau[i]==Plateau[45]||Plateau[i]==Plateau[54]){  // dessine des carer speciale pour les oies au case donner
      fill(211,211,211);
      rect(Plateau[i], 125, 15, 175);
    }
    if(Plateau[i]==Plateau[19]){// dessine des carer speciale pour l'hotel au case donner
      fill(255,255,210);
      rect(Plateau[i], 125, 15, 175);
    }
    if(Plateau[i]==Plateau[32]){// dessine des carer speciale pour le puit au case donner
      fill(119,181,254);
      rect(Plateau[i], 125, 15, 175);
    }
    if(Plateau[i]==Plateau[42]){// dessine des carer speciale pour le lynbirinthe au case donner
      fill(176,242,182);
      rect(Plateau[i], 125, 15, 175);
    }
    if(Plateau[i]==Plateau[52]){// dessine des carer speciale pour la prison au case donner
      fill(88,41,0);
      rect(Plateau[i], 125, 15, 175);
    }
    if(Plateau[i]==Plateau[58]){ // dessine des carer speciale pour le djo de ces MOOOORT au case donner
      fill(240,0,32);
      rect(Plateau[i], 125, 15, 175);
    }
    if(Plateau[i]==Plateau[63]){ // dessine une ligne d'arriver sur la case 63
      fill(0);
      rect(Plateau[i], 125, 15, 15);
      rect(Plateau[i], 155, 15, 15);
      rect(Plateau[i], 185, 15, 15);
      rect(Plateau[i], 215, 15, 15);
      rect(Plateau[i], 245, 15, 15);
      rect(Plateau[i], 275, 15, 15);
    }
    fill(0);  // donne le numero de chaque case
    textSize(13);
    textLeading(16);
    textAlign(LEFT);
    text(i,Plateau[i],137);
  }
    fill(211,211,211); // crée une legende pour toute les cases speciale en fin de page
    rect(15, 320, 50, 30);
    fill(0);
    text("oies",28,340);
    
    fill(255,255,210); // crée une legende pour toute les cases speciale en fin de page
    rect(75, 320, 50, 30);
    fill(0);
    text("hotel",87,340);
    
    fill(119,181,254); // crée une legende pour toute les cases speciale en fin de page
    rect(135, 320, 50, 30);
    fill(0);
    text("puit",150,340);
    
    fill(176,242,182); // crée une legende pour toute les cases speciale en fin de page
    rect(195, 320, 70, 30);
    fill(0);
    text("labyrinthe",202,340);
    
    fill(88,41,0); // crée une legende pour toute les cases speciale en fin de page
    rect(275, 320, 50, 30);
    fill(0);
    text("prison",285,340);
    
    fill(240,0,32); // crée une legende pour toute les cases speciale en fin de page
    rect(335, 320, 50, 30);
    fill(0);
    text("MORT",343,340);
}

void VérifCase(int i,int LancéeDeDés,int dé1, int dé2){ // fonction qui verifie et positionne les joeuurs par apport au case speciale //<>//
      if(CountTour==1 && dé1==6 && dé2==3 || CountTour==1 && dé1==3 && dé2==6){ // si c'est le 1er tour et que le joueur fait 9 avec 6 et 3
        Joueur[i] = 26; // alors le joueur va directement en position 26
      }
      if(CountTour==1 && dé1==4 && dé2==5 || CountTour==1 && dé1==5 && dé2==4){  // si c'est le 1er tour et que le joueur fait 9 avec 5 et 4
        Joueur[i] = 53; // aors le joueur va directement en pos 53
      }
      if(CountTour==1 && LancéeDeDés==6){  // si c'est le 1er tour et que le joueur fait 6 
        Joueur[i] = 12;  // alors le joueur va a 12
      }
      if(Joueur[i]==19){  // si joueur tombe sur la case 19 (hotel)
        JoueurTour[i]=2;  // alors on incremente le temps d'attente du joueur a 2 et on decrement ça a chaque boucle dans setup
      }
      if(Joueur[i]==32){  // si le joueur tombe en case 32 (puit)
        JoueurTour[i]=9999;  // alors on increment le temps d'attente du joueur a BEAUCOUP qu'il reste bloquer 
        for(int k = 0;k<Joueur.length;k++){ // crée une boucle par apport au nombre de joueur
          if(i!=k){  // si le joueur est different de lui meme
          if(Joueur[i]==Joueur[k]){ // on verifie si un joueur different de lui meme ce trouve sur la meme case 
            JoueurTour[k]=0; // on libere le joueur bloquer en laissant celui qui vien d'arriver bloquer
          }
        }
        }
      }
      if(Joueur[i]==42){  // si le joueur tombe case 42 (lybirinthe)
        Joueur[i] = 30; // alors le joueur retourne en case 30
      }
      if(Joueur[i]==52){  // si le joueur tombe case 52 (prison)
        JoueurTour[i]=9999;  // alors on increment le temps d'attente du joueur a BEAUCOUP qu'il reste bloquer 
        for(int k = 0;k<Joueur.length;k++){ // crée une boucle par apport au nombre de joueur 
          if(i!=k){  // si le joueur est different de lui meme
            if(Joueur[i]==Joueur[k]){  // on verifie si un joueur different de lui meme ce trouve sur la meme case 
              JoueurTour[i]=0;  // on libere les 2 jooueur
              JoueurTour[k]=0;
            }
          }
        }
      }
      if(Joueur[i]==58){  // si le joueur tombe case 58 (MOOOORT)
        Joueur[i]=0;  // alors jooueur reviens au debut :'(
      }
}

void play(int i,int LancéeDeDés){  // fonction qui gere l'avancement du joeur par apport au dé
     if(Joueur[i]==9 || Joueur[i]==18 || Joueur[i]==27 || Joueur[i]==36 || Joueur[i]==45 || Joueur[i]==54){ // on verifie si joueur tombe sur une oie pour doublée ces dé
        if(Joueur[i]+LancéeDeDés+LancéeDeDés>63){  // si joueur + double dés depasse 63 
          int surplus2 =(Joueur[i]+LancéeDeDés+LancéeDeDés)-63;  // alors on calcule le surplus du dé par apport a 63
          Joueur[i] = 63 - surplus2;  // et on positionne le joueur a 63 - le surplus calculer au dessus
        }else{
          Joueur[i] = Joueur[i] + LancéeDeDés + LancéeDeDés; // sinon si le joueur + double dé ne depasse pas 63 on lui attribut ça nouvelle position
        }
      }else{ // si on ne tombe pas sur une oies on lance les dé classique
        if(Joueur[i]+LancéeDeDés>63){  // si joueur + dé depasse 63 
          int surplus =(Joueur[i]+LancéeDeDés)-63;  // alors on calcul le surplus des dé par apport a 63
          Joueur[i] = 63 - surplus;  // on soustrait le surplus calculer au dessus sur 63 et on positionne notre joueur
        }else{
          Joueur[i] = Joueur[i] + LancéeDeDés; // si la somme des dé + joueur ne depasse pas 63 alors on bouge notre joueur classique
        }
      }
}

void Anime(int[] Tab,int LancéeDeDés,int i){  //fonction qui dessine les nouvelle postion des joueurs apres les calculs de position 
      if(Joueur[i]==63){ // si joueur est sur la case 63 il gagne
        println(Joueur[i],"YOU WIN");
        noLoop(); // on stop les iteration de draw()
        
        fill(0,255,0);  // on affiche un dernier ecran static de victoire (APRES NOLOOP())
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
      }else{ // si le joueur na pas gagner alors on actualise les dessins avec ces nouvelle position
        fill(255);
        textSize(20);
        text("Tour n°",900,350); // affiche le nombre de tour
        text(CountTour,970,350);
        
        fill(ColorPlayer[(i*3)],ColorPlayer[(i*3)+1],ColorPlayer[(i*3)+2]); // utilise le rbg generer aleatoirement dans la fonction GenerateColorAndSizeXAndPosJoueury() stocker dans ColorPlayer[]
        circle(Tab[Joueur[i]]+7.5, 145+PosJoueurY[i], 10);  // dessine les joueurs au nouvelle position
        
        text("Joueur",JsizeX[i],20); // ecris de quel joueur il s'agis (joueur1,joueur2...)
        text(i+1,JsizeX[i]+70,20);
        
        text("Position =",JsizeX[i],50);  // ecris ça position actuelle
        text(Joueur[i],JsizeX[i]+90,50);
        text("Valeur du dé =",JsizeX[i],80);  // ecris la valeur des dé qu'il viens de faire
        text(LancéeDeDés,JsizeX[i]+130,80);
        
        
        println("Pos Joueur =",Joueur[i]);  
        println("Valeur du dé =",LancéeDeDés);
        
        delay(1000/NbJoueur); // donne un délai de 1s / nombre de joueur pour chaque iterations
        }  
}
