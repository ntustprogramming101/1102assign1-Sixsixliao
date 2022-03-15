PImage groundhogImg;
PImage bgImg;
PImage lifeImg;
PImage robotImg;
PImage soldierImg;
PImage soilImg;

//conjecture
float centerX;
float laserX,laserY;
int soldierX,soldierY;
int robotX,robotY;
int laserSpeed;

void setup() {
	size(640, 480, P2D);
  //soldier start
  soldierX = -80;
  soldierY = 160 + floor(random(160,400))%4*80;
  
  //robot start
  robotX = 160 + floor(random(160,640))%4*80;
  robotY = 160 + floor(random(160,400))%4*80;
  
  //groundhog
  centerX = width/2-40;
  
  //laserspeed
  laserSpeed =2;
 
 //loadimg
  bgImg = loadImage("img/bg.jpg");
  groundhogImg = loadImage("img/groundhog.png");
  lifeImg = loadImage("img/life.png");
  robotImg = loadImage("img/robot.png");
  soldierImg = loadImage("img/soldier.png");
  soilImg = loadImage("img/soil.png");
}

void draw() {
  //sky
	image(bgImg,0,0);

  //grass
  noStroke();
  fill(124,204,25);
  rectMode(CORNER);
  rect(0,145,width,15);
  
  //sun
  fill(255,255,0);
  ellipse(590,50,130,130);
  noStroke();
  fill(253,184,19);
  ellipse(590,50,120,120);
  noStroke();
  
  //groundhog
  image(groundhogImg,centerX,80);
  
  //3life
  image(lifeImg,10,10);
  image(lifeImg,80,10);
  image(lifeImg,150,10);
  
  //soil
  image(soilImg,0,160);
  
  //robot+laser
  image(robotImg,robotX,robotY);
  stroke(255,0,0);
  strokeWeight(10);
  //
  line(laserX,robotY+37,laserX-40,robotY+37);
  laserX -= laserSpeed;
  if(laserX-40 <= robotX-160){
  laserX = robotX+25;
  }
  
 //soldier walk
  image(soldierImg,soldierX,soldierY);
  soldierX += 3;
  if(soldierX >= floor(640)){
  soldierX *=-1;
  soldierX %= 640-80;
  }
}
