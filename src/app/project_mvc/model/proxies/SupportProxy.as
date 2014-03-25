package app.project_mvc.model.proxies
{
	import app.project_mvc.model.proxy_vos.SupportVO;
	
	import org.puremvc.as3.multicore.interfaces.IProxy;
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;
	
	public class SupportProxy extends Proxy implements IProxy
	{
		public static const NAME:String = "SupportProxy";
		
		public function SupportProxy()
		{
			super( NAME, new SupportVO() );
		}		
		
		public final function get vo():SupportVO
		{
			return data as SupportVO;
		}
	}
}