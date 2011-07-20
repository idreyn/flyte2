package flyte.cogs
{
	import flyte.core.Base;
	
	public class DirectionCog extends BaseCog
	{
		private var direction:int
		private var doResize:Boolean=true
		
		public function DirectionCog(t:Base,dir:String="right")
		{
			var theDir:int
			_target = t
			if(dir != null){
				theDir = (dir=="right")?1:-1
			}
			direction = theDir
		}
		
		public function faceDirection():void
		{
			doResize = true
		}
		
		public function cancelFaceDirection():void
		{
			doResize = false
		}
		
		public function left():void
		{
			direction = -1
			orient()
		}
		
		public function right():void
		{
			direction = 1
			orient()
		}
		
		public function get isLeft():Boolean
		{
			return direction == -1
		}
		
		public function get isRight():Boolean
		{
			return direction == 1
		}
		
		public function flip():void
		{
			direction *= -1
			orient()
		}
		
		public function get string():String
		{
			return direction == 1?"right":"left"
		}
		
		public function get integer():int
		{
			return direction
		}
		
		private function orient():void
		{
			if(doResize && _target != null)
			{
				if((_target.scaleX > 0 && direction == -1) || (_target.scaleX < 0 && direction == 1)){
					_target.scaleX *= -1
				}
			}
		}
				
			
	}
}