class Grid {
  int x,y;
  int col=255;
  Grid(int x, int y) {
    this.x=x;
    this.y=y;
  }
  void show() {
    noStroke();
    fill(255,col,col);
    if(x==target[0]&&y==target[1])
      fill(0,255,0);
    square(x*scl, y*scl, scl);
    if(col<255)col+=4;
  }
}
