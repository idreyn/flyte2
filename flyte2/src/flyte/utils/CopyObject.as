package flyte.utils
{
	import flash.utils.ByteArray;
	
	public class CopyObject
	{
		public static function copy(o:Object):Object
		{
			var ba:ByteArray = new ByteArray()
			ba.writeObject(o)
			ba.position = 0
			var out:Object = ba.readObject()
			return out
		}
	}
}