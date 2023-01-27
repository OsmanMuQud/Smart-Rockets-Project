int scl=10;
Grid grid[][];
Rocket roc[]=new Rocket[10];
int w,h;
void setup(){
  size(700,700);
  w=width/scl;
  h=height/scl;
  grid=new Grid[w][h];
  for(int i=0;i<w;i++){
    for(int j=0;j<h;j++){
      grid[i][j]=new Grid(i,j);
    }
   }
   for(int i=0;i<roc.length;i++)
     roc[i]=new Rocket(w/2,h/2);
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
  }
}
