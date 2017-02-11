import Foundation
@testable import Utils
/**
 * :TODO: maybe rename text to defaultText and _text to _text
 * :TODO: Add support for setting size via css for the TextArea. Its currently not working
 */
class TextArea:Element {
    var text:Text?
    var textString:String// :TODO: rename to initTextString
    init(_ width:CGFloat,_ height:CGFloat, _ text:String = "defaultText", _ parent:IElement? = nil, _ id:String? = nil) {
        self.textString = text
        super.init(width, height, parent, id)
    }
    override func resolveSkin() {
        super.resolveSkin()
        text = addSubView(Text(width,height,self.textString,self))
    }
    override func setSize(_ width:CGFloat, _ height:CGFloat) {
        super.setSize(width, height)
        text!.setSize(width, height)
    }
    func setTextValue(_ text:String) {
        self.text!.setText(text)
    }
    /**
     *
     */
    func setText(){
        
    }
    required init(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
