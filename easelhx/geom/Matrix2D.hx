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
package easelhx.geom;

@:native("Matrix2D")
extern class Matrix2D {

// static public properties:
	/**
	* An identity matrix, representing a null transformation. Read-only.
	* @static
	**/
	//TODO: haXe issue: can't have property and method with the same name - request JS change
	//public static var identity : Matrix2D;
	
// public properties:
	/** Position 0,0 in an affine transformation Matrix. Maps roughly to scaleX, but is also involved in rotation. **/
	public var a( default, default ) : Float;
	
	/** Position 0,1 in an affine transformation Matrix. Used in rotation (also skewing, but not supported in Easel). **/
	public var b( default, default ) : Float;
	
	/** Position 1,0 in an affine transformation Matrix. Used in rotation (also skewing, but not supported in Easel). **/
	public var c( default, default ) : Float;
	
	/** Position 1,1 in an affine transformation Matrix. Maps roughly to scaleY, but is also involved in rotation. **/
	public var d( default, default ) : Float;
	
	/** Position 2,0 in an affine transformation Matrix. Translation along the x axis. **/
	public var tx( default, default ) : Float;
	
	/** Position 2,1 in an affine transformation Matrix. Translation along the y axis **/
	public var ty( default, default ) : Float;
	
// constructor:
	/**
	* Constructs a new Matrix2D instance.
	* @param a Specifies the a property for the new matrix.
	* @param b Specifies the b property for the new matrix.
	* @param c Specifies the c property for the new matrix.
	* @param d Specifies the d property for the new matrix.
	* @param tx Specifies the tx property for the new matrix.
	* @param ty Specifies the ty property for the new matrix.
	* @class Represents an affine tranformation matrix, and provides tools for constructing and concatenating matrixes.
	**/
	public function new( ?a : Float, ?b : Float, ?c : Float, ?d : Float, ?tx : Float, ?ty : Float ) : Void;
	
// public methods:
	/**
	* Concatenates the specified matrix properties with this matrix. You must provide values for all of the parameters.
	**/
	public function concat( a : Float, b : Float, c : Float, d : Float, tx : Float, ty : Float ) : Void;
	
	/**
	* Concatenates the specified matrix with this matrix.
	**/
	public function concatMatrix( matrix : Matrix2D ) : Void;
	// TODO: this returns concat, but concat is Void ??
	//{
	//	return this.concat(matrix.a, matrix.b, matrix.c, matrix.d, matrix.tx, matrix.ty);
	//}
	
	/**
	* Generates matrix properties from the specified display object transform properties, and concatenates them with this matrix.
	* For example, you can use this to generate a matrix from a display object: var mtx = new Matrix2D(); 
	* mtx.concatTransform(o.x, o.y, o.scaleX, o.scaleY, o.rotation);
	* @param x
	* @param y
	* @param scaleX
	* @param scaleY
	* @param rotation
	* @param regX Optional.
	* @param regY Optional.
	**/
	public function concatTransform( x : Float, y : Float, scaleX : Float, scaleY : Float, rotation : Float, 
		?regX : Float, ?regY : Float ) : Void;
	
	/**
	* Applies a rotation transformation to the matrix.
	**/
	public function rotate( angle : Float ) : Void;
	
	/**
	* Applies a scale transformation to the matrix.
	**/
	public function scale( x : Float, y : Float ) : Void;
	
	/**
	* Translates the matrix on the x and y axes.
	**/
	public function translate( x : Float, y : Float ) : Void;
	
	/**
	* Sets the properties of the matrix to those of an identity matrix (one that applies a null transformation).
	**/
	public function identity() : Void;
	
	/**
	* Inverts the matrix, causing it to perform the opposite transformation.
	**/
	public function invert() : Void;
	
	/**
	* Returns a clone of this Matrix.
	**/
	public function clone() : Matrix2D;

	/**
	* Returns a string representation of this object.
	**/
	public function toString() : String;
	
}
