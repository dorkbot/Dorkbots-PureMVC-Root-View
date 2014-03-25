package dorkbots.dorkbots_view
{
	public interface IViewComposite extends IViewComponent
	{
		function addComponentView( viewComponent:IViewComponent ):void;
		function removeComponentView( viewComponent:IViewComponent, dispose:Boolean = true, strict:Boolean = true ):void
		function getComponentView( name:String, strict:Boolean = true ):IViewComponent;
	}
}