package flyte.events
{
	import flash.events.Event;
	
	import flyte.core.Base;
	
	public class CollisionEvent extends Event
	{
		public static const COLLIDE:String = "collision"
		public static const END_COLLIDE:String = "endCollision"
		public static const TOP:String = "collisionTop"
		public static const BOTTOM:String = "collisionBottom"
		public static const LEFT:String = "collisionLeft"
		public static const RIGHT:String = "collisionRight"
		
		public var collisionType:String
		
		public function CollisionEvent(name:String,cType:String)
		{
			super(name)
			this.collisionType = cType
		}
		
	}
}