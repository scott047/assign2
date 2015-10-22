PImage background1Img;
PImage background2Img;
PImage background3Img;
PImage start1Img;
PImage start2Img;
PImage end1Img;
PImage end2Img;
PImage shipImg;
PImage hpImg;
PImage enemyImg;
PImage treasureImg;
float enemyX,enemyY,treasureX,treasureY,backgroundX,backgroundY,backgroundZ,hpX,hpY,blood,speedX,speedY,shipX,shipY;
final int GAME_START=1,GAME_RUN=2,GAME_LOSE=3;
int gameState;
boolean upPressed=false;
boolean leftPressed=false;
boolean downPressed=false;
boolean rightPressed=false;

void setup(){
  size(640,480);
  background1Img=loadImage("img/bg1.png");
  background2Img=loadImage("img/bg2.png");
  background3Img=loadImage("img/bg1.png");
  end1Img=loadImage("img/end2.png");
  end2Img=loadImage("img/end1.png");
  start1Img=loadImage("img/start2.png");
  start2Img=loadImage("img/start1.png");
  hpImg=loadImage("img/hp.png");
  enemyImg=loadImage("img/enemy.png");
  treasureImg=loadImage("img/treasure.png");
  shipImg=loadImage("img/fighter.png");
  speedX=floor(random(2,5));
  speedY=floor(random(-2,2));
  treasureX=floor(random(20,620));
  treasureY=floor(random(20,200));
  backgroundX=0;
  shipX=610;
  shipY=220;
  enemyX=20;
  enemyY=floor(random(40,440));
  hpX=20;
  hpY=20;
  blood=69;
  gameState=GAME_START;
  }

void draw(){
  switch(gameState){
    case GAME_START:
  image(start1Img,0,0);
   if(mouseX>=200&&mouseX<=440&&mouseY>=380&&mouseY<=420){
   image(start2Img,0,0);
   if(mousePressed){
   gameState=GAME_RUN;
   }
  }
  break;
  case GAME_RUN:
  image(background1Img,backgroundX,0);
  image(background2Img,backgroundY,0);
  image(background3Img,backgroundZ,0);
  fill(220,0,0);
  rectMode(CORNERS);
  rect(30,20,blood,40);
  image(hpImg,hpX,hpY);
  image(enemyImg,enemyX,enemyY);
  image(treasureImg,treasureX,treasureY);
  image(shipImg,shipX-20,shipY-20);
  if(treasureX+40>=shipX&&shipX+40>=treasureX){
    if(treasureY+40>=shipY&&shipY+40>=treasureY){
    treasureX=floor(random(20,620));
    treasureY=floor(random(20,200));
    blood+=19.5;
    }
  }
     if(enemyX+40>=shipX&&shipX+40>=enemyX){
       if(enemyY+40>=shipY&&shipY+40>=enemyY){
       speedX=floor(random(2,5));
       speedY=floor(random(-2,2));
       enemyX=20;
       enemyY=floor(random(40,440));
       blood-=39;
       }
    }
    if(enemyX>680||enemyX<-40||enemyY<-40||enemyY>480){
      
      speedX=floor(random(2,5));
      speedY=floor(random(-2,2));
       enemyX=20;
       enemyY=floor(random(40,440));
    }
  enemyX+=speedX;
  enemyY+=speedY;
  backgroundX++;
  backgroundY=backgroundX-640;
  backgroundZ=backgroundY-640;
  backgroundX=backgroundX%1280;
  if(enemyY>=shipY&&enemyX>=120){
    speedY=-2;
  }
  if(enemyY<=shipY&&enemyX>=120){
    speedY=2;
  }
 if(upPressed){
   shipY=shipY-3;
 }
 
 if(downPressed){
   shipY=shipY+3;
 }
 
 if(rightPressed){
   shipX=shipX+3;
 }
 
 if(leftPressed){
   shipX=shipX-3;
 }
 if(shipX>=610){
   shipX=610;
 }
 if(shipX<=20){
   shipX=20;
 }
 if(shipY<=20){
   shipY=20;
 }
 if(shipY>=450){
   shipY=450;
 }
 if(blood>=225){
 blood=225;
 }
 if(blood<=30){
    gameState=GAME_LOSE;
  }
  break;
  case GAME_LOSE:
    image(end1Img,0,0);
   if(mouseX>=200&&mouseX<=440&&mouseY>=300&&mouseY<=360){
   image(end2Img,0,0);
   if(mousePressed){
   gameState=GAME_RUN;
   fill(220,0,0);
   blood=69;
   rectMode(CORNERS);
   rect(30,20,blood,40);
   shipX=610;
   shipY=220;
   enemyX=20;
   enemyY=floor(random(40,440));
   treasureX=floor(random(20,620));
   treasureY=floor(random(20,200));
  
     }
    }
    break;
   }
  }

 void keyPressed(){
    if(key==CODED){
   switch (keyCode){
   case UP:
       upPressed=true;
       break;
   case DOWN:
       downPressed=true;
       break;
   case RIGHT:
       rightPressed=true;
       break;
   case LEFT:
       leftPressed=true;
       break;
   }
   }
  }


void keyReleased(){
    if(key==CODED){
   switch (keyCode){
   case UP:
       upPressed=false;
       break;
   case DOWN:
       downPressed=false;
       break;
   case RIGHT:
       rightPressed=false;
       break;
   case LEFT:
       leftPressed=false;
       break;
   }
   }
  }
