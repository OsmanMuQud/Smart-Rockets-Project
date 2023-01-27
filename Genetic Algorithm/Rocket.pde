class Rocket{
  float x,y;
  float velx,vely;
  Rocket(int x,int y){
    this.x=x;
    this.y=y;
    velx+=random(-1,1);
    vely+=random(-1,1);
  }
  void show(){
    fill(100);
    square((int)x*scl,(int)y*scl,scl);
  }
  void update(){
    x+=velx;
    y+=vely;
    if(x<0||x>=w){x-=velx;velx*=-1;}
    if(y<0||y>=h){y-=vely;vely*=-1;}
    grid[(int)x][(int)y].col=0;
  }
}
