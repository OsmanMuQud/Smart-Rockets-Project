class Ant{
int x,y;
boolean toFood=true;
 Ant(int x,int y){
   this.x=x;
   this.y=y;
   //vel.setMag(0.5);
 }
 void update(Grid grid[][]){
   int i=(int)x/scl;
   int j=(int)y/scl;
   
   float redP=0;
   float blueP=0;
   int dx=0,dy=0;
   ArrayList <Grid>neigh=new ArrayList<Grid>();
   for(int di=-1;di<=1;di++){
     for(int dj=-1;dj<=1;dj++){
       if(di==dj&&di==0)continue;
       neigh.add(grid[i+di][j+dj]);
     }
   }
   
   while(dx==0&&dy==0){
     if(toFood){
       dy=-1;dx=-1;
       if(blueP<=grid[i][j].bluePhero){dy=(int)random(-2,2);dx=(int)random(-2,2);}
     }
     else {
       println("here");
       dy=1;dx=1;
       if(redP<=grid[i][j].redPhero){dy=(int)random(-2,2);dx=(int)random(-2,2);}
       
   println(" moved: ",dy,dx);
     }
   }
   x+=(dx*scl);
   y+=(dy*scl);
   if(x<0||x>=width)x-=(dx*scl);
   if(y<0||y>=height)y-=(dy*scl);
   if(toFood){
     grid[i][j].redPhero-=100;
   }else{
     grid[i][j].bluePhero-=100;
   }
   if(i==0&&j==0)toFood=false;
   if(i==34&&j==34)toFood=true;
 }
 void show(){
   fill(30,100,40);
   if(toFood)
   fill(100,30,0);
   square(x-(x%scl),y-(y%scl),scl);
 }

}
