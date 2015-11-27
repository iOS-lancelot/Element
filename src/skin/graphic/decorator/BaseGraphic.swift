import Cocoa
/*
* The BaseGraphic class is an Element DataObject class that holds the lineshape, lineStyle and fillStyle
* // :TODO: possibly get rid of the setters for the fillStyle and Line style and use implicit setFillStyle and setLineStyle?
* NOTE: We dont need a line mask, just subclass the Graphics class so it supports masking of the line aswell (will require some effort)
*/
class BaseGraphic :AbstractGraphicDecoratable,IBaseGraphic{
    lazy var graphics:Graphics = Graphics()
    override var graphic:BaseGraphic {return self}
    var x:CGFloat = 0
    var y:CGFloat = 0
    var fillStyle:IFillStyle?
    var lineStyle:ILineStyle?
    var lineOffsetType:OffsetType
    var path:CGMutablePath = CGPathCreateMutable()
    var linePath:CGMutablePath = CGPathCreateMutable()
    
    init(_ fillStyle:IFillStyle? = nil, _ lineStyle:ILineStyle? = nil, _ lineOffsetType:OffsetType = OffsetType()) {
        self.fillStyle = fillStyle
        self.lineStyle = lineStyle
        self.lineOffsetType = lineOffsetType
    }
    
    /**
     * TODO: color cant be uint since uint cant be NaN, use Double, 
     * TODO:  check if cgfloat can be NaN?
     */
    override func beginFill(){
        if(fillStyle != nil && fillStyle!.color != NSColor.clearColor() ) {/*Updates only if fillStyle is of class FillStyle*/
            //Swift.print("BaseGraphic.beginFill() fillStyle!.color: " + String(fillStyle!.color))
            graphics.fill(fillStyle!.color)//Stylize the fill
        }
    }
    override func stylizeFill(){
        GraphicModifier.stylize(path,graphics)//realize style on the graphic
    }
    /**
     *
     */
    override func applyLineStyle() {
        //Swift.print("BaseGraphic.applyLineStyle() " + String(lineStyle != nil))
        //Swift.print("lineStyle!.color: " + String(lineStyle!.color))
        if(lineStyle != nil) {/*updates only if lineStyle of class LineStyle*/
            graphics.line(lineStyle!.thickness, lineStyle!.color, lineStyle!.lineCap, lineStyle!.lineJoin, lineStyle!.miterLimit)
        }
    }
    override func stylizeLine(){
        //Swift.print("BaseGraphic.stylizeLine()")
        GraphicModifier.stylizeLine(linePath,graphics)//realize style on the graphic
    }
    /**
     * TODO: remove the x and y values from this class, some graphics may not have a natural x and y pos like LineGraphic or PathGraphic
     */
    override func setPosition(position:CGPoint){
        x = position.x
        y = position.y
        //path = CGPathModifier.translate(&path,position.x,position.y)//Transformations
        //linePath = CGPathModifier.translate(&linePath,position.x,position.y)//Transformations
    }
    func setProperties(fillStyle:IFillStyle? = nil, lineStyle:ILineStyle? = nil){// :TODO: remove this and replace with setLineStyle and setFillStyle ?
        self.fillStyle = fillStyle;
        self.lineStyle = lineStyle;
    }
    override func getGraphic()->BaseGraphic{
        return self
    }
}
