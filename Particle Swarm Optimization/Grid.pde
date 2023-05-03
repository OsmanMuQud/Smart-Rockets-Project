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
    //float a[]={x,y};
    //fill(fitness(a)*255,0,0);
    if(x==target[0]&&y==target[1])
      fill(0,255,0);
    if(x==(int)globalMax[0]&&y==(int)globalMax[1])
      fill(0,0,255);
    square(x*scl, y*scl, scl);
    if(col<255)col+=10;
  }
}
