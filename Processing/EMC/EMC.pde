import java.util.Random;
import java.util.List;
import java.util.LinkedList;
Random ran = new Random();
Soldier[] teamA;
int teamACount = 5; // number of soldiers on teamA
int teamBCount =5; // number of soldiers on teamB
Soldier[] teamB;
void setup() {
  frameRate(60);
  size(1000, 1000);
  // set up teamA
  teamA = new Soldier[teamACount];
  for (int i = 0; i < teamACount; i++) {
    teamA[i] = new Soldier(i+1, 100, 20*(i+1), 0, teamAColor);
  }
  teamB = new Soldier[teamBCount];
  for (int i = 0; i < teamBCount; i++) {
    teamB[i] = new Soldier(i, 900, 20*(1+i), 0, teamBColor);
  }
}
void draw() {
  background(0);
  // generate list of alive characters
  List<Soldier> alive = generateAlive(teamA, teamB);
  List<Soldier> AAlive = generateTeamAlive(teamA);
  List<Soldier> BAlive = generateTeamAlive(teamB);
  float randomFloat=random(2);

  if (randomFloat>1){
    println("redFirst");
  // display team A
  runTurn(AAlive,alive,BAlive);
  //display team B
  runTurn(BAlive,alive,AAlive);
  }else{
    println("blueFirst");
      //display team B
  runTurn(BAlive,alive,AAlive);
    // display team A
  runTurn(AAlive,alive,BAlive);
  }
}
