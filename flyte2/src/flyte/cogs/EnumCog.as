package flyte.cogs
{
	import flash.events.EventDispatcher;
	import flyte.core.*
	
	public class EnumCog extends BaseCog
	{
		private var _staticList:Array
		private var _bodyList:Array
		private var _animateBodyList:Array
		private var _inanimateBodyList:Array
		
		public function EnumCog(target:Base)
		{
			this._target = target
			_staticList = []
			_bodyList = []
			_animateBodyList = []
			_inanimateBodyList = []
		}
		
		public function register(b:Base):void
		{
			if(b is Body){
				tryAdding(_bodyList,b)
				if(b is Animate){
					tryAdding(_animateBodyList,b)
				}else if(b is Inanimate){
					tryAdding(_inanimateBodyList,b)
				}
			}else if(b is Static){
				tryAdding(_staticList,b)
			}
		}
		
		public function unregister(b:Base):void
		{
			tryRemoving(_bodyList,b)
			tryRemoving(_animateBodyList,b)
			tryRemoving(_inanimateBodyList,b)
			tryRemoving(_staticList,b)
		}
		
		private function tryAdding(a:Array,b:Base):void
		{
			if(a.indexOf(b) == -1){
				a.push(b)
			}
		}
		
		private function tryRemoving(a:Array,b:Base):void
		{
			if(a.indexOf(b) != -1){
				a.splice(a.indexOf(b),1)
			}
		}
		
		public function bodies():Array
		{
			return _bodyList
		}
		
		public function animateBodies():Array
		{
			return _animateBodyList
		}
		
		public function inanimateBodies():Array
		{
			return _inanimateBodyList
		}
		
		public function statics():Array
		{
			return _staticList
		}
	}
}