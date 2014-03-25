package app.example_child_app
{
	import dorkbots.dorkbots_view.IViewComponent;
	import dorkbots.dorkbots_view.IViewObject;
	import dorkbots.dorkbots_view.RootViewComposite;
	import dorkbots.dorkbots_view.ViewComponent;
	
	public class ExampleChildAppViewComponent extends dorkbots.dorkbots_view.ViewComponent implements IViewComponent
	{
		public static const THIS_CLICKED:String = "ExampleChildAppViewComponent clicked";
		
		private var _model:Model;
		
		public function ExampleChildAppViewComponent(aModel:Model, aRootViewObject:RootViewComposite, aName:String, aViewObject:IViewObject=null)
		{
			_model = aModel;
			
			super(aRootViewObject, aName, aViewObject);
		}
		
		override protected function viewObjectCallback(state:String=null, object:Object=null):void
		{
			switch(state)
			{
				case THIS_CLICKED:
					_model.updateState(Model.VIEW_CLICKED);
					break;
			}
		}
		
		override public function dispose(disposeViewObject:Boolean=true):void
		{
			_model = null;
			
			super.dispose(disposeViewObject);
		}
	}
}