package app.project_mvc.controller.startup
{
	import app.project_mvc.model.proxies.DataProxy;
	import app.project_mvc.model.proxies.StateProxy;
	import app.project_mvc.model.proxies.SupportProxy;
	import app.project_mvc.notifications.Notifications;
	import app.project_mvc.notifications.notification_objects.StartupNotification;
	import app.project_mvc.view.ApplicationMediator;
	
	import org.puremvc.as3.multicore.interfaces.ICommand;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class StartupCommand extends SimpleCommand implements ICommand
	{
		override public function execute(notification:INotification):void
		{
			//trace("[StartupCommand]");
			var body:StartupNotification = StartupNotification(notification.getBody());
			facade.registerProxy( new StateProxy( body ) );
			facade.registerProxy( new DataProxy( body ) );
			facade.registerProxy( new SupportProxy() );
			
			facade.registerCommand( Notifications.LOAD_DATA, LoadDataCommand );
			facade.registerCommand( Notifications.DATA_READY, DataReadyCommand );
			facade.registerCommand( Notifications.INIT_APP, InitAppCommand );
			facade.registerCommand( Notifications.APP_INITIALIZED, AppInitializedCommand );
			facade.registerCommand( Notifications.START_APP, StartAppCommand );

			facade.registerMediator( new ApplicationMediator( body.rootView ) );
			
			sendNotification( Notifications.LOAD_DATA );
		}
	}
}