package {

//This class creates the dragon bones assets.

import dragonBones.objects.EventData;
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


public class PlayCharacter extends Sprite {


    private var armatureDisplay:StarlingArmatureDisplay = null;
    private var factory:StarlingFactory = new StarlingFactory ();

    private var skeletonData:Object = Assets.assets.getObject("skeleton")
    private var textureData:Object = Assets.assets.getObject("texture");
    private var textureImage:Texture = Assets.assets.getTexture("texture");

    private var  dbData:DragonBonesData;
    private var appDir:File;
    private var assets:AssetManager;

    public function PlayCharacter() {
        this.addEventListener (starling.events.Event.ADDED_TO_STAGE, loadScreen);
    }


    private function loadScreen(e:starling.events.Event):void {
        this.removeEventListener (starling.events.Event.ADDED_TO_STAGE, loadScreen);
        //onAddedToStage();
        drawScreen();
    }

   /* private function onAddedToStage():void {

         this.removeEventListener (Event.ADDED_TO_STAGE, onAddedToStage);

         assets.enqueue (appDir.resolvePath ("assets/"));
         assets.loadQueue (function (ratio1:Number):void {
         if (ratio1 == 1.0) {

         //DragonBones data is here.
         skeletonData = assets.getObject("skeleton");
         textureData = assets.getObject("texture");
         textureImage = assets.getTexture("texture");

         drawScreen();
     }
     });
    }*/


    //Draws the assets onto the screen.
    private function drawScreen():void
    {

        dbData = factory.parseDragonBonesData (skeletonData);
        factory.parseTextureAtlasData (textureData, textureImage);

        if (dbData) {

            armatureDisplay = factory.buildArmatureDisplay (dbData.armatureNames[0]);
            addChild (armatureDisplay);
        }

        armatureDisplay.alignPivot("center","center");
        armatureDisplay.scaleX = 1;
        armatureDisplay.scaleY = 1;
        //armatureDisplay.animation.play ();

        //plays named the animation in a loop
        armatureDisplay.animation.play ("idle", 1);
        //armatureDisplay.addEventListener (Event.COMPLETE, finishedAnimation);
    }
    private function finishedAnimation(e:Event):void
    {


        
    }




}

}