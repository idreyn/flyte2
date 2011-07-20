package flyte.events
{
	import flash.events.Event;
	
	public dynamic class GameEvent extends Event
	{
		public static const LOOP:String="gameLoop"
		public static const READY:String="gameReady"
		public function GameEvent(s:String)
		{	
			super(s)
		}
		
		public static function tick():GameEvent
		{
			return new GameEvent(GameEvent.LOOP)
		}
	}
}