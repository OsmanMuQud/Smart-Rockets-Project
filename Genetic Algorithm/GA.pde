int scl=10;
Grid grid[][];
int population=20;
Rocket roc[]=new Rocket[population];
int target[]=new int[2];
int w,h;
int gen=0;
void setup(){
  size(700,700);
  w=width/scl;
  h=height/scl;
  grid=new Grid[w][h];
  target[0]=w/2;
  target[1]=h/5;
  for(int i=0;i<w;i++){
    for(int j=0;j<h;j++){
      grid[i][j]=new Grid(i,j);
    }
   }
   for(int i=0;i<roc.length;i++)
     roc[i]=new Rocket(w/2,4*h/5);
}  
void draw(){
  frameRate(10);
  background(255);
   for(int i=0;i<w;i++){
    for(int j=0;j<h;j++){
      grid[i][j].show();
    }
   }
   
   for(int i=0;i<roc.length;i++){
     roc[i].show();
     roc[i].update();
     if(roc[i].fuel<=0)newPopulation();
  }
}
void newPopulation(){
  print("new");
  //selection
  gen++;
        ArrayList <Rocket> matingPool=new ArrayList<Rocket>();
        float maxFit=0;
        float minFit=1000;
        for(int j=0;j<population;j++)
        {
          roc[j].getFitness();
          if(maxFit<roc[j].fitness)
          {
            maxFit=roc[j].fitness;
          }
          minFit=min(minFit,roc[j].fitness);
          
        }
        
        for(int j=0;j<population;j++)
        {
          int fit=(int)((roc[j].fitness/maxFit)*100);
          //print(fit);
          for(int e=0;e<fit;e++)
          {
            matingPool.add(roc[j]);
          }
        }
        println(maxFit,minFit,matingPool.size());
        for(int j=0;j<population;j++)
        {
          Rocket a=matingPool.get((int)random(matingPool.size()));
          Rocket b=matingPool.get((int)random(matingPool.size()));
          //print(a.dna.gene,b.dna.gene);
          Rocket r=new Rocket(w/2,4*h/5,a,b);
          roc[j]=r;
        }
  //crossover
  //mutation
  
}
