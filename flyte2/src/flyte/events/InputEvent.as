package flyte.events
{
	import flash.events.Event;
	
	public dynamic class InputEvent extends Event
	{
		public static const DOWN:String = "keyDown"
		public static const UP:String = "keyUp"
		
		public var keyCode:uint
		
		public function InputEvent(s:String):void
		{
			super(s)
		}
		
		public static function input(s:String,k:uint):InputEvent
		{
			var e:InputEvent = new InputEvent(s)
			e.keyCode = k
			return e
		}
	}
}