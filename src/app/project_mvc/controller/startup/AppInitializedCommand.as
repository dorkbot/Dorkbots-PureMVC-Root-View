package app.project_mvc.controller.startup
{
	import app.project_mvc.notifications.Notifications;
	
	import org.puremvc.as3.multicore.interfaces.ICommand;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class AppInitializedCommand extends SimpleCommand implements ICommand
	{
		override public function execute(notification:INotification):void
		{
			facade.removeCommand( Notifications.LOAD_DATA );
			facade.removeCommand( Notifications.DATA_READY );
			facade.removeCommand( Notifications.INIT_APP );
			facade.removeCommand( Notifications.APP_INITIALIZED );
			
			sendNotification( Notifications.START_APP);
		}
	}
}