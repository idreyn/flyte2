package flyte.cogs
{
	import flash.events.EventDispatcher;
	
	import flyte.core.Base;
	import flyte.core.Body;

	public class BaseCog extends EventDispatcher
	{
		protected var _target:Base
		
		public function get target():Base
		{
			return _target
		}
		
		public function get bTarget():Body
		{
			return _target as Body;
		}
		
		public function overrideTarget(t:Base):void
		{
			_target = t
		}
		
	}
}