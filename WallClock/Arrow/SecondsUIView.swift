//
//  SecondsUIView.swift
//  WallClock
//
//  Created by Pavlo Novak on 4/5/18.
//  Copyright © 2018 Pavlo Novak. All rights reserved.
//

import UIKit

class SecondsUIView: UIView {
    
//    override func draw(_ rect: CGRect) {
//        let center: CGPoint = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
//
//        let path = UIBezierPath()
//        path.move(to: center)
//        path.addLine(to: CGPoint(x: center.x + 5, y: center.y - 250))
//        let myColor = UIColor.black
//        myColor.setStroke()
//        path.lineWidth = 1.0
//        path.stroke()
//        path.removeAllPoints()
//    }
    
    func drawMyArrow(color: UIColor) {
        
        let center: CGPoint = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
        
        let path = UIBezierPath()
        path.move(to: center)
        path.addLine(to: CGPoint(x: center.x, y: center.y - 50))
        let myColor = UIColor.black
        color.setStroke()
        path.lineWidth = 1.0
        path.stroke()
        path.removeAllPoints()
    }
    
    public func drawPath(mover: Int) {
        
        let center: CGPoint = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
        let path = UIBezierPath()
        path.removeAllPoints()
        path.move(to: center)
        path.addLine(to: CGPoint(x: center.x + 5, y: center.y - CGFloat(mover)))
        let myColor = UIColor.black
        myColor.setStroke()
        path.lineWidth = 1.0
        path.stroke()
    }
}
