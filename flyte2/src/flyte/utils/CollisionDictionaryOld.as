﻿package flyte.utils{	import flash.utils.Dictionary;		import flyte.core.Base;	import flyte.core.Body;	    public class CollisionDictionaryOld    {        private var dict:Dictionary        private var target:Base                public function CollisionDictionaryOld(t:Base)        {                target = t                dict = new Dictionary(true)        }                public function setCollisionAt(b:Body,t:String,v:Boolean):Boolean        {        	if(dict[b] == null) dict[b] = emptyVector()        	dict[b][t] = v        	return v        }                        public function getCollisionVectorFor(t:Body):Vector.<Boolean>        {                var r:Vector.<Boolean> = dict[t]                if(r == null) return emptyVector()                return r        }                public function getCollisionAt(b:Body,t:String):Boolean        {        	try        	{				var keys = ['left','right','top','bottom']        		return dict[b][t]        	}catch(e:Error)        	{        		return false        	}        	return false        }                                public static function emptyVector():Vector.<Boolean>        {        	var v:Vector.<Boolean> = new Vector.<Boolean>()			for(var i:uint = 0;i<5;i++)			{				v[i] = false			}        	return v        }                public function getAll(type:uint):Array        {        	var arr:Array = []        	for(var b:Object in dict)        	{        		if(b[type] == true)        		{        			arr.push(Body(b))        		}        	}			return arr        }                public static function compareCollisionVectors(a:Vector.<Boolean>,b:Vector.<Boolean>):Boolean        {        	for(var i:uint = 0 ;i<a.length;i++)        	{        		if(a[i] != b[i]) return false        	}        	return true        }    }}