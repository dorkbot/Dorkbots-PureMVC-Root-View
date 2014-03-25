package dorkbots.dorkbots_view
{
	import dorkbots.dorkbots_broadcasters.IBroadcaster;

	public interface IViewComponent
	{	
		function init():void;
		
		function get viewObject():IViewObject;
		
		function set mediatorCallBack(value:Function):void
		
		function updateView( state:String, notificationObj:Object = null ):Object
		
		function get name():String;
		
		function get broadcaster():IBroadcaster
			
		function dispose(disposeViewObject:Boolean = true):void;
	}
}