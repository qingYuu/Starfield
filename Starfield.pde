Particle[]slaine;
PImage ocean;
void setup()
{   
	
	size(300,300);
	ocean = loadImage("deepsea.jpg");
	slaine= new Particle[100];
    for(int i=0;i<slaine.length;i++)
    {
    	if (i%3==0) 
    	{	
    	slaine[i]= new JumboParticle();
    	}
    	else if(i%3==1)
    	{
    	slaine[i]=new OddballParticle();
    	}
    	else 
    	{
    	slaine[i]=new NormalParticle();
    	}	
    }
}  
void draw()
{  
	//background(0, 0, 0);
	
	
    image(ocean,0,0,300,300);

	for(int i=0;i<slaine.length;i++)
   {
      slaine[i].move();
      slaine[i].show();
   }

}
class NormalParticle implements Particle
{
	double x, y, angle, speed;
	int paint;
    PImage fire;
    
	NormalParticle()
	{ 
	  x=150;
	  y=150;
	  angle=Math.random()*2*Math.PI;
	  speed=(Math.random()*2);
	  paint=color(245,24,12);
      fire=loadImage("bubble-1.png");
      
	 
	}
	public void move()
	{
      x +=Math.cos(angle)*speed;
      y +=Math.sin(angle)*speed;
      if(x<0||x>300||y<0||y>300)
        {
        	x=150;
	        y=150;
	         
	    } 
	  if(y==300&&300<x||x<0)
        {
    	x=100;
    	y=0;
	    } 
	    x++;
	    y++;
     
        }	

	public void show()
	{
	  noStroke();
      fill(paint);
      image(fire,(float)x,(float)y,10,10);
      
     
	//background(0, 0, 0);
	}   
}
interface Particle
{
	public void move();
	public void show();
}
class OddballParticle implements Particle
{    
	double x, y, angle, speed;
	int paint, direX, direY;
	OddballParticle()
	{
		x=150;
		y=150;
		angle+=Math.random()*2*Math.PI;
		speed=(Math.random()*2);
		paint=color(0,255,162);
		
	}
	public void move()
	{
       // x+=angle*speed*direX-3;
       // y+=angle*speed*direY+3;

        
       if(x<0||x>300||y<0||y>300)
        {
        	x=150;
	        y=290;
	    }
        x +=Math.cos(angle)*speed;
        y +=Math.sin(angle)*speed;
    }
	public void show()
	{
        noStroke();
        fill(paint);
        ellipse((float)x,(float)y,10,10);
	}
        

}
class JumboParticle extends NormalParticle//uses inheritance
{
	PImage fire2;
	JumboParticle()
	{
        fire2=loadImage("perfect_bubble.png");
	}
	public void show()
	{
		image(fire2,(float)x,(float)y,10,10);
	}
}
