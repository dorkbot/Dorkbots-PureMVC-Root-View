package dorkbots.dorkbots_pure_mvc
{
	import dorkbots.dorkbots_view.IViewComponent;
	
	import org.puremvc.as3.multicore.interfaces.IMediator;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	
	// THE MEDIATOR IS DELEGATED TO PureMVC notifications
	public class ViewMediator extends Mediator implements IMediator
	{
		protected var completeNotification:String;
		protected var viewComponentConcrete:IViewComponent;
		
		public function ViewMediator( mediatorName:String = null, viewComponent:IViewComponent = null, aCompleteNotification:String = null)
		{
			viewComponentConcrete = viewComponent;
			
			super( mediatorName, viewComponent );
			
			completeNotification = aCompleteNotification;
			
			if (viewComponent != null)
			{
				viewComponent.mediatorCallBack = viewComponentCallBack;
			}
		}
		
		// OVERRIDE TO ADD FUNCTIONALITY
		protected function viewComponentCallBack( state:String = null, object:Object = null ):void
		{
			if (completeNotification != null) sendNotification( completeNotification, object );
		}
		
		override public function onRemove():void
		{
			viewComponent = null;
			
			super.onRemove();
		}
	}
}