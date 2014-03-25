package app.project_mvc.view.view_components
{
	import dorkbots.dorkbots_view.IViewComponent;
	import dorkbots.dorkbots_view.IViewObject;
	import dorkbots.dorkbots_view.RootViewComposite;
	import dorkbots.dorkbots_view.ViewComponent;
	
	public class FifthViewComponent extends ViewComponent implements IViewComponent
	{
		public static const THIS_CLICKED:String = "FifthViewComponent clicked";
		
		public function FifthViewComponent(aRootViewObject:RootViewComposite, aName:String, aViewObject:IViewObject=null)
		{
			super(aRootViewObject, aName, aViewObject);
		}
		
		override protected function viewObjectCallback(state:String = null, object:Object = null):void
		{
			broadcasterManager.broadcastEvent(THIS_CLICKED, object);
		}
	}
}