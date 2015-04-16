package  {
	
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;



	public class Talk extends Event{
		
		
		/**
		 * HOW TO USE IT
		 * 
		 * 		// It's a very handy class to add some global listeners. Use it like this:
		 * 
		 * 		var myFunction : Function = function(e:Talk)
		 * 		{
		 * 			trace(e.data)
		 * 		}
		 * 
		 * 		Talk.listen("test", myFunction) // listener added
		 * 		
		 * 		Talk.say("test", 3) // myFunction traces 3.
		 * 
		 * 		Talk.cancel("test", myFunction) // listener removed
		 */
		
		
		private static var dispatcher : EventDispatcher = new EventDispatcher
		
		/**
		 * Add a weak listener to global Talk class
		 * @param	event Event Type
		 * @param	callback Any function expecting a single parameter e:Talk (an Event extended class).
		 * @param	priority
		 * @param	weak
		 */
		public static function listen(event:String, callback:Function, priority:int=0, weak:Boolean = true):void {
			dispatcher.addEventListener( event, callback, false, priority, weak)
		}
		
		/**
		 * remove listener from global Talk class
		 * @param	event
		 * @param	callback
		 */
		public static function cancel(event:String, callback:Function):void
		{
			dispatcher.removeEventListener( event, callback)
		}
		
		/**
		 * Dispatches an Event and allows you to pass any object as data.
		 * @param	event The name of the event
		 * @param	data The event's data object, May be a String, a Number, any object at all.
		 */
		public static function say(event:String, data:Object=null):void
		{
			//trace(event, data)
			dispatcher.dispatchEvent( new Talk(event, data))
		}
		
		/** Any information passed by say() */
		public var data : Object

		
		
		public function Talk(event: String, data : Object=null)
		{
			super( event )
			this.data = data
			
			
		}
		
		override public function toString():String
		{
			return "[Talk "+type+" "+JSON.stringify(data).split('"').join("")+"]"
		}

		
		
	
	}
	
}
