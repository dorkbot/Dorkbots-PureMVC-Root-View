package app.project_mvc.controller.startup
{	
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.core.LoaderCore;
	
	import app.project_mvc.model.proxies.DataProxy;
	import app.project_mvc.model.proxy_vos.DataVO;
	import app.project_mvc.notifications.Notifications;
	
	import org.puremvc.as3.multicore.interfaces.ICommand;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class InitAppCommand extends SimpleCommand implements ICommand
	{
		override public function execute(notification:INotification):void
		{
			facade.removeCommand( Notifications.INIT_APP );
			
			facade.registerCommand( Notifications.START_APP, StartAppCommand );
			
			var loader:LoaderCore;
			
			loader = LoaderMax.getLoader("mainQueue");
			loader.dispose(true);
			
			var dataVO:DataVO = DataVO( facade.retrieveProxy( DataProxy.NAME ).getData() );
			
			// Finished with INIT
			sendNotification( Notifications.APP_INITIALIZED );
		}
	}
}