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
		}
		
		public function detectCollisions():void {
			this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
			for (var n:int = 0; n < Game.balls.length; n++) {
				if (Game.balls[n] != this) {
					if (x + ballRadius + Game.balls[n].ballRadius > Game.balls[n].x 
					&& x < Game.balls[n].x + ballRadius + Game.balls[n].ballRadius
					&& y + ballRadius + Game.balls[n].ballRadius > Game.balls[n].y 
					&& y < Game.balls[n].y + ballRadius + Game.balls[n].ballRadius) {
						if (distanceTo(this, Game.balls[n]) < ballRadius + Game.balls[n].ballRadius) {
							this.transform.colorTransform = new ColorTransform(0, 0, 0, 1, 0, 255, 0, 0);
							drawCollision(this, Game.balls[n]);
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
		
		
		public function drawCollision(firstBall:Ball, secondBall:Ball):void {
			var x1:Number = firstBall.x;
			var x2:Number = secondBall.x;
			var y1:Number = firstBall.y;
			var y2:Number = secondBall.y;
			var r1:Number = firstBall.ballRadius;
			var r2:Number = secondBall.ballRadius;
			
			var collisionPoint:Point = new Point( (x1 * r2 + x2 * r1) / (r1 + r2), (y1 * r2 + y2 * r1) / (r1 + r2) );
			
			Game.collisionLayer.graphics.beginFill(0x0000FF);
			Game.collisionLayer.graphics.drawCircle(collisionPoint.x, collisionPoint.y, 5);
			Game.collisionLayer.graphics.endFill();
		}
		
	}

}