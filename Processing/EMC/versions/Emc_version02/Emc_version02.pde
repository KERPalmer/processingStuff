import java.util.Random;
import java.util.List;
import java.util.LinkedList;
Random ran = new Random();
Soldier[] teamA;
Soldier[] teamB;
int teamACount = 10; // number of soldiers on teamA
int teamBCount = 10; // number of soldiers on teamB
float AInterval=5; // distance between each soldier on A team starting pos
float BInterval=5; // distance between each soldier on B team starting pos
void setup() {
  frameRate(60);
  size(1000, 1000);
  // set up teamA
  teamA = new Soldier[teamACount];
  for (int i = 0; i < teamACount; i++) {
    teamA[i] = new Soldier(i+1, 100, 100 + AInterval*(i+20), 0, teamAColor);
  }
  teamB = new Soldier[teamBCount];
  for (int i = 0; i < teamBCount; i++) {
    teamB[i] = new Soldier(i+1, 900, 100 + BInterval*(i+20), 0, teamBColor);
  }
}
void draw() {
  int bias =0;
  background(0);
  // generate list of alive characters
  List<Soldier> alive = generateAlive(teamA, teamB);
  List<Soldier> AAlive = generateTeamAlive(teamA);
  List<Soldier> BAlive = generateTeamAlive(teamB);
  float randomFloat=random(2);

  if (randomFloat>1){
    bias+=1;
  // display team A
  runTurn(AAlive,alive,BAlive);
  //display team B
  runTurn(BAlive,alive,AAlive);
  }else{
    bias+=-1;
      //display team B
  runTurn(BAlive,alive,AAlive);
    // display team A
  runTurn(AAlive,alive,BAlive);
  }
  println("teamB : ",BAlive.size());
  println("teamA : ",AAlive.size()); 
  println(bias);
}
