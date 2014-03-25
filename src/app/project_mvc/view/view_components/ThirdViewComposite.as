package app.project_mvc.view.view_components
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	import app.project_mvc.notifications.Notifications;
	import app.project_mvc.view.ViewNames;
	import app.project_mvc.view.view_objects.FifthView;
	import app.project_mvc.view.view_objects.FourthView;
	
	import dorkbots.dorkbots_broadcasters.IBroadcastedEvent;
	import dorkbots.dorkbots_view.IViewComponent;
	import dorkbots.dorkbots_view.IViewComposite;
	import dorkbots.dorkbots_view.IViewObject;
	import dorkbots.dorkbots_view.RootViewComposite;
	import dorkbots.dorkbots_view.ViewComposite;
	
	public class ThirdViewComposite extends ViewComposite implements IViewComposite
	{
		public static const COMPLETED:String = "ThirdViewComposite completed";
		
		private var viewObject_mc:DisplayObjectContainer;
		
		public function ThirdViewComposite(aRootViewObject:RootViewComposite, aName:String, aViewObject:IViewObject)
		{
			super(aRootViewObject, aName, aViewObject);
			
			viewObject_mc = DisplayObjectContainer(viewObject);
		}
		
		override protected function updateViewAction(name:String, notificationObj:Object=null):Object
		{
			switch(name)
			{
				case Notifications.THIRD_VIEW_START:
					
					var viewComponent:IViewComponent = new FourthViewComponent( this.rootViewObject, ViewNames.FOURTH_VIEW, IViewObject( new FourthView() ) );
					addComponentView( viewComponent );
					viewObject_mc.addChild( DisplayObject( viewComponent.viewObject ) );
					
					viewComponent.broadcaster.addEventListener(FourthViewComponent.THIS_CLICKED, fourthViewClicked);
					
					_viewObject.updateView(name, notificationObj);
					
					break;
			}
			
			return null;
		}
		
		override public function dispose(disposeViewObject:Boolean=true):void
		{
			viewObject_mc = null;
			super.dispose(disposeViewObject);
		}
		
		private function fourthViewClicked(event:IBroadcastedEvent):void
		{
			var viewComponent:IViewComponent = IViewComponent(event.owner);
			removeScreenView(viewComponent.name);
			
			viewComponent = new FifthViewComponent( this.rootViewObject, ViewNames.FIFTH_VIEW, IViewObject( new FifthView() ) );
			addComponentView( viewComponent );
			viewObject_mc.addChild( DisplayObject( viewComponent.viewObject ) );
			
			viewComponent.broadcaster.addEventListener(FifthViewComponent.THIS_CLICKED,  fifthViewClicked);
		}
		
		private function fifthViewClicked(event:IBroadcastedEvent):void
		{
			var viewComponent:IViewComponent = IViewComponent(event.owner);
			removeScreenView(viewComponent.name);
			
			performMediatorCallBack(COMPLETED);
		}
		
		override protected function viewObjectCallback(state:String=null, object:Object=null):void
		{
			super.viewObjectCallback(state, object)
		}
		
		private function removeScreenView(viewName:String):void
		{
			var viewComponent:IViewComponent;
			viewComponent = getComponentView( viewName, false );
			if (viewComponent != null)
			{
				// remove its view object from stage
				viewObject_mc.removeChild( DisplayObject( viewComponent.viewObject ) );
				// remove current component view, use name string
				removeComponentView( viewComponent );
			}
		}
	}
}