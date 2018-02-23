package  
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
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
		
		public function detectCollisions():void {
			this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
			for (var n:int = 0; n < Game.balls.length; n++) {
				if (Game.balls[n] != this) {
					if (x + ballRadius + Game.balls[n].ballRadius > Game.balls[n].x 
					&& x < Game.balls[n].x + ballRadius + Game.balls[n].ballRadius
					&& y + ballRadius + Game.balls[n].ballRadius > Game.balls[n].y 
					&& y < Game.balls[n].y + ballRadius + Game.balls[n].ballRadius) {
						if (distanceTo(this, Game.balls[n])< ballRadius + Game.balls[n].ballRadius) {
							this.transform.colorTransform = new ColorTransform(0, 0, 0, 1, 0, 255, 0, 0);
						}
					}
				}
			}
		}
		
		public function distanceTo(a:*, b:*):Number {
			var distance:Number = Math.sqrt(((a.x - b.x) * (a.x - b.x)) + ((a.y - b.y) * (a.y - b.y)));
			if (distance < 0) { distance = distance * -1; }
			return distance;
		}
		
	}

}