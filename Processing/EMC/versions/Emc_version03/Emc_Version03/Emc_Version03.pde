import java.util.Random;
import java.util.List;
import java.util.LinkedList;
Random ran = new Random();
Soldier[] teamA;
Soldier[] teamB;
float size=3;
int teamACount = 500; // number of soldiers on teamA
int teamBCount = 500; // number of soldiers on teamB
float AInterval=2.5*size; // distance between each soldier on A team starting pos
float BInterval=2.5*size; // distance between each soldier on B team starting pos
int AColumns = 5; // number of columns for A team
int BColumns = 5; // number of columns for B team
float AColumnInterval=2.5*size; // distance between the columns for A team
float BColumnInterval=2.5*size; // distance between the columns for B team
void setup() {
  frameRate(60);
  size(1000, 1000);
  
  // set up team A
  teamA = new Soldier[teamACount];
  float x;
  float y;
  for (int i = 0; i < teamACount; i++) {
    x=int(100+(i%AColumns)*AColumnInterval);
    y=100 + AInterval*(int(1+i/AColumns));
    teamA[i] = new Soldier(i+1, x, y, teamAColor,size);
  }
  // set up team B
  teamB = new Soldier[teamBCount];
  for (int i = 0; i < teamBCount; i++) {
    x=int(900-(i%BColumns)*BColumnInterval);
    y=100 + BInterval*(int(1+i/BColumns));
    teamB[i] = new Soldier(i+1, x, y, teamBColor,size);
  }
}
int bias =0;
void draw() {
  background(0);
  //area that once they are in they have escaped
  fill(teamAColor);
  stroke(0);
  rect(100,500,100,100);
  fill(teamBColor);
  rect(900,500,100,100);
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
    bias-=1;
      //display team B
  runTurn(BAlive,alive,AAlive);
    // display team A
  runTurn(AAlive,alive,BAlive);
  }
  println("teamB : ",BAlive.size());
  println("teamA : ",AAlive.size()); 
  println(bias);
}
