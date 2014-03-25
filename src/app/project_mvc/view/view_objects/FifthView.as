package app.project_mvc.view.view_objects
{
	import flash.events.MouseEvent;
	
	import app.project_mvc.view.view_components.FifthViewComponent;
	
	import assets_swc.FifthView_MC;
	
	import dorkbots.dorkbots_broadcasters.IBroadcaster;
	import dorkbots.dorkbots_view.IViewObject;
	
	public class FifthView extends FifthView_MC implements IViewObject
	{
		private var _viewComponentCallback:Function;
		
		public function FifthView()
		{
			super();
			
			enable();
		}
		
		private function thisClicked(event:MouseEvent):void
		{
			_viewComponentCallback.call(null, FifthViewComponent.THIS_CLICKED);
		}
		
		public final function init():void
		{
		}
		
		public final function updateView(state:String, object:Object=null):Object
		{	
			return null;
		}
		
		public final function set viewComponentCallback(value:Function):void
		{
			_viewComponentCallback = value;
		}
		
		public final function get broadcaster():IBroadcaster
		{
			return null;
		}
		
		public final function disable():void
		{
			this.removeEventListener(MouseEvent.CLICK, thisClicked);
		}
		
		public final function enable():void
		{
			this.addEventListener(MouseEvent.CLICK, thisClicked);
		}
		
		public final function dispose():void
		{
			disable();
			_viewComponentCallback = null;
		}
	}
}