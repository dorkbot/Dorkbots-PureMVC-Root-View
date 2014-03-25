package dorkbots.dorkbots_view
{
	import flash.display.Sprite;
	import dorkbots.dorkbots_broadcasters.IBroadcaster;
	
	public class ViewDisplayObject extends Sprite implements IViewObject
	{
		public function ViewDisplayObject()
		{
			super();
		}
		
		public function init():void
		{
		}
		
		public function updateView(state:String, object:Object = null):Object
		{
			return null;
		}
		
		public function set viewComponentCallback(value:Function):void
		{
		}
		
		public function disable():void
		{
		}
		
		public function enable():void
		{
		}
		
		public function get broadcaster():IBroadcaster
		{
			return null;
		}
		
		public function dispose():void
		{
		}
	}
}