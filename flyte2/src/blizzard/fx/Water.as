package blizzard.fx
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import flyte.core.Base;
	import flyte.events.GameEvent;
	import flyte.utils.DebugToken;

	public class Water extends flyte.core.Base
	{
		public function Water()
		{
			event.onLoopDo(function(e:GameEvent):void
			{
				if(this.surface.intersects(world.hero.getBoundsBox(this.world)))
				{
					var hDelta:Point = world.hero.displacement.point
					var hVel:Number = Math.max(Math.abs(hDelta.x),Math.abs(hDelta.y))
					if(hVel > 0.5)
					{
						var isect:Rectangle = this.surface.intersection(world.hero.getBoundsBox(this.world))
						var surfacePoint:Point = new Point(isect.x + (isect.width/2), this.y - (this.height / 2) )
						world.addChild(new blizzard.fx.Splash(surfacePoint,hVel/25,Math.abs(world.hero.displacement.point.y) > 10,!world.hero.jumping))
					}
					
				}
			})
		}
		
		public function get surface():Rectangle
		{
			var r:Rectangle = this.getBoundsBox(this.world)
			r.height = 10
			return r
		}
		
	}
}