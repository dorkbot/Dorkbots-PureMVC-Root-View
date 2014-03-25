package app.project_mvc.controller
{
	import app.project_mvc.model.proxies.ExampleChildAppProxy;
	import app.project_mvc.model.proxy_vos.ExampleChildAppVO;
	import app.project_mvc.notifications.Notifications;
	
	import org.puremvc.as3.multicore.interfaces.ICommand;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class ExampleChildAppQuit extends SimpleCommand implements ICommand
	{
		public function ExampleChildAppQuit()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			facade.removeCommand( Notifications.EXAMPLE_CHILD_APP_QUIT );
			facade.registerCommand( Notifications.FIRST_VIEW_CLICKED, FirstViewClicked );
			
			sendNotification( Notifications.FIRST_VIEW_DISPLAY );
			sendNotification( Notifications.EXAMPLE_CHILD_APP_DISPOSE );
			sendNotification( Notifications.FIRST_VIEW_START );
			
			var exampleChildAppProxy:ExampleChildAppProxy = ExampleChildAppProxy( facade.retrieveProxy( ExampleChildAppProxy.NAME ) );
			var exampleChildAppVO:ExampleChildAppVO = ExampleChildAppVO( exampleChildAppProxy.getData() );
			exampleChildAppVO.exampleChildApp.dispose();
			facade.removeProxy( ExampleChildAppProxy.NAME );
		}
	}
}