package dorkbots.dorkbots_view
{
	import flash.errors.IllegalOperationError;

	public class RootViewComposite extends ViewComposite implements IViewComponent, IViewComposite
	{
		public function RootViewComposite()
		{
			super(this, "root view", new ViewObject());
		}
		
		// ABSTRACT METHOD (must be overridden in a subclass)
		public function get stageHeight():Number
		{
			throw new IllegalOperationError("stageHeight is not supported");
		}
		
		// ABSTRACT METHOD (must be overridden in a subclass)
		public function get stageWidth():Number
		{
			throw new IllegalOperationError("stageWidth is not supported");
		}
	}
}