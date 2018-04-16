package com {
	import com.Globals;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.getDefinitionByName;
	import flash.utils.setTimeout;
	import flash.system.ApplicationDomain;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Loader;
	import flash.system.System;
	import flash.display.MovieClip;
	import flash.media.SoundTransform;
	import flash.utils.getTimer;
	
	public class ExampleMain extends Sprite {
		
		public var currentLevel:Sprite;
		private var lastGCcall:int;
		private static var muteTransform:SoundTransform = new SoundTransform(0.0);
		
		public function ExampleMain() {
			// constructor code
			addEventListener(Event.ADDED_TO_STAGE, onInit);
			trace("Main constructed");
		}
		private function onInit(e:Event):void{
			trace("Main on stage");
			stage.addEventListener(MouseEvent.MOUSE_DOWN, changeLevel);
			//setTimeout(changeLevel,10);
		}
		public function changeLevel(e:MouseEvent=null):void {
			trace("changeLevel");
			var newLevelClass:Class;
			
			com.Globals.instance.removeDisplayObject(currentLevel);
			
			if(!currentLevel || currentLevel.name == "ExampleLevel2") {
				if(ApplicationDomain.currentDomain.hasDefinition("ExampleLevel1")){
					currentLevel = new ExampleLevel1() as Sprite;
					currentLevel.name = "ExampleLevel1";
				}
			} else {
				if(ApplicationDomain.currentDomain.hasDefinition("ExampleLevel2")){
					currentLevel = new ExampleLevel2() as Sprite;
					currentLevel.name = "ExampleLevel2";
				}
			}
			addChild(currentLevel);
		}
	
	}
	
}
