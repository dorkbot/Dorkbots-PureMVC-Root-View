package app.project_mvc.controller
{
	import app.project_mvc.notifications.Notifications;
	
	import org.puremvc.as3.multicore.interfaces.ICommand;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class SecondViewClicked extends SimpleCommand implements ICommand
	{
		public function SecondViewClicked()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			facade.removeCommand( Notifications.SECOND_VIEW_CLICKED );
			facade.registerCommand( Notifications.THIRD_VIEW_COMPLETED, ThirdViewCompleted );
			
			sendNotification( Notifications.THIRD_VIEW_DISPLAY );
			sendNotification( Notifications.SECOND_VIEW_DISPOSE );
			sendNotification( Notifications.THIRD_VIEW_START );
		}
	}
}