package app.project_mvc.notifications.notification_objects{	import dorkbots.dorkbots_view.RootViewComposite;

	public class StartupNotification	{		private var _rootView:RootViewComposite;		private var _relativePath:String;				public function StartupNotification(aRootView:RootViewComposite, aRelativePath:String)		{			_rootView = aRootView;			_relativePath = aRelativePath;			trace("[StartupNotification] _relativePath = " + _relativePath);		}		public final function get relativePath():String
		{
			return _relativePath;
		}		public final function get rootView():RootViewComposite		{			return _rootView;		}	}}