package flyte.cogs
{
	import flyte.core.Base;
	import flyte.core.Body;
	import flyte.events.GameEvent;
	import flyte.events.InputEvent;
	import flyte.io.Input;
	
	public class PlayerControlCog extends BaseCog
	{
		private var _bodyTarget:Body
		private var input:InputCog
		public var friction:Number
		public var maxJumps:uint=1
		private var jumpsSinceGround:uint=0
		private var _frictionOriginal:Number=0.98
		
		public var maxVelocity:Number = 10
		public var minVelocity:Number = 0
		public var velocityDamping:Number = 0.95
		public var velocityAccel:Number = 1
		
		public var direction:DirectionCog
		
		private function get rightDown():Boolean
		{
			return input.isDown(Input.RIGHT)
		}
		
		private function get leftDown():Boolean
		{
			return input.isDown(Input.LEFT)
		}
		
		public function PlayerControlCog(t:Base)
		{
			direction = new DirectionCog(this)
			friction = _frictionOriginal
			this._target = t
			input = new InputCog(_target)
			t.event.onLoopDo(move)
			input.addEventListener(InputEvent.DOWN,onKeyDown)
			input.addEventListener(InputEvent.UP,onKeyUp)
		}
		
		private function onKeyDown(e:InputEvent):void
		{
			if(e.keyCode == Input.JUMP)
			{
				if(jumpsSinceGround < maxJumps){
					jumpsSinceGrou[[nd++
					_target.jump()
				}
			}
		}
		
		
		private function onKeyUp(e:InputEvent):void
		{
		}
		
		private function move(e:GameEvent):void
		{
			if(_target is Body){
				var _bTarget:Body = Body(_target)
				var v:Number = Body(_target).velocityX
				Body(_target).velocityX = Math.min(maxVelocity,Math.max(minVelocity,v))
			}
		}
		
	}
}