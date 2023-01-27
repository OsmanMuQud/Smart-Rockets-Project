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
   int dx=0,dy=0;
   for(int di=-1;di<=1;di++){
     for(int dj=-1;dj<=1;dj++){
       if(toFood&&grid[i][j].redPhero<grid[i][j].redPhero){dy=dj;dx=di;}
       else if(grid[i][j].bluePhero<grid[i][j].bluePhero){dy=dj;dx=di;}
        
     }
   }
   if(i==0&&j==0)toFood=false;
   if(i==34&&j==34)toFood=true;
   while(dx==0&&dy==0){
     dx+=(int)random(-2,2);
     dy+=(int)random(-2,2);
   }
   x+=(dx*scl);
   y+=(dy*scl);
   if(x<0||x>=width)x-=(dx*scl);
   if(y<0||y>=height)y-=(dy*scl);
   if(toFood){
     grid[i][j].redPhero-=100;
     if(grid[i][j].redPhero<0)grid[i][j].redPhero=0;
   }else{
     grid[i][j].bluePhero-=100;
     if(grid[i][j].bluePhero<0)grid[i][j].bluePhero=0;
   }
 }
 void show(){
   fill(100);
   square(x-(x%scl),y-(y%scl),scl);
 }

}
