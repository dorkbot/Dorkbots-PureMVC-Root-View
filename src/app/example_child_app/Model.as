package app.example_child_app
{
	import dorkbots.dorkbots_broadcasters.broadcasters_state.BroadcasterState;
	import dorkbots.dorkbots_broadcasters.broadcasters_state.IBroadcasterState;
	
	public class Model extends BroadcasterState implements IBroadcasterState
	{
		public static const VIEW_CLICKED:String = "view clicked";
		public static const EXAMPLE_APP_QUIT:String = "example app quit";
		
		public function Model()
		{
			super();
		}
		
		override protected function setUpStates():void
		{
			addState(VIEW_CLICKED);
			addState(EXAMPLE_APP_QUIT);
		}
	}
}