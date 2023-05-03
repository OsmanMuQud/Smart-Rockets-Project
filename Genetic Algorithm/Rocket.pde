class Rocket{
  float x,y;
  float velx,vely;
  int fuel=200;
  int maxFuel=fuel;
  float fitness=0;
  int fitFact=1;
  boolean reached=false;
  DNA dna;
  Rocket(int x,int y){
    this.x=x;
    this.y=y;
    dna=new DNA(fuel*2);
  }
  Rocket(int x,int y,Rocket p1,Rocket p2){
    this.x=x;
    this.y=y;
    dna=new DNA(p1.dna,p2.dna);
  }
  void show(){
    fill(100);
    square((int)x*scl,(int)y*scl,scl);
  }
  void update(){
    if(fuel>0&&!reached){
      velx=dna.gene[--fuel];
      vely=dna.gene[--fuel];
      x+=velx;
      y+=vely;    
      if(x<0||x>=w){x-=velx;velx*=-1;}
      if(y<0||y>=h){y-=vely;vely*=-1;}
      grid[(int)x][(int)y].col=0;
      checkTarget();
    }
  }
  void checkTarget(){
    if(x==target[0]&&y==target[1]){
      reached=true;
      fitFact=3;  
  }
  }
  float getFitness(){
    return fitness=((fitFact+(1+(fuel/maxFuel)))/(1+dist(x,y,target[0],target[1])*dist(x,y,target[0],target[1])));
  }
}
