import Foundation

class SelectGroupEvent:Event {
    static var change:String = "selectGroupChange";/*this event is dispatched after the _selected variable is set in the SelectGroup instance*/// :TODO: possibly rename to SELECT_GROUP_SELECTED
    static var select : String = "selectGroupSelect";/*This event is dispatched before the _selected variable is set in the SelectGroup instance*/
    //static var deSelect : String = "selectGroupDeSelect";
    var selected : ISelectable?//TODO: rename to selected
    init(_ type: String, _ origin: AnyObject,_ selected:ISelectable? = nil) {
        self.selected = selected
        super.init(type,origin)
    }
}
