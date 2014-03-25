package app.project_mvc.controller
{
	import app.example_child_app.ExampleChildApp;
	import app.project_mvc.model.proxies.DataProxy;
	import app.project_mvc.model.proxies.ExampleChildAppProxy;
	import app.project_mvc.model.proxy_vos.DataVO;
	import app.project_mvc.notifications.Notifications;
	
	import org.puremvc.as3.multicore.interfaces.ICommand;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class ExampleChildAppStart extends SimpleCommand implements ICommand
	{
		public function ExampleChildAppStart()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			facade.removeCommand( Notifications.EXAMPLE_CHILD_APP_START );
			facade.registerCommand( Notifications.EXAMPLE_CHILD_APP_QUIT, ExampleChildAppQuit );
			
			var dataVO:DataVO = DataVO( facade.retrieveProxy( DataProxy.NAME ).getData() );
			facade.registerProxy( new ExampleChildAppProxy( new ExampleChildApp(dataVO.rootView) ) );
			
			sendNotification( Notifications.EXAMPLE_CHILD_APP_DISPLAY );
		}
	}
}