package flyte.io
{
	import flash.net.SharedObject;
	
	import flyte.Game;

	public class GameState
	{
		public var local:SharedObject
		public var game:flyte.Game
		
		public function GameState(g:flyte.Game,name:String)
		{
			game = g
			local = SharedObject.getLocal(name)
		}
		
		public function save():void
		{
			local.flush()	
		}
	}
}