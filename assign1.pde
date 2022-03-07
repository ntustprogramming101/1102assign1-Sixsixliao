PImage groundhogImg;
PImage bgImg;
PImage lifeImg;
PImage robotImg;
PImage soldierImg;
PImage soilImg;
float centerX;
float laserX,laserY;
int soldierX,soldierY;
int robotX,robotY;
int laserSpeed;

void setup() {
	size(640, 480, P2D);
  soldierX = 0;
  soldierY = 160 + floor(random(160,400))%4*80;
  robotX = 160 + floor(random(160,640))%4*80;
  robotY = 160 + floor(random(160,400))%4*80;
  centerX = width/2-40;
  laserSpeed =2;

  ellipse(590,50,120,120);
  noStroke();
  fill(253,184,19);
 
  bgImg = loadImage("img/bg.jpg");
  groundhogImg = loadImage("img/groundhog.png");
  lifeImg = loadImage("img/life.png");
  robotImg = loadImage("img/robot.png");
  soldierImg = loadImage("img/soldier.png");
  soilImg = loadImage("img/soil.png");
}

void draw() {
	image(bgImg,0,0);

  noStroke();
  fill(124,204,25);
  rectMode(CORNER);
  rect(0,145,width,15);
  
  fill(255,255,0);
  ellipse(590,50,130,130);
  noStroke();
  
  fill(253,184,19);
  ellipse(590,50,120,120);
  noStroke();
  
  image(groundhogImg,centerX,80);
  
  image(lifeImg,10,10);
  image(lifeImg,80,10);
  image(lifeImg,150,10);
  
  image(soilImg,0,160);
  
  image(robotImg,robotX,robotY);
  stroke(255,0,0);
  strokeWeight(10);
  line(laserX,robotY+37,laserX-25,robotY+37);
  laserX -= laserSpeed;
  if(laserX <= robotX-165){
  laserX = robotX+25;
  }
 
  image(soldierImg,soldierX,soldierY);
  soldierX += 3;
  if(soldierX >= floor(640)){
  soldierX *=-1;
  soldierX %= 640;
  }
}
