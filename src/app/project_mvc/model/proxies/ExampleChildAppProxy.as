package app.project_mvc.model.proxies
{
	import app.example_child_app.ExampleChildApp;
	import app.example_child_app.Model;
	import app.project_mvc.model.proxy_vos.ExampleChildAppVO;
	import app.project_mvc.notifications.Notifications;
	
	import dorkbots.dorkbots_broadcasters.IBroadcastedEvent;
	
	import org.puremvc.as3.multicore.interfaces.IProxy;
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;
	
	public class ExampleChildAppProxy extends Proxy implements IProxy
	{
		public static const NAME:String = "ExampleChildAppProxy";
		
		public function ExampleChildAppProxy(exampleChildApp:ExampleChildApp)
		{
			super(NAME, new ExampleChildAppVO(exampleChildApp));
		}
		
		override public function onRegister():void
		{
			vo.exampleChildApp.model.addEventListener(Model.EXAMPLE_APP_QUIT, exampleAppQuit);
		}
		
		override public function onRemove():void
		{
			vo.dispose();
		}
		
		private function exampleAppQuit(event:IBroadcastedEvent):void
		{
			sendNotification( Notifications.EXAMPLE_CHILD_APP_QUIT );
		}
		
		public final function get vo():ExampleChildAppVO
		{
			return data as ExampleChildAppVO;
		}
	}
}