import java.util.*;
import java.lang.Math;

static int Size = 100;
static int cellSize = 10;
static Random randomGenerator;
static int genNum = 0;

Game game = new Game();

void setup() {
  size(1000, 1000);
  frameRate(500);
}

void draw() {
  genNum++;
  background(255);
  game.display();
  
  textSize(32);
  fill(0, 102, 153);
  text("Generation:"+genNum,324,50);
}
public class Ant {
  private int direction;
  private int x;
  private int y;
  // 0=forwrd
  // 1=right
  // 2=down
  // 3=left

  public Ant() {
    direction = 0;
  }

  public Ant(int dir, int xPos, int yPos) {
    direction= dir%4;
    x = xPos;
    y = yPos;
  }

  public int getDirection() {
    return direction;
  }

  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }

  public void changeDirection(int dir) {
    direction = dir%4;
  }

  public void changeX(int newX) {
    x = newX;
  }
  public void changeY(int newY) {
    y = newY;
  }
  public void moveAnt() {
    if (direction==0) { //0 = up
      y--;
      if (y<0) {
        y+=Size;
      }
    } else if (direction==1) { //1 = right
      x++;
      if (x>=Size) {
        x=0;
      }
    } else if (direction==2) { //2 = down
      y++;
      if (y>=Size) {
        y=0;
      }
    } else { //direction == 3; 3 = left
      x--;
      if (x<0) {
        x+=Size;
      }
    }
  }
}

public class Cell {
  private int fill;
  private int x;
  private int y;

  public Cell(int f, int xPos, int yPos) {
    fill = f;
    x = xPos;
    y = yPos;
  }

  // Copy constructor
  public Cell(Cell c) {
    fill = c.fill;
    x = c.x;
    y = c.y;
  }

  public int getFill() {
    return fill;
  }
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }

  public void fillCell(int f) {
    fill = f;
  }

  public void clearCell() {
    fill=0;
  }
}

public class Game {

  private Cell[][] currentBoard;
  private Cell[][] futureBoard;
  private Ant ant;
  private Ant ant2;

  public Game() {
    int N = Size*Size;
    currentBoard = new Cell[Size][Size];
    futureBoard = new Cell[Size][Size];

    for (int y=0; y<Size; y++) {
      for (int x=0; x<Size; x++) {
        currentBoard[y][x] = new Cell(0, x, y);
      }
    }

    randomGenerator = new Random();
    int x = randomGenerator.nextInt(Size);
    int y = randomGenerator.nextInt(Size);
    int randDirection = randomGenerator.nextInt(Size);
    
    int x1 = randomGenerator.nextInt(Size);
    int y1 = randomGenerator.nextInt(Size);
    int randDirection1 = randomGenerator.nextInt(Size);

    ant = new Ant(0, 49, 49);
    //ant = new Ant(randDirection, x, y);
    ant2 = new Ant(randDirection1, x1, y1);
  }

  public void display() {
    // Draw filled in cells first
    for (int j=0; j<Size; j++) {
      for (int k=0; k<Size; k++) {
        Cell c = currentBoard[j][k];
        if (c.getFill()>0) {
          fill(0, 0, 0);
          rect(k*cellSize, j*cellSize, cellSize, cellSize);
        }
      }
    }
    //Draw ant last
    fill(255, 0, 0);
    rect(ant.x*cellSize, ant.y*cellSize, cellSize, cellSize);
    //rect(ant2.x*cellSize, ant2.y*cellSize, cellSize, cellSize);

    updateBoard();
    //updateBoard2();
  }


  public void updateBoard() {
    int antX = ant.getX();
    int antY = ant.getY();
    int antDirection = ant.getDirection();
    Cell currCell = currentBoard[antY][antX];
    if (currCell.getFill()==0) {
      if (antDirection==3) {
        antDirection=-1;
      }
      ant.changeDirection(antDirection+1);
      currCell.fillCell(1);
      ant.moveAnt();
    } else {
      if(antDirection==0){
       antDirection=4; 
      }
      ant.changeDirection(antDirection-1);
      currCell.fillCell(0);
      ant.moveAnt();
    }
  }
  
    public void updateBoard2() {
    int ant2X = ant2.getX();
    int ant2Y = ant2.getY();
    int ant2Direction = ant2.getDirection();
    Cell currCell = currentBoard[ant2Y][ant2X];
    if (currCell.getFill()==0) {
      if (ant2Direction==3) {
        ant2Direction=-1;
      }
      ant2.changeDirection(ant2Direction+1);
      currCell.fillCell(1);
      ant2.moveAnt();
    } else {
      if(ant2Direction==0){
       ant2Direction=4; 
      }
      ant2.changeDirection(ant2Direction-1);
      currCell.fillCell(0);
      ant2.moveAnt();
    }
  }

  public Ant getAnt() {
    return ant;
  }
}
