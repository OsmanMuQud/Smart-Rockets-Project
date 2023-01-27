Ant ants[];
Grid grid[][];
int scl=20;
void setup(){
  size(700,700);
  ants=new Ant[10];
  for(int i=0;i<10;i++)
  ants[i]=new Ant(699,699);
  grid=new Grid[width/scl][height/scl];
  for(int i=0;i<grid.length;i++)
    for(int j=0;j<grid[0].length;j++)
      grid[i][j]=new Grid(i*scl,j*scl);
}

void draw(){
  
  background(255);
  
  frameRate(10);
  for(int i=0;i<grid.length;i++){
    for(int j=0;j<grid[0].length;j++){
       grid[i][j].show();
       grid[i][j].update();
       
    }
  }
  for(Ant ant:ants){
    ant.update(grid);
    ant.show();
  }
}
