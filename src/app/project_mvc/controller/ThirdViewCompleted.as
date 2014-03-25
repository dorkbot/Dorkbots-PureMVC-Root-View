package app.project_mvc.controller
{
	import app.project_mvc.notifications.Notifications;
	
	import org.puremvc.as3.multicore.interfaces.ICommand;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class ThirdViewCompleted extends SimpleCommand implements ICommand
	{
		public function ThirdViewCompleted()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			facade.removeCommand( Notifications.THIRD_VIEW_COMPLETED );
			facade.registerCommand( Notifications.EXAMPLE_CHILD_APP_START, ExampleChildAppStart );
			
			sendNotification( Notifications.THIRD_VIEW_DISPOSE );
			sendNotification( Notifications.EXAMPLE_CHILD_APP_START );
		}
	}
}