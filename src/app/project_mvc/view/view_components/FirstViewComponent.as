package app.project_mvc.view.view_components
{
	import dorkbots.dorkbots_view.IViewComponent;
	import dorkbots.dorkbots_view.IViewObject;
	import dorkbots.dorkbots_view.RootViewComposite;
	
	import app.project_mvc.notifications.Notifications;
	
	public class FirstViewComponent extends ProjectViewComponent implements IViewComponent
	{
		public static const THIS_CLICKED:String = "FirstView clicked";
		
		public function FirstViewComponent(aRootViewObject:RootViewComposite, aName:String, aViewObject:IViewObject=null)
		{
			super(aRootViewObject, aName, aViewObject);
		}
		
		override protected function updateViewAction(name:String, notificationObj:Object=null):Object
		{
			switch(name)
			{
				case Notifications.FIRST_VIEW_START:
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