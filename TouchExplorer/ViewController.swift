//
//  ViewController.swift
//  TouchExplorer
//
//  Created by Xiao Lu on 1/12/16.
//  Copyright © 2016 Xiao Lu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var tapsLabel: UILabel!
    @IBOutlet var touchesLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func updateLabelsFromTouches(touches: Set<UITouch>) {
        let touch = touches.first
        let numTaps = touch?.tapCount
        let tapsMessage = "\(numTaps!) taps detected"
        tapsLabel.text = tapsMessage
        
        let numTouches = touches.count
        let touchMsg = "\(numTouches) touches detected"
        touchesLabel.text = touchMsg
    }
    
    func showMessage(message: String, _ event: UIEvent?) {
        messageLabel.text = message
        updateLabelsFromTouches((event?.allTouches())!)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        showMessage("Touches Began", event)
    }

    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        showMessage("Touches Cancelled", event)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        showMessage("Touch Ended", event)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        showMessage("Drag Detected", event)
    }

}

