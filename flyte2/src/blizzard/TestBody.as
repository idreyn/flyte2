package test
{
	import flyte.core.Body;
	import flyte.events.ActionEvent;

	public class TestBody extends Body
	{
		public function TestBody()
		{
			this.velocityDamping = 1
			this.velocityX = 5
			this.animation.display("run",true)
			event.when(ActionEvent.LEAVE_WORLD,function(e:ActionEvent):void
			{
				visible = false
				event.disable()
			})
		}
	}
}