package haxegame;

import flash.events.Event;
import flash.Lib;
import flash.display.Stage;

class Main {

	private var stage:Stage;
	private var mainFunction:Void->Void;
	private var loaded:Bool;

	public function new(){
		initialize();
	}
	private function initialize(){

		stage = flash.Lib.current.stage;
		stage.addEventListener(Event.ENTER_FRAME, run);
		initializeToLoadAssets();
	}
	private function run(event){
		mainFunction();
	}
	private function initializeToLoadAssets(){

		initializeChildToLoadAssets();
		mainFunction = loadAssets;
	}
	private function initializeChildToLoadAssets(){
	}
	private function loadAssets(){
		if(loaded)
			initializeMain();
	}
	private function initializeMain(){

		var testView = new TestView();
		trace(testView.rectA.rotation);
		trace(testView.rectB.rotation);
		trace(testView.rectC.rotation);

		//
		//trace result
		//

		//target flash
		//rectA.rotation: 0
		//rectB.rotation: 19.9998779
		//rectC.rotation: 20.0006561

		//target windows
		//rectA.rotation: 0
		//rectB.rotation: 20.00021121
		//rectC.rotation: 13.63933201 <- incorrect

		finish();
	}
	private function finish(){
		stage.removeEventListener(Event.ENTER_FRAME, run);
	}
}
