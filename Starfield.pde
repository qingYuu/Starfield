Particle[]slaine;
void setup()
{
	size(300,300);
	slaine= new Particle[100];
    for(int i=0;i<slaine.length;i++)
    {
    	if (i%3==0) 
    	{	
    	slaine[i]= new NormalParticle();
    	}
    	else if(i%3==1)
    	{
    	slaine[i]=new OddballParticle();
    	}
    	else
    	{
    	slaine[i]=new JumboParticle();
    	}	
    }
  
}
void draw()
{  
	background(0, 0, 0);
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
	NormalParticle()
	{ 
	  x=150;
	  y=150;
	  angle=Math.random()*2*Math.PI;
	  speed=Math.random()*3;
	  paint=color(245,24,12);
	 
	}
	public void move()
	{
      x +=Math.cos(angle)*speed;
      y +=Math.sin(angle)*speed;
     
    }	     
	public void show()
	{
	  noStroke();
      fill(paint);
      ellipse((float)x,(float)y,5,5);
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
		angle=Math.random()*2*Math.PI;
		speed=Math.random()*3;
		paint=color(0,255,162);
		direX=1;
	    direY=1;
	}
	public void move()
	{
        if(x<0)
        {
          direX=1;
        }
        if(x>300)
        {
          direX=-1;
        }
        if(y<0)
        {
          direY=1;
        }
        if(y>300)
        {
          direY=-1;
        }
        x+=Math.random()*speed*direX-3;
        y+=Math.random()*speed*direY-3;
         
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
	public void show()
	{
		ellipse((float)x,(float)y,7,7);
	}
}
