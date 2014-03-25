package dorkbots.dorkbots_util
{
	import flash.display.LoaderInfo;

	public class GetRelativePathFromLoader
	{
		public function GetRelativePathFromLoader()
		{
		
		}
		
		public static function getPath(loaderInfo:LoaderInfo):String
		{
			var obsolutePath:String; 
			var relativePath:String; 
			
			obsolutePath = loaderInfo.url; 
			
			var stringStart:Number = 0; 
			var stringEnd:Number = obsolutePath.lastIndexOf("/")+1; 
			
			relativePath = obsolutePath.slice(stringStart, stringEnd); 
			
			return relativePath; 
		}
	}
}