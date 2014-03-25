package app.project_mvc.view.view_objects
{
	import assets_swc.ThirdView_MC;
	
	import dorkbots.dorkbots_broadcasters.IBroadcaster;
	import dorkbots.dorkbots_view.IViewObject;
	
	public class ThirdView extends ThirdView_MC implements IViewObject
	{
		public function ThirdView()
		{
			super();
		}
		
		public function init():void
		{
		}
		
		public function updateView(state:String, object:Object=null):Object
		{
			return null;
		}
		
		public function set viewComponentCallback(value:Function):void
		{
		}
		
		public function get broadcaster():IBroadcaster
		{
			return null;
		}
		
		public function disable():void
		{
		}
		
		public function enable():void
		{
		}
		
		public function dispose():void
		{
		}
	}
}