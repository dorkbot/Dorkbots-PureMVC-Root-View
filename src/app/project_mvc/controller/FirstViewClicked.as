package app.project_mvc.controller
{
	import app.project_mvc.notifications.Notifications;
	
	import org.puremvc.as3.multicore.interfaces.ICommand;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class FirstViewClicked extends SimpleCommand implements ICommand
	{
		public function FirstViewClicked()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			facade.removeCommand( Notifications.FIRST_VIEW_CLICKED );
			facade.registerCommand( Notifications.SECOND_VIEW_CLICKED, SecondViewClicked );
			
			sendNotification( Notifications.FIRST_VIEW_DISPOSE );
			sendNotification( Notifications.SECOND_VIEW_DISPLAY );
			sendNotification( Notifications.SECOND_VIEW_START );
		}
	}
}