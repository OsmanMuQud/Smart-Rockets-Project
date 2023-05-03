class DNA{
  int gene[];
  DNA(int fuel){
    gene=new int[fuel];
    for(int i=0;i<fuel;i++){
      gene[i]=(int)random(-2,2);
    }
  }
  DNA(DNA a,DNA b){
    gene=new int[a.gene.length];
    if(random(1)<0.05){
    for(int i=0;i<gene.length;i++){
      if((i/2)%2==0){
        gene[i]=a.gene[i];
        gene[++i]=a.gene[i];
      }
      else{
        gene[i]=b.gene[i];
        gene[++i]=b.gene[i];
      }
      if(random(1)<=0.05){
        gene[i-1]=(int)random(-2,2);
        gene[i]=(int)random(-2,2);
      }
    }}
    else{
      for(int i=0;i<gene.length;i++){
      if((i/2)<gene.length){
        gene[i]=a.gene[i];
        gene[++i]=a.gene[i];
      }
      else{
        gene[i]=b.gene[i];
        gene[++i]=b.gene[i];
      }
      if(random(1)<=0.05){
        gene[i-1]=(int)random(-2,2);
        gene[i]=(int)random(-2,2);
      }
      
    }
  }
  }
}
