import java.util.*;

PImage original;
PImage copy;
int n= 50;
void setup(){
size(1000,1000);
  original = loadImage("nature1.jpg");
  original.resize(500,500);
  image(original,0,0);
  copy = original.copy();
  
 
kMeans(n);
image(copy,500,500);
}

void kMeans(int k){
copy.loadPixels();
color means[] = new color[k];
int max = original.pixels.length;

for(int i =0 ; i< k ; i++){
  
  means[i]=copy.pixels[int(random(0,max))]; // setting centroids at random
}
int index=0;
for(int i =0; i<copy.pixels.length; i++){
   ArrayList dist = new ArrayList<Integer>();
    for(int j =0 ;j< k ; j++){
      int dist1 = int(sqrt((red(means[j])-red(copy.pixels[i]))* (red(means[j])-red(copy.pixels[i])) + (green(means[j])-green(copy.pixels[i]))* (green(means[j])-green(copy.pixels[i])) + (blue(means[j])-blue(copy.pixels[i]))* (blue(means[j])-blue(copy.pixels[i]))  ));
      dist.add( dist1);
      int min = Collections.min(dist);
      index = dist.indexOf(min);
    }
copy.pixels[i]= means[index];
}
}
