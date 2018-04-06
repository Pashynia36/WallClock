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
        let path = UIBezierPath()
        
        radius = self.bounds.width / 3
        path.move(to: center)
        path.addLine(to: CGPoint(x: center.x + radius*sin(fiSeconds), y: center.y - radius*cos(fiSeconds)))
        
        radius = self.bounds.width / 3.5
        path.move(to: center)
        path.lineWidth = 3.0
        path.addLine(to: CGPoint(x: center.x + radius*sin(fiMinutes), y: center.y - radius*cos(fiMinutes)))
        
        radius = self.bounds.width / 4.5
        path.move(to: center)
        path.addLine(to: CGPoint(x: center.x + radius*sin(fiHours), y: center.y - radius*cos(fiHours)))
        UIColor.gray.set()
        path.stroke()

        path.removeAllPoints()
    }
}
