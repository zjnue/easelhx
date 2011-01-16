/**
* Bitmap by Grant Skinner. Dec 5, 2010
* Visit www.gskinner.com/blog for documentation, updates and more free code.
*
*
* Copyright (c) 2010 Grant Skinner
* 
* Permission is hereby granted, free of charge, to any person
* obtaining a copy of this software and associated documentation
* files (the "Software"), to deal in the Software without
* restriction, including without limitation the rights to use,
* copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the
* Software is furnished to do so, subject to the following
* conditions:
* 
* The above copyright notice and this permission notice shall be
* included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
* OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
* NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
* HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
* OTHER DEALINGS IN THE SOFTWARE.
**/
package easelhx.display;

import js.CanvasRenderingContext2D;

@:native("DisplayObject")
extern class DisplayObject {
	
// public properties:
	/** The alpha (transparency) for this display object. 0 is fully transparent, 1 is fully opaque. **/
	public var alpha( default, default ) : Float;
	
	/** If a cache is active, this returns the canvas that holds the cached version of this display object. 
	* See cache() for more information. READ-ONLY. **/
	public var cacheCanvas( default, default ) : CanvasRenderingContext2D;
	
	/** Unique ID for this display object. Makes display objects easier for some uses. **/
	public var id( default, default ) : Int;
	
	/** Indicates whether to include this object when running Stage.getObjectsUnderPoint(). Setting this 
	* to true for Sprites will cause the Sprite to be returned (not its children) regardless of whether it's 
	* mouseChildren property is true. **/
	public var mouseEnabled( default, default ) : Bool;
	
	/** An optional name for this display object. Included in toString(). Useful for debugging. **/
	public var name( default, default ) : String;
	
	/** A reference to the Sprite or Stage object that contains this display object, or null if it has not 
	* been added to one. READ-ONLY. **/
	public var parent( default, null ) : DisplayObject;
	
	/** The x offset for this display object's registration point. For example, to make a 100x100px 
	* Bitmap rotate around it's center, you would set regX and regY to 50. **/
	public var regX( default, default ) : Float;
	
	/** The y offset for this display object's registration point. For example, to make a 100x100px 
	* Bitmap rotate around it's center, you would set regX and regY to 50. **/
	public var regY( default, default ) : Float;
	
	/** The rotation in degrees for this display object. **/
	public var rotation( default, default ) : Float;
	
	/** The factor to stretch this display object horizontally. For example, setting scaleX to 2 will 
	* stretch the display object to twice it's nominal width. **/
	public var scaleX( default, default ) : Float;
	
	/** The factor to stretch this display object vertically. For example, setting scaleY to 0.5 will 
	* stretch the display object to half it's nominal height. **/
	public var scaleY( default, default ) : Float;
	
	/** A shadow object that defines the shadow to render on this display object. Set to null to remove 
	* a shadow. Note that nested shadows can result in unexpected behaviour (ex. if both a child and a parent 
	* have a shadow set). **/
	public var shadow( default, default ) : Shadow;
	
	/** Indicates whether this display object should be rendered to the canvas and included when running 
	Stage.getObjectsUnderPoint(). **/
	public var visible( default, default ) : Bool;
	
	/** The x (horizontal) position of the display object, relative to its parent. **/
	public var x( default, default ) : Float;
	
	/** The y (vertical) position of the display object, relative to its parent. **/
	public var y( default, default ) : Float;
		
// constructor:
	/**
	* DisplayObject is an abstract class that should not be constructed directly. Instead construct subclasses 
	* such as Sprite, Bitmap, and Shape.
	* @class DisplayObject is the base class for all display classes in the CanvasDisplay library. It defines the 
	* core properties and methods that are shared between all display objects. It should not be instantiated directly.
	**/
	public function new() : Void;
	
// public methods:
	/**
	* NOTE: This method is mainly for internal use, though it may be useful for advanced developers extending the 
	* capabilities of the CanvasDisplay library.
	* Updates the specified context based on this display object's properties.
	* @param ctx The canvas 2D context object to update.
	* @param ignoreShadows Indicates whether the shadow property should be applied. Passing false will ignore the shadow, 
	* resulting in faster rendering for uses like hit testing.
	**/
	public function updateContext( ctx : Dynamic, ignoreShadows : Bool ) : Bool;
	
	/**
	* NOTE: This method is mainly for internal use, though it may be useful for advanced developers extending the 
	* capabilities of the CanvasDisplay library.
	* Draws the display object into the specified context if it is visible.
	* @param ctx The canvas 2D context object to draw into.
	* @param ignoreCache Indicates whether the draw operation should ignore any current cache. For example, used for drawing 
	* the cache (to prevent it from simply drawing an existing cache back into itself).
	**/
	public function draw( ctx : Dynamic, ignoreCache : Bool ) : Bool;
	
	/**
	* NOTE: This method is mainly for internal use, though it may be useful for advanced developers extending the 
	* capabilities of the CanvasDisplay library.
	* Reverts the last context that was updated with updateContext(), restoring it to the state it was in prior to the update.
	**/
	public function revertContext() : Void;
	
	/**
	* Draws the display object into a new canvas, which is then used for subsequent draws. For complex content that does 
	* not change frequently (ex. a Sprite with many children that do not move, or a complex vector Shape), this can provide 
	* for much faster rendering because the content does not need to be rerendered each tick. The cached display object 
	* can be moved, rotated, faded, etc freely, however if it's content changes, you must manually update the cache by calling 
	* cache() again. Do not call uncache before the subsequent cache call. You must specify the cache area via the x, y, w, 
	* and h parameters. This defines the rectangle that will be rendered and cached using this display object's coordinates. 
	* For example if you defined a Shape that drew a circle at 0,0 with a radius of 25, you could call myShape.cache(-25,-25,50,50) 
	* to cache the full shape.
	* @param x
	* @param y
	* @param width
	* @param height
	**/
	public function cache( x : Float, y : Float, w : Float, h : Float ) : Void;
	
	/**
	* Clears the current cache. See cache() for more information.
	**/
	public function uncache() : Void;
	
	/**
	* Returns the stage that this display object will be rendered on, or null if it has not been added to one.
	**/
	public function getStage() : DisplayObject;
	
	/**
	* Returns a clone of this DisplayObject. Some properties that are specific to this instance's current context are reverted 
	* to their defaults (for example .parent).
	**/
	public function clone() : DisplayObject;
	
	/**
	* Returns a string representation of this object.
	**/
	public function toString() : String;
	
}