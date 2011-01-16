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

@:native("Text")
extern class Text extends DisplayObject {

// public properties:
	/** The text to display. **/
	public var text( default, default ) : String;
	
	/** The font style to use. Any valid value for the CSS font attribute is acceptable (ex. "bold 36px Arial"). **/
	public var font( default, default ) : String;
	
	/** The color to draw the text in. Any valid value for the CSS color attribute is acceptable (ex. "#F00"). **/
	public var color( default, default ) : String;
	
	/** The horizontal text alignment. Any of start, end, left, right, and center. For detailed information 
	* view the <a href="http://www.whatwg.org/specs/web-apps/current-work/multipage/the-canvas-element.html#text-0">whatwg spec</a>. **/
	public var textAlign( default, default ) : String;
	
	/** The vertical alignment point on the font. Any of top, hanging, middle, alphabetic, ideographic, or bottom. For detailed information 
	* view the <a href="http://www.whatwg.org/specs/web-apps/current-work/multipage/the-canvas-element.html#text-0">whatwg spec</a>. **/
	public var textBaseline( default, default ) : String;
	
	/** The maximum width to draw the text. If maxWidth is specifiied (not null), the text will be condensed 
	* or shrunk to make it fit in this width. For detailed information view the 
	* <a href="http://www.whatwg.org/specs/web-apps/current-work/multipage/the-canvas-element.html#text-0">whatwg spec</a>. **/
	public var maxWidth( default, default ) : Float;
	
	/** If true, the text will be drawn as a stroke (outline). If false, the text will be drawn as a fill. **/
	public var outline( default, default ) : Bool;
	
// constructor:
	/**
	* Constructs a new Text instance.
	* @param text Optional. The text to display.
	* @param font Optional. The font style to use. Any valid value for the CSS font attribute is acceptable (ex. "36px bold Arial").
	* @param color Optional. The color to draw the text in. Any valid value for the CSS color attribute is acceptable (ex. "#F00").
	* @class Allows you to display a single line of dynamic text (not user editable) in the display list. Note that as an alternative to 
	* Text, you can position HTML text above or below the canvas relative to items in the display list using the localToGlobal() method.
	* @augments DisplayObject
	**/
	public function new( text : String, font : String, ?color : String ) : Void;
	
// public methods:
	override public function draw( ctx : Dynamic, ignoreCache : Bool ) : Bool;
	
	/**
	* Returns the measured, untransformed width of the text.
	**/
	public function getMeasuredWidth() : Float;
	
	override public function clone() : DisplayObject;
		
	override public function toString() : String;
	
}
