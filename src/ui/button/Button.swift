import Cocoa

class Button:Element {
    var trackingRectTag:NSTrackingRectTag? = nil
    override init(_ width:CGFloat, _ height:CGFloat, _ parent:IElement? = nil, _ id:String? = nil){
        super.init(width, height, parent, id)
        //acceptsTouchEvents = false//only for swipes,pinch etc
        
        trackingRectTag = addTrackingRect(self.bounds, owner: self, userData: nil, assumeInside: false)//This enables entered and exited events to fire //let focusTrackingAreaOptions:NSTrackingAreaOptions = [NSTrackingActiveInActiveApp,NSTrackingMouseEnteredAndExited,NSTrackingAssumeInside,NSTrackingInVisibleRect,NSTrackingEnabledDuringMouseDrag]//NSTrackingEnabledDuringMouseDrag to mine to make sure the rollover behaves still when dragging in and out of the area.//TODO: you may need to update trackingarea: - (void)updateTrackingAreas
        //
        super.hitTest(<#T##aPoint: NSPoint##NSPoint#>)
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    override func getClassType()->String{
        return String(Button)
    }
    override func hitTest(aPoint:NSPoint)-> NSView?{
        return nil
    }
    override func mouseEntered( event: NSEvent){
        removeTrackingRect(trackingRectTag!)
        
        skinState = SkinStates.over
        Swift.print("mouseEntered: " + "\(super.skinState)")
        //super.mouseEntered(event)
        
        needsDisplay = true;
    }
    
    override func mouseExited(event: NSEvent){
        Swift.print("mouseExited: " + "\(self.skinState)")
        //super.mouseExited(event)
        
    }
    override func mouseDown(theEvent: NSEvent) {
        skinState = SkinStates.down
        Swift.print("mouseDownEvent: " + "\(self.skinState)")
        //super.mouseDown(theEvent)
    }
    override func mouseUp(theEvent: NSEvent) {
        skinState = SkinStates.none
        Swift.print("mouseUpEvent: " + "\(self.skinState)")
        //super.mouseDown(theEvent)
        
    }
}
