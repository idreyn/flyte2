package flyte.core
{
	import flyte.events.CollectionEvent;
	import flyte.events.GameEvent;

	public class Collectible extends Base
	{
		public var collected:Boolean = false
			
		public function Collectible()
		{
			event.onLoopDo(onLoop)
		}
		
		private function onLoop(e:GameEvent):void
		{
			if(self.hitTestObject(self.world.hero) && !collected)
			{
				event.fire(new CollectionEvent(CollectionEvent.COLLECTED))
				event.onLoopDont(onLoop)
				collected = true
			}
		}
	}
}