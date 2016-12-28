package {
//This class loads all of the assets.

import starling.core.Starling;
import starling.display.Sprite;
import starling.textures.Texture;
import starling.utils.AssetManager;
import starling.events.Event;

import flash.filesystem.File;

public class Assets extends Sprite {

    public static var assets:AssetManager = new AssetManager ();
    private var appDir:File = File.applicationDirectory;
    private var screenWidthDetermined:int = Starling.current.nativeStage.stageWidth;
    public static var loadImageClass:LoadImages;
    private var skeletonData:Object;
    private var textureData:Object;
    private var texture:Texture;

    public function Assets() {
        this.addEventListener (Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:Event):void {
        if(screenWidthDetermined == 960) {
            trace ("The screen size is: " + screenWidthDetermined);
            this.removeEventListener (Event.ADDED_TO_STAGE, onAddedToStage);

            assets.enqueue (appDir.resolvePath ("assets/"));
            assets.loadQueue (function (ratio1:Number):void {
                if (ratio1 == 1.0) {
                    skeletonData = assets.getObject("skeleton");
                    textureData = assets.getObject("texture");
                    texture = assets.getTexture("texture");

                    loadAssets ();
                }
            });

        }
    }

    private function loadAssets():void
    {
        loadImageClass = new LoadImages();
        addChild(loadImageClass);
        trace(loadImageClass);
    }

}

}

//*********************************

