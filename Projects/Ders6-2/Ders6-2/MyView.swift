//
//  MyView.swift
//  Ders6-2
//
//  Created by Suleyman Calik on 29.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

protocol MyViewDelegate {
    func myViewTapped()
}

class MyView: UIView {

    var delegate:MyViewDelegate!
    
    class func loadMyView() -> MyView {
        
        var myView:MyView = NSBundle.mainBundle().loadNibNamed("MyView", owner: self, options: nil).first as MyView
        return myView
    }
    
    @IBAction func buttonTapped() {
        delegate.myViewTapped()
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
