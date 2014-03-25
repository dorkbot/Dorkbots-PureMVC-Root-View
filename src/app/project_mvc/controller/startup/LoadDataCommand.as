﻿package app.project_mvc.controller.startup{	import dorkbots.dorkbots_view.RootViewComposite;	import com.greensock.events.LoaderEvent;	import com.greensock.loading.LoaderMax;	import com.greensock.loading.XMLLoader;	import com.greensock.loading.data.XMLLoaderVars;		import app.project_mvc.model.proxies.DataProxy;	import app.project_mvc.model.proxy_vos.DataVO;	import app.project_mvc.notifications.Notifications;		import org.puremvc.as3.multicore.interfaces.ICommand;	import org.puremvc.as3.multicore.interfaces.INotification;	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
		public class LoadDataCommand extends SimpleCommand implements ICommand	{		override public function execute(notification:INotification):void		{			var dataVO:DataVO = DataProxy( facade.retrieveProxy( DataProxy.NAME ) ).vo;			dataVO.stageWidth = RootViewComposite( dataVO.rootView ).stageWidth;			dataVO.stageHeight = RootViewComposite( dataVO.rootView ).stageHeight;						loadFiles();		}						private function loadFiles():void		{					var relativePath:String = DataVO( facade.retrieveProxy( DataProxy.NAME ).getData() ).relativePath;						LoaderMax.activate([XMLLoader]);						var queue:LoaderMax = new LoaderMax({name:"mainQueue", onComplete:loadFilesComplete});						queue.append( new XMLLoader(DataVO( facade.retrieveProxy( DataProxy.NAME ).getData() ).relativePath + "assets/xml/config.xml", {name:"configXML", estimatedBytes:1}) );						queue.load();		}				private function loadFilesComplete(event:LoaderEvent):void		{			sendNotification( Notifications.DATA_READY );		}	}}