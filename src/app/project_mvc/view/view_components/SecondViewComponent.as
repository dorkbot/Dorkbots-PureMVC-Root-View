package app.project_mvc.view.view_components
{
	import app.project_mvc.notifications.Notifications;
	
	import dorkbots.dorkbots_view.IViewComponent;
	import dorkbots.dorkbots_view.IViewObject;
	import dorkbots.dorkbots_view.RootViewComposite;
	
	public class SecondViewComponent extends ProjectViewComponent implements IViewComponent
	{
		public static const THIS_CLICKED:String = "SecondView clicked";
		
		public function SecondViewComponent(aRootViewObject:RootViewComposite, aName:String, aViewObject:IViewObject=null)
		{
			super(aRootViewObject, aName, aViewObject);
		}
		
		override protected function updateViewAction(name:String, notificationObj:Object=null):Object
		{
			switch(name)
			{
				case Notifications.SECOND_VIEW_START:
					_viewObject.updateView(name, notificationObj);
					break;
			}
			
			return null;
		}
		
		override protected function viewObjectCallback(state:String=null, object:Object=null):void
		{
			super.viewObjectCallback(state, object)
		}
	}
}