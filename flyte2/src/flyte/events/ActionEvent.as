package flyte.events
{
	import flash.events.Event;

	public class ActionEvent extends Event
	{
		public static const BEGIN_MOVE_RIGHT:String = "bmr"
		public static const BEGIN_MOVE_LEFT:String = "bml"
		public static const BEGIN_MOVING:String = "bm"
		public static const STOP_MOVING:String = "sm"
		public static const JUMP:String = "jump"
		public static const LAND:String = "land"
		public static const LEAVE_WORLD:String = "leaveWorld"
		public var data:Object
		
		public function ActionEvent(type:String,d:Object=null)
		{
			this.data = d
			super(type)
		}
	}
}