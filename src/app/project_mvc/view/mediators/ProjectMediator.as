﻿package app.project_mvc.view.mediators{	import dorkbots.dorkbots_pure_mvc.ViewMediator;	import dorkbots.dorkbots_view.IViewComponent;		import org.puremvc.as3.multicore.interfaces.IMediator;	import org.puremvc.as3.multicore.interfaces.INotification;
		public class ProjectMediator extends ViewMediator implements org.puremvc.as3.multicore.interfaces.IMediator	{		public static const NAME:String = "ProjectMediator";				public function ProjectMediator(mediatorName:String = null, viewComponent:IViewComponent = null, aCompleteNotification:String = null)		{			super( mediatorName, viewComponent, aCompleteNotification );		}				override public function listNotificationInterests():Array		{				return [];		}				override public function handleNotification( notification:org.puremvc.as3.multicore.interfaces.INotification ):void		{						}	}}