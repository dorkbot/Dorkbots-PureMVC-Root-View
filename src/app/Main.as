package app
{
	import com.dVyper.utils.Alert;
	import dorkbots.dorkbots_util.GetRelativePathFromLoader;
	
	import flash.display.Sprite;
	
	import app.project_mvc.FacadApp;
	
	[ SWF( width='550', height='400', frameRate='60', backgroundColor='#8eb53e' ) ]
	public class Main extends Sprite
	{
		public function Main()
		{
			Alert.init(this.stage);
			Alert.show("[tambola] == " + GetRelativePathFromLoader.getPath(loaderInfo));
			var facade:FacadApp = FacadApp.getInstance();
			facade.startup(this, GetRelativePathFromLoader.getPath(loaderInfo));
		}
	}
}