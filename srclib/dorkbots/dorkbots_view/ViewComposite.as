package dorkbots.dorkbots_view
{
	public class ViewComposite extends ViewComponent implements IViewComposite
	{
		private var _views:Vector.<IViewComponent> = new Vector.<IViewComponent>();
		
		public function ViewComposite(aRootViewObject:RootViewComposite, aName:String, aViewObject:IViewObject)
		{
			super(aRootViewObject, aName, aViewObject);
		}
		
		public final function addComponentView( viewComponent:IViewComponent ):void
		{
			// check if name is already in use
			for (var i:int = 0; i < _views.length; i++) 
			{
				if (_views[i].name == viewComponent.name)
				{
					throw new Error("Name conflict!! View component's name is already in use!! name = " + viewComponent.name);
				}
			}
			
			_views.push(viewComponent);
		}
		
		public final function removeComponentView( viewComponent:IViewComponent, dispose:Boolean = true, strict:Boolean = true ):void
		{
			if (viewComponent != null)
			{
				var index:int = _views.indexOf(viewComponent);
				if (index > -1)
				{
					_views.splice(index, 1);
					if(dispose) viewComponent.dispose();
				}
				else
				{
					if (strict) throw new Error("The view component could not be found!! name = " + viewComponent.name);
				}
			}
			else
			{
				if (strict) throw new Error("The view component is NULL!!");
			}
		}
		
		public final function getComponentView( name:String, strict:Boolean = true ):IViewComponent
		{
			for (var i:int = 0; i < _views.length; i++) 
			{
				if (_views[i].name == name)
				{
					return _views[i];
				}
			}
			
			if (strict) throw new Error("The view component could not be found!! name = " + name);
			
			return null;
		}
		
		protected final function removeAllComponentViews():void
		{
			for (var i:int = 0; i < _views.length; i++) 
			{
				_views[i].dispose();
			}
			_views.length = 0;
		}
		
		override public function dispose(disposeViewObject:Boolean = true):void
		{
			removeAllComponentViews();
			
			super.dispose();
		}
	}
}