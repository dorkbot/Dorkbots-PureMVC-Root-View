package dorkbots.dorkbots_view
{
	import dorkbots.dorkbots_broadcasters.IBroadcaster;

	public interface IViewObject
	{			
		function init():void;
		
		function updateView(state:String, object:Object = null):Object;
		
		function set viewComponentCallback(value:Function):void;
		
		function get width():Number;
		function get height():Number;
		
		function get x():Number;
		function get y():Number;
		function set x(value:Number):void;
		function set y(value:Number):void;
		
		function get visible():Boolean;
		function set visible(value:Boolean):void;
		
		function get broadcaster():IBroadcaster
		
		function disable():void;
		
		function enable():void;
		
		function dispose():void;
	}
}