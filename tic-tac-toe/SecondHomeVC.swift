//
//  SecondHomeVC.swift
//  tic-tac-toe
//
//  Created by O'ral Nabiyev on 04/11/22.
//

import UIKit

class SecondHomeVC: UIViewController {
        
    @IBOutlet weak var otherDesignRotationBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    func setAnimation() {
        
        let fullRotation = CABasicAnimation(keyPath: "transform.rotation")
        //        fullRotation.delegate = self
        //        fullRotation.fromValue = NSNumber(floatLiteral: 0)
        fullRotation.toValue = NSNumber(floatLiteral: Double(CGFloat.pi * 2))
        fullRotation.duration = 0.7
        //        fullRotation.repeatCount = 1
        otherDesignRotationBtn.layer.add(fullRotation, forKey: "360")
        
    }
    
    @IBAction func playTapped(_ sender: Any) {
        let vc = SecondGameVC(nibName: "SecondGameVC", bundle: nil)
        
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @IBAction func otherDesignTapped(_ sender: UIButton) {
        setAnimation()
        let vc = HomeVC(nibName: "HomeVC", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
    
    
}

