package flyte.cogs
{
	import flash.geom.Point;
	
	import flyte.core.Base;
	import flyte.events.GameEvent;
	
	public class DisplacementCog extends BaseCog
	{
		private var lastX:Number
		private var lastY:Number
		private var p:Point
		
		public function DisplacementCog(t:Base)
		{
			this._target = t
			_target.event.onLoopDo(setDisplacement)
			p = new Point(0,0)
			lastX = t.x
			lastY = t.y
		}
		
		private function setDisplacement(e:GameEvent):void
		{
			p.x = lastX = (_target.x - lastX)
			p.y = lastY = (_target.y - lastY)
			lastX = _target.x
			lastY = _target.y
		}
		
		public function get point():Point
		{
			return p
		}
	}
}