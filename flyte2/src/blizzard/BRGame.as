package blizzard
{
	import flyte.Game;
	import flyte.sound.SoundManager;
	
	public class BRGame extends flyte.Game
	{
		
		public function BRGame()
		{
			state = new BRGameState(this)
			SoundManager.registerSound([Splash1,Splash2,CoinClink])
		}
	}
}