import java.util.Random;
import java.util.List;
import java.util.LinkedList;
import java.io.BufferedWriter;
import java.io.FileWriter;
// name of output file
String outFilename = "Results.txt";

PrintWriter output; // where the results will be stored
Random ran = new Random();
Soldier[] teamA;
Soldier[] teamB;
float size=5;
int teamACount = 100; // number of soldiers on teamA
int teamBCount = 100; // number of soldiers on teamB
float AInterval=2.5*size; // distance between each soldier on A team starting pos
float BInterval=2.5*size; // distance between each soldier on B team starting pos
int AColumns = 5; // number of columns for A team
int BColumns = 5; // number of columns for B team
float AColumnInterval=2.5*size; // distance between the columns for A team
float BColumnInterval=2.5*size; // distance between the columns for B team 
void Settings(){
    // set up team A
  teamA = new Soldier[teamACount];
  float x;
  float y;
  for (int i = 0; i < teamACount; i++) {
    x=int(100+(i%AColumns)*AColumnInterval);
    y=100 + AInterval*(int(1+i/AColumns));
    teamA[i] = new Soldier(i+1, x, y, teamAColor, size);
  }
  // set up team B
  teamB = new Soldier[teamBCount];
  for (int i = 0; i < teamBCount; i++) {
    x=int(900-(i%BColumns)*BColumnInterval);
    y=100 + BInterval*(int(1+i/BColumns));
    teamB[i] = new Soldier(i+1, x, y, teamBColor, size);
  }
}
void setup() {
  frameRate(60);
  size(1000, 1000);
  // Create a new file in the sketch directory to store the results
  output = createWriter("battleResults.csv");
  Settings();
}
int bias =0;
void draw() {
  background(0);
  /*
  //area that once they are in they have escaped
   fill(teamAColor);
   stroke(0);
   rect(100,500,100,100);
   fill(teamBColor);
   rect(900,500,100,100
   */
  // generate list of alive characters
  ArrayList<Soldier> alive = generateAlive(teamA, teamB);
  ArrayList<Soldier> AAlive = generateTeamAlive(teamA);
  ArrayList<Soldier> BAlive = generateTeamAlive(teamB);
  ArrayList<Soldier> turnleft = generateAlive(teamA, teamB);
  // decdies who starts next turn
  while (turnleft.size()>0){
    int random=int(random(turnleft.size()-1));
    Soldier chosen = turnleft.get(random);
    turnleft.remove(random);
    if (chosen.teamColor != teamAColor){
      chosen.RunProcess(alive,AAlive,BAlive);
    }
    else{
      chosen.RunProcess(alive,BAlive,AAlive);
    }
  }
  if (AAlive.size() == 0 || BAlive.size() == 0) {
    appendTextToFile(outFilename,str(AAlive.size())+ " " + str(BAlive.size()));
    println("HI it should be stored");
    Settings();
  }
}
