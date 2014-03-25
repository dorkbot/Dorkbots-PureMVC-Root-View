package app.project_mvc.model.proxy_vos
{
	import app.example_child_app.ExampleChildApp;

	public class ExampleChildAppVO
	{
		private var _exampleChildApp:ExampleChildApp;
		
		public function ExampleChildAppVO(aExampleChildApp:ExampleChildApp)
		{
			_exampleChildApp = aExampleChildApp;
		}

		public final function get exampleChildApp():ExampleChildApp
		{
			return _exampleChildApp;
		}
		
		public final function dispose():void
		{
			_exampleChildApp = null;
		}
	}
}