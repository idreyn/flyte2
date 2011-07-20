package flyte.utils
{
	import flash.geom.Point;
	
	import flyte.core.Base;

	public class DebugToken extends flyte.core.Base
	{
		public function DebugToken(...args)
		{
			if(args.length > 0)
			{
				if(args[0] is Point)
				{
					this.x = args[0].x
					this.y = args[0].y
				}else{
					this.x = args[0]
					this.y = args[1]
				}
			}
		}
	}
}