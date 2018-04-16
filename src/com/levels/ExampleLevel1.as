package com.levels {
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	
	public class ExampleLevel1 extends Sprite {
		
		
		public function ExampleLevel1() {
			// constructor code
			addEventListener(Event.ADDED_TO_STAGE, onInit);
		}
		private function onInit(e:Event):void{
			trace("level1 on stage");
		}
	}
	
}
