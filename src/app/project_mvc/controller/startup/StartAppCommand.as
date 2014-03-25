package app.project_mvc.controller.startup
{
	import app.project_mvc.controller.FirstViewClicked;
	import app.project_mvc.notifications.Notifications;
	
	import org.puremvc.as3.multicore.interfaces.ICommand;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class StartAppCommand extends SimpleCommand implements ICommand
	{
		public function StartAppCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			facade.removeCommand( Notifications.START_APP );
			facade.registerCommand( Notifications.FIRST_VIEW_CLICKED, FirstViewClicked);
			
			sendNotification( Notifications.FIRST_VIEW_DISPLAY );
			sendNotification( Notifications.FIRST_VIEW_START );
		}
	}
}