package app.project_mvc.view.view_components
{
	import dorkbots.dorkbots_view.IViewComponent;
	import dorkbots.dorkbots_view.IViewObject;
	import dorkbots.dorkbots_view.RootViewComposite;
	import dorkbots.dorkbots_view.ViewComponent;
	
	public class ProjectViewComponent extends ViewComponent implements IViewComponent
	{
		public function ProjectViewComponent(aRootViewObject:RootViewComposite, aName:String, aViewObject:IViewObject = null)
		{
			super(aRootViewObject, aName, aViewObject);
		}
	}
}