int _width = 7;
int _height = 6;
int block = 100; 
int player = 1;
int [][] board = new int [_height] [_width];
void setup() {

  size(700, 600); 
  ellipseMode(CORNER);
}

int getWinner() { //checking rows columns diagnoals for four in a row
  for (int y = 0; y < _height; y++)
    for (int x = 0; x < _width; x++)
      if (token(y, x) != 0 && token(y, x) == token(y, x+1) && token(y, x) == token(y, x+2) && token(y, x) == token(y, x+3)) 
        return token(y, x);

  for (int y = 0; y < _height; y++)
    for (int x = 0; x < _width; x++)
      if (token(y, x) != 0 && token(y, x) == token(y+1, x) && token(y, x) == token(y+2, x) && token(y, x) == token(y+3, x)) 
        return token(y, x);

  for (int y = 0; y < _height; y++)
    for (int x = 0; x < _width; x++)
      for (int dir= -1; dir <= 1; dir++)
        if (token(y, x) != 0 && token(y, x) == token(y+1*dir, x+1) && token(y, x) == token(y+2*dir, x+2) && token(y, x) == token(y+3*dir, x+3)) 
          return token(y, x);
  for (int y = 0; y < _height; y++)
    for (int x = 0; x < _width; x++)
      if (token(y, x) == 0) 
        return 0;
        
  return -1; //tie
}

int token( int y, int x) {
  return (y < 0|| x < 0 || y >= _height|| x >= _width)?0:board[y][x];
}

int nextSpace(int x) {
  for (int y = _height - 1; y >= 0; y --) 
    if (board[y]  [x] ==0)
      return y;
  return -1;
}
void mousePressed() {
  int x = mouseX / block, y = nextSpace(x);
  if (y >= 0) {
    board[y][x] = player;
    player = player==1?2:1;
  }
}

void draw() {
  if(getWinner() ==0) {
  for (int j = 0; j < _height; j++) 
    for (int i = 0; i < _width; i ++)
    {
      fill(130);
      rect(i*block, j*block, block, block);
      if (board [j][i] > 0) 
      {
        fill(board[j][i] == 1?255:0, board[j][i] == 2?255:0, 0);
        ellipse(i*block, j*block, block, block);
      }
    }
    
}
else {
  background(0);
  fill(255);
  text("The winner is Player "+getWinner()+" press space to restart!", width/3, height/2);
  if (keyPressed && key == ' ')  {
    player=1;
  }
}
}

