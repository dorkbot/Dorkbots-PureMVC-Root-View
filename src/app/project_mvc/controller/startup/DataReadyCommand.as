package app.project_mvc.controller.startup
{
	import app.project_mvc.model.proxies.StateProxy;
	import app.project_mvc.model.proxy_vos.StateVO;
	import app.project_mvc.notifications.Notifications;
	
	import org.puremvc.as3.multicore.interfaces.ICommand;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class DataReadyCommand extends SimpleCommand implements ICommand
	{
		override public function execute(notification:INotification):void
		{
			var stateVO:StateVO = StateProxy( facade.retrieveProxy( StateProxy.NAME ) ).vo;
			stateVO.dataReady = true;
			
			sendNotification( Notifications.INIT_APP );
		}
	}
}