package flyte.elements
{
	
	import flyte.core.Base;
	import flyte.events.GameEvent;

	public class Background extends Base
	{
		public var level:Number = 0
			
		public function Background(l:Number = 2)
		{
			level = l
			var ox:Number = this.x
			var oy:Number = this.y
			event.onLoopDo(function(e:GameEvent):void
			{
				x = ox + ((0 - world.x) / level)
				y = oy + ((0 - world.y) /  level)
			})
		}
		
	}
}