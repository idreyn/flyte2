﻿package flyte.core{	import flash.events.Event;		import flyte.Game;	import flyte.cogs.CameraCog;	import flyte.cogs.EnumCog;	import flyte.core.Base;	import flyte.events.GameEvent;

	public class flWorld extends flyte.core.Base	{		private var enum:EnumCog		private var _ticking:Boolean=false		public var gravity:Number=1		public var camera:CameraCog		public var hero:Hero		public var lowerBoundary:Number		public var _game:flyte.Game		public function get all():EnumCog		{			return enum		}				public function flWorld()		{			camera = new CameraCog(this)			enum = new EnumCog(this)			this.lowerBoundary = this.height + 100			this.addEventListener(Event.ENTER_FRAME,_enterFrame)			this.hero = this.getChildByName("hero") as Hero			event.onLoopDo(update)		}				public function start():void		{			_ticking = true		}				public function pause():void		{			_ticking = false		}				private function _enterFrame(e:Event):void				{			if(_ticking){				dispatchEvent(GameEvent.tick())			}		}				private function update(e:GameEvent):void		{		}					}}