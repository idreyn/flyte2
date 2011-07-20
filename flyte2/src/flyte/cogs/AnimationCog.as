﻿package flyte.cogs{	import flash.display.MovieClip;	import flash.events.Event;		import flyte.core.Base;	import flyte.events.GameEvent;	import flash.display.DisplayObject;	public class AnimationCog extends BaseCog	{		public var looping:Boolean = false		public var stopWhenDone:Boolean = false		public var nextAction:Function = null		public var actions:Array		public var active:Boolean = false		private var defaultAction:String		private var currentActionMovie:MovieClip		public function AnimationCog(t:Base)		{			actions = []			this._target = t			target.stop()			target.event.onLoopDo(animationLoop)		}				public function setDefault(s:String):void		{			defaultAction = s		}				public function display(s:String,loop:Boolean = false,stopWhenDone:Boolean = false,nextAction:Function = null):void		{			looping = loop			target.gotoAndStop(s)			var d:DisplayObject = target.getChildByName(s)			if(d == null || !(d is MovieClip))			{				//Okay, there's no MovieClip. Let's just sit here until something happens				active = false			}else{				currentActionMovie = d as MovieClip				active = true			}		}				private function animationLoop(e:GameEvent):void		{			if(!active) return //No use catching errors if we don't need to			if(currentActionMovie.currentFrame == currentActionMovie.totalFrames)			{				//We've reached the end of the animation				if(looping)				{					currentActionMovie.gotoAndPlay(1)				}else{					if(stopWhenDone)					{						currentActionMovie.stop()					}else{						if(nextAction == null)						{							display(defaultAction,true,false,null)						}else{							nextAction.apply(target,[])						}					}				}			}		}			}}