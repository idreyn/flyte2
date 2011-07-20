package blizzard
{
	import flash.events.Event;
	
	import flyte.ai.WalkingEnemy;
	import flyte.core.Body;
	import flyte.events.CollisionEvent;

	public class Waiter extends flyte.ai.WalkingEnemy
	{
		public function Waiter()
		{
			this.reverseOnCollide = true
			this.reverseOffset = 200
			this.dir = -1
				
			event.onLoopDo(function(e:Event):void
			{
				x += 4 * dir
			})
				
		}
	}
}