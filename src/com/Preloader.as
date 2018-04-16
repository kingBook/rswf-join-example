package com {
	
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.system.ApplicationDomain;
	import flash.system.Capabilities;
	import flash.utils.getDefinitionByName;
	import com.Globals;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	
	public class Preloader extends MovieClip {

		//public var logo:MovieClip;
		public var msgLoaded:Sprite;
		public var mainGame:Sprite;
		public var startCounter:int=-1;
		public var $:Globals;
		
		public function Preloader() {
			// constructor code
			trace("preloading...");
			$ = com.Globals.instance;
			addEventListener(Event.ADDED_TO_STAGE, onInit, false, 0, true);
		}
		
		private function onInit(e:Event):void{
			stage.scaleMode = StageScaleMode.NO_SCALE;
   			stage.align     = StageAlign.TOP_LEFT;
			
			this["msgLoaded"].visible = false
			
			if(Capabilities.os.indexOf("iPad1")>=0){
				//stop();
				//do whatever if iPad1 is not supported
			} else {
				addEventListener(Event.ENTER_FRAME,onframe);
			}
		}

		private function onframe(e:Event):void{
			if ( ApplicationDomain.currentDomain.hasDefinition("com.ExampleMain") ) {
				removeEventListener(Event.ENTER_FRAME,onframe);
				stop();
				startCounter=4; //wait startCounter frames before real start
				addEventListener(Event.ENTER_FRAME,onframeStart);
			}
		}
		private function onframeStart(e:Event):void{
			startCounter--;
			if(startCounter <= 0) {
				var GameClass:Class = getDefinitionByName( "com.ExampleMain" ) as Class;
				mainGame = new GameClass() as Sprite;
				mainGame.x = 150;
				mainGame.y = 120;
				
				msgLoaded.visible = true;
				removeEventListener(Event.ENTER_FRAME,onframeStart);
				addEventListener(MouseEvent.MOUSE_DOWN, startGame);
				
			}
		}
		
		private function startGame(e:MouseEvent):void{
			removeEventListener(MouseEvent.MOUSE_DOWN, startGame);
			$.removeDisplayObject(getChildAt(1)); //text
			$.removeDisplayObject(getChildAt(0)); //head
			addChildAt(mainGame,0);
		}
	}
}
