import java.util.*;
class Particle{
  float pos[]=new float[2];
  float localMax[]=new float [2];
  float velx,vely;
  int maxVel=1;
  Particle(int x,int y){
    this.pos[0]=x;
    this.pos[1]=y;
    velx=random(-1,1);
    vely=random(-1,1);
  }
  void show(){
    fill(100);
    square((int)pos[0]*scl,(int)pos[1]*scl,scl);
  }
  void upVel(){
    float force[]=new float[2];
    force[0]=0.1*(globalMax[0]-pos[0]);
    force[1]=0.1*(globalMax[1]-pos[1]);
    force[0]+=0.01*(localMax[0]-pos[0]);
    force[1]+=0.01*(localMax[1]-pos[1]);
    if(dist(obstacle[0],obstacle[1],pos[0],pos[1])<10){
      velx*=-1;
      vely*=-1;
      pos[0]+=velx;
      pos[1]+=vely; 
  }
  
    velx+=0.5*force[0];
    vely+=0.5*force[1];
    float sca=sqrt((velx*velx)+(vely*vely));
    velx/=sca;
    vely/=sca;
  }
  void update(){
      println(velx,vely);
      pos[0]+=velx;
      pos[1]+=vely;    
      if(pos[0]<0||pos[0]>=w){pos[0]-=velx;velx*=-1;}
      if(pos[1]<0||pos[1]>=h){pos[1]-=vely;vely*=-1;}
      grid[(int)pos[0]][(int)pos[1]].col=0;      
      upVel();
    }
    void evaluate(){
      if(fitness(pos)>fitness(localMax)){
        localMax=Arrays.copyOf(pos,2);
          //println("L: ",localMax[0],localMax[1],fitness(localMax));
        if(fitness(localMax)>fitness(globalMax)){
          //println("G: ",localMax[0],localMax[1],fitness(localMax));
          globalMax=Arrays.copyOf(localMax,2);
        }
      }
    }
}
