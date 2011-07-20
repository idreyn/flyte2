package blizzard.elements
{
	import caurina.transitions.Tweener;
	
	import flyte.elements.Terrain;
	import flyte.events.GameEvent;

	public class WobblyPlatform extends flyte.elements.Terrain
	{
		public function WobblyPlatform()
		{
			event.onLoopDo(function(e:GameEvent):void
			{
				var r:Number = 0
				if(self.hitTestObject(world.hero))
				{
					r =  ( world.hero.x - self.x ) / (self.width / 35)
				}
				
				if(r != self.rotation)
				{
					Tweener.addTween(self,{rotation:r,time:0.1 * (self.width / 200),transition:'easeOutBounce'})
				}
			})
			
		}
		
		
	}
}