package flyte
{
	import flash.display.MovieClip;
	
	import flyte.core.flWorld;
	import flyte.io.GameState;
	
	public class Game extends MovieClip
	{
		private var _world:flWorld
		public var state:GameState
		
		public function get world():flWorld
		{
			return _world
		}
		
		public function Game()
		{
		}
		
		public function load(w:flWorld):void
		{
			if(_world != null){
				_world.pause()
				removeChild(_world)
			}
			_world = w
			_world._game = this
			addChild(_world)
			_world.start()	
		}
	}
}