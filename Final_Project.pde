// Final Project
//Live Video
import processing.video.*;
import ddf.minim.*;


//Size of cells in grid
int videoScale = 10;
//Number of columns and rows
int cols, rows;
int lineHeight = 10;

Capture video;

//A String and Font
String chars = "Enjoy the power and beauty of your youth, oh, never mind. You will not understand the power and beauty of your youth until they've faded but trust me, in 20 years, you'll look back at photos of yourself and recall in a way you can't grasp now, how much possibility lay before you and how fabulous you really looked. You are not as fat as you imagine.  Don't worry about the future or know that worrying is as effective as trying to solve an algebra equation by chewing bubble gum. The real troubles in your life are apt to be things that never crossed your worried mind, the kind that blindsides you at 4 p.m. on some idle Tuesday.Do one thing every day that scares you. Don't be reckless with other people's hearts, don't put up with people who are reckless with yours. Floss. Don't waste your time on jealousy. Sometimes you're ahead, sometimes you're behind, the race is long and in the end, it's only with yourself. Remember compliments you receive, forget the insults, if you succeed in doing this, tell me how. Keep your old love letters, throw away your old bank statements. Stretch. The most interesting people I know didn't know at 22 what they wanted to do with their lives. Some of the most interesting 40-year-olds I know still don't. Get plenty of calcium. Be kind to your knees you'll miss them when they're gone. Maybe you'll marry, maybe you won't. Maybe you'll have children, maybe you won't. Maybe you'll divorce at 40, maybe you'll dance the Funky Chicken on your 75th wedding anniversary. Whatever you do, don't congratulate yourself too much or berate yourself either. Your choices are half chance, so are everybody else's. Enjoy your body, use it every way you can. Don't be afraid of it or what other people think of it. It's the greatest instrument you'll ever own. Dance, even if you have nowhere to do it but your own living room. Read the directions even if you don't follow them. Do not read beauty magazines, they will only make you feel ugly. Get to know your parents, you never know when they'll be gone for good. Be nice to your siblings, they're your best link to your past and the people most likely to stick with you in the future. Understand that friends come and go but a precious few, who should hold on. Work hard to bridge the gaps in geography and lifestyle for as the older you get, the more you need the people you knew when you were young. Live in New York City once but leave before it makes you hard. Live in northern California once but leave before it makes you soft. Travel. Accept certain inalienable truths. Prices will rise, politicians will philander, you, too, will get old and when you do, you'll fantasize that when you were young prices were reasonable, politicians were noble and children respected their elders. Respect your elders. Don't expect anyone else to support you. Maybe you have a trust fund, maybe you'll have a wealthy spouse but you never know when either one might run out. Don't mess too much with your hair or by the time you're 40 it will look 85.  Be careful whose advice you buy but be patient with those who supply it. Advice is a form of nostalgia, dispensing it is a way of fishing the past from the disposal, wiping it off, painting over the ugly parts and recycling it for more than it's worth.";
PFont f;


AudioPlayer player;
Minim minim;//audio context
int mode = 0;

void setup(){
   size(640,480);
   //Set up Colums/rows
   cols = width/videoScale;
   rows = height/videoScale;
   background(0);
  //Initialize Capture Object
  //(Alert Applet,Width,Height,Framerate)
  video = new Capture(this,cols,rows,15);
  video.start();

  //load font
  f = loadFont("Apple-Chancery-13.vlw");
     video,start
  minim = new Minim(this);
  player = minim.loadFile("sunscreen.mp3");
 
}

void draw(){
  background(0);
  //Read Camera Image
  if (video.available()) {
    //True- Read it
    video.read();
  }
   //Display Image
   video.loadPixels();
  
  //count through string
   int charcount = 0;
  
   if(mode == 0){
   //do nothing
   }
       else if(mode == 1){
         player.play();
    //Row Loops
    for (int j = 0; j < rows; j++) {
      //Column Loops
      for (int i = 0; i < cols; i++) {
        int x = i*videoScale;
        int y = j*videoScale;
      
        //Appropriate color in pixel array
        color c = video.pixels[i+j*video.width];
      
          //Display individual String Characters
          textFont(f);
          fill(c);
          text(chars.charAt(charcount),x,y);
          //Walk through String
          charcount = (charcount + 1) % chars.length();
         }
       }
     }   

      else if(mode == 2){
          player.close(); 
          super.stop();
            }
             image(video, 0, 0);
}


void keyPressed(){
  if(key == '0'){
   mode = 0;
   }
  
  else if (key == ' '){
    mode = 1;  
    } 
  else if (key == '1'){
    mode = 2;
  }
}



 //Restart Rotation
 if (keyCode == '1'){
   background(0);
 }




