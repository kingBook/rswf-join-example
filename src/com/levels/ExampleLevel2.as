package com.levels {
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	
	public class ExampleLevel2 extends Sprite {
		
		
		public function ExampleLevel2() {
			// constructor code
			addEventListener(Event.ADDED_TO_STAGE, onInit);
		}
		private function onInit(e:Event):void{
			trace("level2 on stage");
		}
	}
	
}
