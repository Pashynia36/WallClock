//
//  ClockUIView.swift
//  WallClock
//
//  Created by Pavlo Novak on 4/6/18.
//  Copyright © 2018 Pavlo Novak. All rights reserved.
//

import UIKit

class ClockUIView: UIView {
    
    var radius: CGFloat = 0.0
    var fiSeconds: CGFloat = 0.0
    var fiMinutes: CGFloat = 0.0
    var fiHours: CGFloat = 0.0
    
    override func draw(_ rect: CGRect) {
        
        super.draw(rect)
        
        
        let center: CGPoint = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
        let framePath = UIBezierPath(ovalIn: rect)
        framePath.lineWidth = 5
        UIColor.black.set()
        framePath.stroke()
        
        let clockPath = UIBezierPath(ovalIn: CGRect(x: 2, y: 2, width: rect.width - 4, height: rect.width - 4))
        UIColor.init(red: 0.86, green: 0.7, blue: 0.13, alpha: 1.0).set()
        clockPath.fill()
        
        let path = UIBezierPath()
        path.lineWidth = 3.0
        radius = self.bounds.width / 3
        path.move(to: center)
        path.addLine(to: CGPoint(x: center.x + radius*sin(fiSeconds), y: center.y - radius*cos(fiSeconds)))
        
        radius = self.bounds.width / 3.5
        path.move(to: center)
        path.addLine(to: CGPoint(x: center.x + radius*sin(fiMinutes), y: center.y - radius*cos(fiMinutes)))
        
        radius = self.bounds.width / 4.5
        path.move(to: center)
        path.addLine(to: CGPoint(x: center.x + radius*sin(fiHours), y: center.y - radius*cos(fiHours)))
        UIColor.gray.set()
        path.stroke()
        
        path.removeAllPoints()
        // func draws numbers every second
        drawNumbers(rect)
    }
    
    func drawNumbers(_ rect: CGRect) {
        
        let center: CGPoint = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
        let radius = self.bounds.width / 2 - 10
        var positionX: Double = 0.0
        var positionY: Double = 0.0
        for i in 1...12 {
            let number = String(i) as NSString
            // size of string
            let sizeOfString: CGSize = number.size(withAttributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14.0)])
            positionX = Double(center.x + radius*CGFloat(sin(Double(i)*Double.pi/6)))
            positionY = Double(center.y - radius*CGFloat(cos(Double(i)*Double.pi/6)))
            let numberRect = CGRect(x: CGFloat(positionX) - sizeOfString.width / 2, y: CGFloat(positionY) - sizeOfString.height / 2, width: sizeOfString.width, height: 20)
            number.draw(in: numberRect, withAttributes: nil)
        }
    }
}
