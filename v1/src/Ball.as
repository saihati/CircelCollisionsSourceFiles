package  
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	public class Ball extends MovieClip
	{
		
		public var speed:Point;
		public var ballRadius:int;
		
		public function Ball(xPos:int, yPos:int, rad:int)
		{
			speed = new Point( (Math.random() * 3)+2, (Math.random() * 3)+2);
			x = xPos;
			y = yPos;
			ballRadius = rad;
		}
		
		public function update():void {
			x += speed.x;
			y += speed.y;
			if (x >= 300-ballRadius && speed.x > 0) speed.x = -speed.x;
			if (x <= ballRadius && speed.x < 0) speed.x = -speed.x;
			if (y >= 200-ballRadius && speed.y > 0) speed.y = -speed.y;
			if (y <= ballRadius && speed.y < 0) speed.y = -speed.y;
			
			graphics.clear();
			graphics.beginFill(0xFF0000);
			graphics.drawCircle(0, 0, ballRadius);
			graphics.endFill();
			trace(x);
		}
		
	}

}