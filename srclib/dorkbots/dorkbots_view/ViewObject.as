package dorkbots.dorkbots_view
{
	import dorkbots.dorkbots_broadcasters.BroadcasterManager;
	import dorkbots.dorkbots_broadcasters.IBroadcaster;
	import dorkbots.dorkbots_broadcasters.IBroadcasterManager;

	public class ViewObject implements IViewObject
	{
		protected var _broadcasterManager:IBroadcasterManager;
		
		public function ViewObject()
		{
			_broadcasterManager = new BroadcasterManager(this);
		}
		
		public function get width():Number
		{
			return 0;
		}
		
		public function get height():Number
		{
			return 0;
		}
		
		public function get x():Number
		{
			return 0;
		}
		
		public function get y():Number
		{
			return 0;
		}
		public function set x(value:Number):void
		{
			
		}
		
		public function set y(value:Number):void
		{
			
		}
		
		public function get visible():Boolean
		{
			return true;
		}
		public function set visible(value:Boolean):void
		{
			
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
		
		public function dispose():void
		{
			_broadcasterManager.dispose();
			_broadcasterManager = null;
			
			disable();
		}
		
		public function get broadcaster():IBroadcaster
		{
			return _broadcasterManager.broadcaster;
		}
	}
}