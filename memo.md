# Jeu de l'oie

## Les variables

* 2 dés de 6

* 4 joueurs

* 1 tableau (plateau de jeu)

## Win condition

Arriver sur 63

## Utilisation des dés

* Randomiser les dés entre 1 et 6

* Faire le déplacement avec la somme des deux dés

* Sauvegarder le déplacement

* Ajouter les conditions :
    * Si on obtient 9 avec les dés 6 et 3, bouger sur 26
    * Si on obtient 9 par les dés 5 et 4, bouger sur 53
    * Si on obtient 6, bouger sur 12

## Utilisation du tableau

* Créer le tableau de 64 cases (inclure la case départ)

* Ajouter les cases spéciales :
    * Oies (cases 9, 18, 27, 36, 45 et 54) : Répéter le déplacement
    * Hôtel (case 19) : pas de déplacement pendant 2 tours
    * Puit (case 3) : rester bloqué jusqu'à ce qu'un autre joueur arrive sur la case, puis intervertir les deux joueurs
    * Labyrinthe (case 42) : aller sur 30
    * Prison (case 52) : rester bloqué jusqu'à ce qu'un autre joueur arrive sur la case
    * Crâne (case 58) : aller sur 0

## Interaction entre joueurs

Si un joueur (b) arrive sur la case d'un autre joueur (a):
* l'autre joueur(a) doit aller sur la case de base du tour du joueur (b)


