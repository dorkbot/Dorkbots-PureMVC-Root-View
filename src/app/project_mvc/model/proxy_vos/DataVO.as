package app.project_mvc.model.proxy_vos{	import dorkbots.dorkbots_view.RootViewComposite;
	public class DataVO	{		private var _stageHeight:Number;		private var _stageWidth:Number;		private var _rootView:RootViewComposite;		private var _relativePath:String;				public final function DataVO()		{			//trace("[DataVO]");		}		public final function get relativePath():String
		{
			return _relativePath;
		}		public final function set relativePath(value:String):void
		{
			_relativePath = value;
		}		public final function get stageHeight():Number		{			return _stageHeight;		}		public final function set stageHeight(value:Number):void		{			_stageHeight = value;		}				public final function get stageWidth():Number		{			return _stageWidth;		}				public final function set stageWidth(value:Number):void		{			_stageWidth = value;		}				public final function get rootView():RootViewComposite		{			return _rootView;		}		public final function set rootView(value:RootViewComposite):void		{			_rootView = value;		}	}}