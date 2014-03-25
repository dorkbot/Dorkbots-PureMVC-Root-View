package app.project_mvc.view
{
	import com.dVyper.utils.Alert;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	import app.example_child_app.ExampleChildApp;
	import app.project_mvc.FacadApp;
	import app.project_mvc.model.proxies.ExampleChildAppProxy;
	import app.project_mvc.model.proxy_vos.ExampleChildAppVO;
	import app.project_mvc.notifications.Notifications;
	import app.project_mvc.view.view_components.FirstViewComponent;
	import app.project_mvc.view.view_components.SecondViewComponent;
	import app.project_mvc.view.view_components.ThirdViewComposite;
	import app.project_mvc.view.view_objects.FirstView;
	import app.project_mvc.view.view_objects.SecondView;
	import app.project_mvc.view.view_objects.ThirdView;
	
	import dorkbots.dorkbots_view.IViewComponent;
	import dorkbots.dorkbots_view.IViewComposite;
	import dorkbots.dorkbots_view.IViewObject;
	import dorkbots.dorkbots_view.RootViewComposite;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	
	public class ApplicationRootView extends RootViewComposite implements IViewComposite
	{
		private var stage_mc:DisplayObjectContainer;
		
		public function ApplicationRootView(aStage:DisplayObjectContainer)
		{
			super();
			
			stage_mc = aStage;
			
			Alert.init(stage_mc.stage);
		}
		
		override public function get stageHeight():Number
		{
			return this.stage_mc.stage.stageHeight;
		}
		
		override public function get stageWidth():Number
		{
			return this.stage_mc.stage.stageWidth;
		}
		
		override protected function updateViewAction( name:String, notificationObj:Object = null ):Object
		{
			notificationObj = INotification(notificationObj);
			var body:Object = notificationObj.getBody();
			
			var viewComponent:IViewComponent;
			
			switch ( name )
			{		
				case Notifications.FIRST_VIEW_DISPLAY:
					viewComponent = new FirstViewComponent( this, ViewNames.FIRST_VIEW, IViewObject( new FirstView() ) );
					addComponentView( viewComponent );
					stage_mc.addChild( DisplayObject( viewComponent.viewObject ) );
					break;
				
				case Notifications.FIRST_VIEW_DISPOSE:
					removeScreenView(ViewNames.FIRST_VIEW);
					break;
				
				case Notifications.SECOND_VIEW_DISPLAY:
					viewComponent = new SecondViewComponent( this, ViewNames.SECOND_VIEW, IViewObject( new SecondView() ) );
					addComponentView( viewComponent );
					stage_mc.addChild( DisplayObject( viewComponent.viewObject ) );
					break;
				
				case Notifications.SECOND_VIEW_DISPOSE:
					removeScreenView(ViewNames.SECOND_VIEW);
					break;
				
				case Notifications.THIRD_VIEW_DISPLAY:
					viewComponent = new ThirdViewComposite( this, ViewNames.THIRD_VIEW, IViewObject( new ThirdView() ) );
					addComponentView( viewComponent );
					stage_mc.addChild( DisplayObject( viewComponent.viewObject ) );
					break;
				
				case Notifications.THIRD_VIEW_DISPOSE:
					removeScreenView(ViewNames.THIRD_VIEW);
					break;
				
				case Notifications.EXAMPLE_CHILD_APP_DISPLAY:
					var facad:FacadApp = FacadApp(FacadApp.getInstance());
					var exampleChildAppProxy:ExampleChildAppProxy = ExampleChildAppProxy(facad.retrieveProxy( ExampleChildAppProxy.NAME ));
					var exampleChildAppVO:ExampleChildAppVO = ExampleChildAppVO(exampleChildAppProxy.getData()) ;
					viewComponent = exampleChildAppVO.exampleChildApp.view
					addComponentView( viewComponent );
					stage_mc.addChild( DisplayObject( viewComponent.viewObject ) );
					break;
				
				case Notifications.EXAMPLE_CHILD_APP_DISPOSE:
					removeScreenView( ExampleChildApp.VIEW_NAME, false );
					break;
			}
			
			return null;
		}
		
		private function removeScreenViews():void
		{
			removeScreenView(ViewNames.FIRST_VIEW);
			removeScreenView(ViewNames.SECOND_VIEW);
			removeScreenView(ViewNames.THIRD_VIEW);
		}
		
		private function removeScreenView(viewName:String, dispose:Boolean = true ):void
		{
			var viewComponent:IViewComponent;
			viewComponent = getComponentView( viewName, false );
			if (viewComponent != null)
			{
				// remove its view object from stage
				stage_mc.removeChild( DisplayObject( viewComponent.viewObject ) );
				// remove current component view, use name string
				removeComponentView( viewComponent, dispose );
			}
		}
	}
}