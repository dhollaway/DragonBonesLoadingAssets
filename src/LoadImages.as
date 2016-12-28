package {

//This class brings loads assets by pulling the assets from the asset class. It loads only 2 assets, the
// 'background' and the playRobot class (DragonBones assets).

import starling.display.Sprite;
import starling.events.Event;
import starling.display.Image;
import starling.utils.AssetManager;


public class LoadImages extends Sprite {

    private var background:Image;
    private var _playRobot:PlayCharacter;

    public function LoadImages() {
        this.addEventListener (starling.events.Event.ADDED_TO_STAGE, loadScreen);
    }


    private function loadScreen(e:starling.events.Event):void {
        this.removeEventListener (starling.events.Event.ADDED_TO_STAGE, loadScreen);
        drawScreen ();
    }

      //Draws the assets onto the screen.
    private function drawScreen():void
    {
        //I'm able to add assets here.
        background = new Image(Assets.assets.getTexture("background"));
        this.addChild(background);
        trace("LoadImage class is now loaded!");

        //**************************Not able to DragonBones assets *******************************************
        //trace(Assets.assets.getObject("skeleton"));
        /*_playRobot = new PlayCharacter();
        _playRobot.x = 300;
        _playRobot.y = 200;
        addChild(_playRobot);*/


    }


}

}