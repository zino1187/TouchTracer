//
//  ViewController.swift
//  TouchTracer
//
//  Created by zino-mac on 2020/02/25.
//  Copyright © 2020 zino-mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var t_x: UITextField!
    @IBOutlet weak var t_y: UITextField!
    
    @IBOutlet weak var img: UIImageView!
    var x:Double = 0
    var y:Double = 0
    var targetX:CGFloat = 0
    var targetY:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(gameLoop), userInfo: nil, repeats: true)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(trace))
        self.view.addGestureRecognizer(gesture)
    }

    @objc func trace(sender:UITapGestureRecognizer){
        let point =  sender.location(in: self.view)
        targetX = CGFloat(point.x)
        targetY = CGFloat(point.y)
        
        t_x.text = String(Double(targetX))
        t_y.text = String(Double(targetY))
         
        
    }
    
    func move(){
        img.frame.origin.x = img.frame.origin.x + 0.1*(targetX - img.frame.origin.x)
        img.frame.origin.y = img.frame.origin.y + 0.1*(targetY - img.frame.origin.y)
        
    }
    
    @objc func gameLoop(){
        move()
    }
}

