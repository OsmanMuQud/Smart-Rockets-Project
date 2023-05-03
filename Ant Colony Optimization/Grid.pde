class Grid {
  int x;
  int y;
  float evaporation=0.5;
  float redPhero, bluePhero;
  Grid(int x, int y) {
    this.x=x;
    this.y=y;
    redPhero=bluePhero=255;
  }
  void show() {
    //if(x==y){redPhero-=100;bluePhero-=100;}
    noStroke();
    println("Pheros",redPhero, bluePhero);
    fill(bluePhero%256, min(bluePhero, redPhero)%256, redPhero%256);
    //if(redPhero==255||bluePhero==255)
    //fill(255);

    square(x, y, scl);
  }
  void update() {
    if (redPhero<255)
      redPhero+=evaporation;
    if (bluePhero<255)
      bluePhero+=evaporation;
  }
}
