package flyte.cogs
{
	import flyte.core.Base;
	import flyte.events.GameEvent;
	public class GravityCog extends BaseCog
	{
		private var _enabled:Boolean=true
		private var _velocity:Number=0
		private var _ground:Boolean=false
		public function GravityCog(t:Base){
			this._target = t
			t.event.onLoopDo(doGravity)
		}
		
		public function addVelocity(v:Number):void
		{
			bTarget.velocityY += v
		}
		
		private function doGravity(e:GameEvent):void
		{
			if(!_enabled){
				return
			}
			if(_ground){
			}else{
				bTarget.velocityY += _target.world.gravity
				bTarget.y += bTarget.velocityY
			}
			
		}
		
		public function onGround():void{
			_ground = true
		}
		
		public function offGround():void{
			_ground = false
			bTarget.velocityY = 0
		}
		
		public function enable(s:Number=0):void
		{
			bTarget.velocityY = s
			_enabled = true
		}
		
		public function disable():void
		{
			_enabled = false
		}
		
		public function get enabled():Boolean
		{
			return _enabled
		}
		
		public function get velocityY():Number
		{
			return bTarget.velocityY
		}
		
		public function get falling():Boolean
		{
			return !_ground
		}
		
		public function reboundTop(m:Number=1):void
		{
			enable(Math.abs(m))
		}
	}
}