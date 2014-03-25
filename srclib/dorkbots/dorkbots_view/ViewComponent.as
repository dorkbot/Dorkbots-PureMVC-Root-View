/*
The viewComponent serves as a means of composition over inheritance. 
It is difficult to practice inheritance when using swc files. 
So this class encapsulates the view objects enabling the ability to add project wide functionality via inheritance to view objects.
*/
package dorkbots.dorkbots_view
{
	import dorkbots.dorkbots_broadcasters.BroadcasterManager;
	import dorkbots.dorkbots_broadcasters.IBroadcaster;
	import dorkbots.dorkbots_broadcasters.IBroadcasterManager;

	public class ViewComponent implements IViewComponent
	{
		public static const VIEW_OBJECT_CALL_BACK:String = "view object call back";
		public static const VIEW_OBJECT_INITIALIZED:String = "view object initialized";
		
		private var _name:String;
		protected var rootViewObject:RootViewComposite;
		protected var _viewObject:IViewObject;
		protected var _mediatorCallBack:Function;
		protected var broadcasterManager:IBroadcasterManager;

		public function ViewComponent(aRootViewObject:RootViewComposite, aName:String, aViewObject:IViewObject = null )
		{
			broadcasterManager = new BroadcasterManager(this);
			
			rootViewObject = aRootViewObject;
			if (aViewObject) initViewObject(aViewObject)
			_name = aName;
		}
		
		protected final function initViewObject(view:IViewObject):void
		{
			_viewObject = view;
			_viewObject.viewComponentCallback = viewObjectCallback;
			_viewObject.init();
			
			broadcasterManager.broadcastEvent(VIEW_OBJECT_INITIALIZED);
		}
		
		public final function get viewObject():IViewObject
		{
			return _viewObject;
		}
		
		public final function get name():String
		{
			return _name;
		}
		
		public final function set mediatorCallBack(value:Function):void
		{
			_mediatorCallBack = value;
		}
		
		// called by the ViewObject
		// override this to add functionality
		protected function viewObjectCallback(state:String = null, object:Object = null):void
		{
			// calls the Mediator
			if (_mediatorCallBack != null) performMediatorCallBack(state, object);
			if (broadcasterManager != null) broadcasterManager.broadcastEvent(VIEW_OBJECT_CALL_BACK, object);
		}
		
		protected final function performMediatorCallBack(state:String = null, object:Object = null):void
		{
			if (_mediatorCallBack != null) _mediatorCallBack.call(null, state, object);
		}
		
		public function init():void
		{
			
		}
		
		public final function updateView( state:String, notificationObj:Object = null ):Object
		{
			return updateViewAction( state, notificationObj );
		}
		
		// override this to add functionality
		protected function updateViewAction( name:String, notificationObj:Object = null ):Object
		{
			return null;
		}
		
		public final function get broadcaster():IBroadcaster
		{
			return broadcasterManager.broadcaster;
		}
		
		public function dispose(disposeViewObject:Boolean = true):void
		{
			rootViewObject = null;
			if (disposeViewObject) _viewObject.dispose();
			_viewObject = null;
			_mediatorCallBack = null;
			broadcasterManager.dispose();
			broadcasterManager = null;
		}
	}
}