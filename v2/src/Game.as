package  
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;

	public class Game extends MovieClip
	{
		public static var balls:Vector.<Ball> = new Vector.<Ball>;
		
		public function Game() 
		{
			for (var n:int = 0; n < 4; n++) {
				var b:Ball = new Ball((n*50)+40, (n*30)+40, (n*4)+10);
				addChild(b);
				balls.push(b);
			}
			
		}
		
		public function update():void {
			for (var n:int = 0; n < balls.length; n++) 
				balls[n].update();
			for (n = 0; n < balls.length; n++) 
				balls[n].detectCollisions();
			
		}
		
		
	}

}