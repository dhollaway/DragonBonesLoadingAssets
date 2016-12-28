package {

//This class creates the dragon bones assets.

import dragonBones.textures.TextureAtlasData;

import starling.core.Starling;
import starling.display.Sprite;
import flash.filesystem.File;

import starling.display.Image;
import starling.events.Event;
import starling.text.TextField;
import starling.textures.Texture;
import starling.utils.AssetManager;

import dragonBones.objects.DragonBonesData;
import dragonBones.starling.StarlingFactory;
import dragonBones.starling.StarlingArmatureDisplay;
import dragonBones.events.EventObject;


public class PlayRobot extends Sprite {


    private var armatureDisplay:StarlingArmatureDisplay = null;
    private var factory:StarlingFactory = new StarlingFactory ();

    private var skeletonData:Object;
    private var textureData:Object;
    private var texture:Texture;
    private var appDir:File;
    private var assets:AssetManager;

    public function PlayRobot() {
        this.addEventListener (starling.events.Event.ADDED_TO_STAGE, loadScreen);
    }


    private function loadScreen(e:starling.events.Event):void {
        this.removeEventListener (starling.events.Event.ADDED_TO_STAGE, loadScreen);
        //onAddedToStage();
        drawScreen();
    }

    /*private function onAddedToStage():void {

    }*/


    //Draws the assets onto the screen.
    private function drawScreen():void {

        var dbData:DragonBonesData = factory.parseDragonBonesData (skeletonData);
        factory.parseTextureAtlasData (textureData, texture);

        if (dbData) {

            armatureDisplay = factory.buildArmatureDisplay (dbData.armatureNames[0]);
            addChild (armatureDisplay);
        }

        armatureDisplay.alignPivot("center","center");
        armatureDisplay.scaleX = 1;
        armatureDisplay.scaleY = 1;
        //armatureDisplay.animation.play ();

        //plays named the animation in a loop
        //armatureDisplay.animation.play ("dancing",0);
        armatureDisplay.animation.play ("idle", 0);

    }




}

}