int scl=10;
Grid grid[][];
int w,h;
float target[]=new float[2];
Particle particles[];
float globalMax[]=new float[2];
float obstacle[]=new float[2];
void setup(){
  size(700,700);
  w=width/scl;
  h=height/scl;
  target[0]=globalMax[0]=w/2;
  target[1]=h/5;
  globalMax[1]=4*h/5;
  obstacle[1]=h/2;
  obstacle[0]=w/2;
  grid=new Grid[w][h];
  particles =new Particle[10];
  for(int i=0;i<particles.length;i++){
    particles[i]=new Particle(w/2,4*h/5);
  }
  for(int i=0;i<w;i++){
    for(int j=0;j<h;j++){
      grid[i][j]=new Grid(i,j);
    }
   }
}  
void draw(){
  frameRate(10);
  background(255);
  println(globalMax[0],globalMax[1],target[0],target[1],fitness(globalMax));
   for(int i=0;i<w;i++){
    for(int j=0;j<h;j++){
      grid[i][j].show();
    }
  }
  fill(0);
  circle(obstacle[0]*scl,obstacle[1]*scl,20*scl);
  for(Particle p:particles){
    p.update();
    p.evaluate();
    p.show();
  }
}
float fitness(float a[]){
  return 1/(1+dist(a[0],a[1],target[0],target[1]));
}
