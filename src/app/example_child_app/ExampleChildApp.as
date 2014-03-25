package app.example_child_app
{
	import dorkbots.dorkbots_broadcasters.IBroadcastedEvent;
	import dorkbots.dorkbots_broadcasters.broadcasters_state.IBroadcasterState;
	import dorkbots.dorkbots_view.IViewComponent;
	import dorkbots.dorkbots_view.RootViewComposite;

	public class ExampleChildApp
	{
		public static const VIEW_NAME:String = "example child app view";
		
		private var controller:Controller;
		private var _model:Model;
		private var _view:ExampleChildAppViewComponent;
		
		public function ExampleChildApp(rootView:RootViewComposite)
		{
			_model = new Model();
			_model.addEventListener(Model.VIEW_CLICKED, viewClicked);
			controller = new Controller();
			_view = new ExampleChildAppViewComponent(_model, rootView, VIEW_NAME, new ExampleChildAppView() );
		}
		
		private function viewClicked(event:IBroadcastedEvent):void
		{
			_model.updateState(Model.EXAMPLE_APP_QUIT);
		}
		
		public final function get model():IBroadcasterState
		{
			return _model;
		}

		public final function get view():IViewComponent
		{
			return _view;
		}
		
		public final function dispose():void
		{
			_model.dispose();
			_model = null;
			controller.dispose();
			controller = null;
			_view.dispose();
			_view = null;
		}
	}
}