Unit warrior1 = new Unit('Big',100,10,20);
Unit warrior2 = new Unit('Little',80,20,20);
Game newGame = new Game();
String Winner = newGame.Fight(warrior1,warrior2);
System.debug(Winner);