package flyte.utils
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class Wait
	{
		public static function doIn(m:uint,f:Function):void
		{
			var t:Timer = new Timer(m,1)
			t.addEventListener(TimerEvent.TIMER,function(e:TimerEvent):void
			{
				f.call()
			})
			t.start()
		}
	}
}