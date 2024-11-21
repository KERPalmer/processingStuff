import java.util.Random;
import java.util.List;
import java.util.LinkedList;
Random rand = new Random();
color teamAColor = color(0, 0, 255);
color teamBColor = color(255, 0, 0);
color deadColor = color(255, 255, 0);
color hitColor = color(255, 255, 255);
class Soldier {
  Position pos;
  int id;
  float facing; // in radians
  float health = 100; //
  float speed = 2; // 
  color teamColor;
  String action="waiting"; 
  boolean inAttackRange;
  float attackRange=20;
  float maxDamage = 40;
  Soldier closestEnemy;
  Soldier(int id, float startingX, float startingY, float startingDirection, color teamColor_) {
    pos=new Position(startingX, startingY);
    facing=startingDirection;
    teamColor=teamColor_;
  }
  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(facing);
    fill(teamColor);
    rect(-5, -5, 10, 10);
    noFill();
    stroke(255);
    circle(0, 0, attackRange*2);
    popMatrix();
  }
  void MoveTo(float x, float y) {
    float diffX = x-pos.x;
    float diffY = y-pos.y;
    float angle = atan2(diffX, diffY);
    pos.y += speed*cos(angle);
    pos.x += speed*sin(angle);
  }
  String DecideNextAction() {
    return"not implimented";
  }
  Boolean IsInstantAction() {
    return false;
  }
  void PerfomAction(String Action) {
  }
  void setClosestEnemy(List<Soldier> alive) {
    float closestDistance=width*height;
    for (Soldier soldier : alive) {
      if (soldier!= this) {
        float distance = dist(pos.x, pos.y, soldier.pos.x, soldier.pos.y);
        if (distance<closestDistance) {
          closestDistance = distance;
          closestEnemy=soldier;
        }
      }
    }
  }
  void PreventOverlap(List<Soldier> alive) {
    for (Soldier soldier : alive) {
      // check isnt the same entity
      if (soldier != this) {
        //check if x coordingates are 'touching'
        if (abs(pos.x-soldier.pos.x)<10 & abs(pos.y-soldier.pos.y)<10) {
          pos.x+=(pos.x-soldier.pos.x);
          pos.y+=(pos.y-soldier.pos.y);
        }
      }
    }
  }
  boolean checkAttackRange(List<Soldier> oppositeTeam) {
    if (dist(pos.x, pos.y, closestEnemy.pos.x, closestEnemy.pos.y)<attackRange) {
      return true;
    } else {
      return false;
    }
  }
  void attack(Soldier enemy){
    enemy.RecieveDamage(5);
  }
  void RecieveDamage(float damage){
    health-=damage;
  }
}
class Position {
  float x;
  float y;
  Position(float x_, float y_) {
    x = x_;
    y = y_;
  }
}
List<Soldier> generateAlive(Soldier[] aTeam, Soldier[] bTeam) {
  List<Soldier> alive = new LinkedList();
  for (Soldier soldier : aTeam) {
    if (soldier.health>0) {
      alive.add(soldier);
    }
  }
  for (Soldier soldier : bTeam) {
    if (soldier.health>0) {
      alive.add(soldier);
    }
  }
  return alive;
}
List<Soldier> generateTeamAlive(Soldier[] team) {
  List<Soldier> alive = new LinkedList();
  for (Soldier soldier : team) {
    if (soldier.health>0) {
      alive.add(soldier);
    }
  }
  return alive;
}
void runTurn(List<Soldier> team, List<Soldier> alive, List<Soldier> oppositeTeamAlive) {
  for (Soldier soldier : team) {   
    soldier.setClosestEnemy(oppositeTeamAlive);
    boolean inAttackRange=soldier.checkAttackRange(oppositeTeamAlive);
    if (inAttackRange) {
      soldier.attack(soldier.closestEnemy);
      soldier.display();
    } else {
      soldier.MoveTo(soldier.closestEnemy.pos.x, soldier.closestEnemy.pos.y);
      soldier.PreventOverlap(alive);
      soldier.display();
    }
  }
}
