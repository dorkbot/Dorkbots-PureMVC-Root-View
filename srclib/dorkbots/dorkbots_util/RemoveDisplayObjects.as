﻿package dorkbots.dorkbots_util {	import flash.display.DisplayObject;	import flash.display.DisplayObjectContainer;	//	public class RemoveDisplayObjects 	{		public function RemoveDisplayObjects():void 		{					}		//		public static function removeDisplayObjects(aDisObject:DisplayObjectContainer):void 		{			if (aDisObject != null) 			{				while (aDisObject.numChildren > 0) 				{					aDisObject.removeChildAt(0);				}			}		}		//		public static function removeADisplayObject(aDisplayObject:DisplayObjectContainer, aChild:DisplayObject):void 		{			if (aDisplayObject != null && aChild != null) 			{				var aDisplayObjectNumChildren:uint = aDisplayObject.numChildren;				var i:uint = 0;				for (i; i < aDisplayObjectNumChildren; i++) 				{					if (aDisplayObject.getChildAt(i) == aChild) 					{						aDisplayObject.removeChild(aChild);						break;					}				}			}		}		//		public static function removeChildrenInObject(aObject:*):void 		{			var aObjectLength:uint = aObject.length;			if (aObjectLength > 0)			{				var i:uint = 0;				for (i; i < aObjectLength; i++) 				{					var this_mc:DisplayObject = aObject[i];					if (this_mc.parent != null) 					{						this_mc.parent.removeChild(this_mc);					}				}			}		}	}}