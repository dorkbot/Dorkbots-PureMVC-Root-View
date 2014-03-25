package app.project_mvc.view.view_objects
{
	import flash.events.MouseEvent;
	
	import app.project_mvc.notifications.Notifications;
	import app.project_mvc.view.view_components.FirstViewComponent;
	
	import assets_swc.FirstView_MC;
	
	import dorkbots.dorkbots_broadcasters.IBroadcaster;
	import dorkbots.dorkbots_view.IViewObject;
	
	public class FirstView extends FirstView_MC implements IViewObject
	{
		private var _viewComponentCallback:Function;
		
		public final function FirstView()
		{
			super();
			
			enable();
		}
		
		private function thisClicked(event:MouseEvent):void
		{
			_viewComponentCallback.call(null, FirstViewComponent.THIS_CLICKED);
		}
		
		public final function init():void
		{
		}
		
		public final function updateView(state:String, object:Object=null):Object
		{
			switch(state)
			{
				case Notifications.FIRST_VIEW_START:
					enable();
					
					break;
			}
			
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