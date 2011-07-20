package flyte.cogs
{
	import flash.events.KeyboardEvent;
	
	import flyte.core.Base;
	import flyte.events.InputEvent;
	public class InputCog extends BaseCog
	{
		private var _keyList:Array
		private var _enabled:Boolean = true
		
		public function InputCog(t:Base):void
		{
			_keyList = []
			_target = t
			t.event.onReadyDo(function():void
			{
				t.stage.addEventListener(KeyboardEvent.KEY_DOWN,keyDown)
				t.stage.addEventListener(KeyboardEvent.KEY_UP,keyUp)
			}
			)
		}
		
		private function keyDown(e:KeyboardEvent):void
		{
			if(enabled){
				_keyList[e.keyCode] = true
				dispatchEvent(InputEvent.input(InputEvent.DOWN,e.keyCode))
			}
		}
		
		private function keyUp(e:KeyboardEvent):void
		{
			if(enabled){
				_keyList[e.keyCode] = false
				dispatchEvent(InputEvent.input(InputEvent.UP,e.keyCode))
			}
		}
		
		public function isDown(i:uint):Boolean
		{
			return _keyList[i] && _keyList[i] != null
		}
		
		public function get enabled():Boolean
		{
			return _enabled
		}
		
		public function enable():void
		{
			_enabled = true
		}
		
		public function disable():void
		{
			for(var i:uint=0;i<255;i++)
			{
				_keyList[i] = false
			}
			_enabled = false
		}
	}
}