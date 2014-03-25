package app.project_mvc.view.mediators
{
	import app.project_mvc.notifications.Notifications;
	import app.project_mvc.view.view_components.FirstViewComponent;
	
	import dorkbots.dorkbots_view.IViewComponent;
	
	import org.puremvc.as3.multicore.interfaces.IMediator;
	import org.puremvc.as3.multicore.interfaces.INotification;
	
	public class FirstMediator extends ProjectMediator implements IMediator
	{
		public function FirstMediator(mediatorName:String=null, viewComponent:IViewComponent=null, aCompleteNotification:String=null)
		{
			super(mediatorName, viewComponent, aCompleteNotification);
		}
		
		override public function onRegister():void
		{
			
		}
		
		override public function listNotificationInterests():Array
		{	
			var array:Array = super.listNotificationInterests();
			
			array.push( Notifications.FIRST_VIEW_START );
			
			return array;
		}
		
		override public function handleNotification( notification:INotification ):void
		{	
			var name:String = notification.getName();
			var body:Object = notification.getBody();
			
			switch(name)
			{
				case Notifications.FIRST_VIEW_START:
					viewComponentConcrete.updateView( name );
					break;
			}
			
			super.handleNotification( notification );
		}
		
		override protected function viewComponentCallBack(state:String=null, object:Object=null):void
		{
			switch(state)
			{
				case FirstViewComponent.THIS_CLICKED:
					sendNotification(Notifications.FIRST_VIEW_CLICKED);
					break;
			}
		}
	}
}