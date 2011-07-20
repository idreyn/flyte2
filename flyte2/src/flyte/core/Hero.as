package flyte.core
{
	import flash.geom.Point;
	
	import flyte.cogs.InputCog;
	import flyte.cogs.VelocityControlCog;
	import flyte.events.ActionEvent;
	import flyte.events.GameEvent;
	import flyte.events.InputEvent;
	import flyte.io.Input;
	
	public class Hero extends Animate
	{
		public var input:InputCog
		public var velocityControl:VelocityControlCog
		public var acceleration:Number=1
		public var jumpHeight:Number=30
		public function Hero()
		{
			velocityControl = new VelocityControlCog(this,0,100)
			input = new InputCog(this)
			input.addEventListener(InputEvent.DOWN,keyDown)
			input.addEventListener(InputEvent.UP,keyUp)
			event.onLoopDo(update)
		}
		
		private function update(e:GameEvent):void
		{
			if(input.isDown(Input.RIGHT))
			{
				velocityX += acceleration * ((ground == null)?1:ground.frictionCoef)
			}
			
			if(input.isDown(Input.LEFT))
			{
				velocityX -= acceleration * ((ground == null)?1:ground.frictionCoef)
			} 
	
			if(this.onGround)
			{
				if(! (input.isDown(Input.LEFT) || input.isDown(Input.RIGHT) ) ) {
					this.enableMovement = false
				} else {
					this.enableMovement = true
				}
			} else {
				this.enableMovement = true
			}
		}
		
		private function keyDown(e:InputEvent):void
		{
			if(e.keyCode == Input.LEFT || e.keyCode == Input.RIGHT)
			{
				event.fire(new ActionEvent(ActionEvent.BEGIN_MOVING))
			}
			if(e.keyCode == Input.RIGHT)
			{
				if(direction.isLeft)
				{
					event.fire(new ActionEvent(ActionEvent.BEGIN_MOVE_RIGHT))
					direction.right()
				}
			}
			if(e.keyCode == Input.LEFT)
			{
				if(direction.isRight)
				{
					event.fire(new ActionEvent(ActionEvent.BEGIN_MOVE_LEFT))
					direction.left()
				}	
				
			}
			
			if(e.keyCode == Input.JUMP && this.onGround)
			{
				event.fire(new ActionEvent(ActionEvent.JUMP))
				doJump(this.jumpHeight)
			}
		}
		
		private function keyUp(e:InputEvent):void
		{
			if(!(input.isDown(Input.LEFT) || input.isDown(Input.RIGHT)))
			{
				event.fire(new ActionEvent(ActionEvent.STOP_MOVING))
			}
		}
		
		
		}
}