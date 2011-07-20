package flyte.utils
{
	import flash.utils.Dictionary;

	public class CollisionDictionary
	{
		public function CollisionDictionary()
		{
			dict = new Dictionary(true)
		}
		
		public function setCollision(obj:Object,type:String,isCollision:Boolean=true):void
		{
			if(dict[obj] == null) dict[obj] = {}
			dict[obj][type] = isCollision
		}
		
		public function isCollision(obj:Object,type:String):Boolean
		{
			if(dict[obj] == null) return false
			var v:Boolean = dict[obj][type]
			if(v == null) return false
			return v
		}
	}
}