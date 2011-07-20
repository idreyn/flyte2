package flyte.cogs
{
	import flyte.core.Body;
	import flyte.events.GameEvent;
	
	public class VelocityControlCog extends BaseCog
	{
		public var min:Number
		public var max:Number
		private var bodyTarget:Body
		public function VelocityControlCog(t:Body,min:Number,max:Number)
		{
			this.min = min
			this.max = max
			_target = t
			_target.event.onLoopDo(update)
			bodyTarget = Body(_target)
		}
		
		public function update(e:GameEvent):void
		{
			var pos:int = bodyTarget.velocityX > 0?1:-1
			if(Math.abs(bodyTarget.velocityX) > max)
			{
				bodyTarget.velocityX = max*pos
			}else if(Math.abs(bodyTarget.velocityX) < min)
			{
				bodyTarget.velocityX = min*pos
			}
		}
	}
}