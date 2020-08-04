//
//  UIBlackBorderedButton.swift
//  Book Seeker
//
//  Created by Camila Matias on 03/08/20.
//

import UIKit

@IBDesignable
class UIBlackBorderedButton: UIButton {

    // The color of text shown in each state
    @IBInspectable var textColorDeselected:UIColor = UIColor.lightGray
    @IBInspectable var textColorSelected:UIColor = UIColor.black
    // Allows developer to edit what colors are shown in each state
    @IBInspectable var borderColorSelected:UIColor = UIColor.purple
    @IBInspectable var borderColorDeselected:UIColor = UIColor.purple
    
    // Set the selected properties
    func setSelected() {
        self.setTitleColor(textColorSelected, for: .normal)
    }

    // Set the deselcted properties
    func setDeselected() {
      self.setTitleColor(textColorDeselected, for: .normal)
    }
    override init(frame: CGRect) {
          super.init(frame: frame)
          sharedInit()
      }
      
      required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
          sharedInit()
      }
      
      override func prepareForInterfaceBuilder() {
          sharedInit()
      }
    
    @IBInspectable var customBGColor: UIColor = UIColor.init(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1) {
        didSet {
            refreshColor(color: customBGColor)
        }
    }
  
    @IBInspectable var cornerRadius: CGFloat = 15 {
        didSet {
            refreshCorner(value: cornerRadius)
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 2 {
        didSet {
            refreshBorder(_borderWidth: borderWidth)
        }
    }
    
    @IBInspectable var customBorderColor: UIColor = UIColor.init (red: 0, green: 0/255, blue: 0/255, alpha: 1){
           didSet {
               refreshBorderColor(_colorBorder: customBorderColor)
           }
       }
    
    func refreshCorner(value: CGFloat) {
        layer.cornerRadius = value
    }
  
    func refreshColor(color: UIColor) {
        let image = createImage(color: color)
        setBackgroundImage(image, for: UIControl.State.normal)
        clipsToBounds = true
    }
  
    func createImage(color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), true, 0.0)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        return image
    }

    func refreshBorder(_borderWidth: CGFloat) {
        layer.borderWidth = _borderWidth
    }
    
    func refreshBorderColor(_colorBorder: UIColor) {
        layer.borderColor = _colorBorder.cgColor
    }

    func sharedInit() {
        refreshCorner(value: cornerRadius)
        refreshColor(color: customBGColor)
        refreshBorderColor(_colorBorder: customBorderColor)
        refreshBorder(_borderWidth: borderWidth)
        self.tintColor = UIColor.black
        //titleLabel?.font = UIFont(name:"Poppins-SemiBold",size:17)
    }
}
