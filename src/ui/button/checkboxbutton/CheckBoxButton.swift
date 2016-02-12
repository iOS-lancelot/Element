import Foundation

class CheckBoxButton : Button,ICheckable{
    /*/**
    * @Note this method represents something that should be handled by a method named getChecked, but since this class impliments Icheckable it has to implment checked and checkable
    */
    public function get checked():Boolean {
    return
    }*/
    var isChecked:Bool{get {return checkBox != nil ? checkBox!.isChecked : self.isChecked;/*Temp fix*/} set {self.isChecked = newValue}}
    var checkBox : CheckBox?
    var text:Text?
    var textString:String
    //var isChecked:Bool
    init( width:CGFloat, _ height:CGFloat, _ isFocused:Bool = false, _ isDisabled:Bool = false, _ text:String = "defaultText", _ isChecked:Bool = false, parent:IElement? = nil, id:String? = nil) {
        self.textString = text
        self.isChecked = isChecked
        super.init(width,height,parent,id)
    }
    override func resolveSkin() {
        super.resolveSkin();
        checkBox = addSubView(CheckBox(height,height,isChecked,self)) as? CheckBox
        text = addSubView(Text(width,height,textString,self)) as? Text
        text!.isInteractive = false
    }
    func setChecked(isChecked:Bool) {
        checkBox!.setChecked(isChecked);
    }
    override func getSkinState() -> String {
        return isChecked ? SkinStates.checked + " " + super.getSkinState() : super.getSkinState();
    }
    func setSize(width : CGFloat, height : CGFloat) {
        super.setSize(width, height);
        checkBox!.setSkinState(checkBox!.skin!.state);
        text!.setSkinState(checkBox!.skin!.state);
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
