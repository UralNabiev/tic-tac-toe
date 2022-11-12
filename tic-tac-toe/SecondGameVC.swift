//
//  SecondGameVC.swift
//  tic-tac-toe
//
//  Created by O'ral Nabiyev on 04/11/22.
//

import UIKit

class SecondGameVC: UIViewController {
    
    @IBOutlet var arrowsBtn: [UIButton]!
    @IBOutlet weak var restartBtn: UIView!
    @IBOutlet weak var xPlayerBallLbl: UILabel!
    @IBOutlet weak var oPlayerBallLbl: UILabel!
    @IBOutlet weak var xIsPlayerImg: UIImageView!
    @IBOutlet weak var oIsPlayerImg: UIImageView!
    
    var xBall = 0
    var oBall = 0
    var xWin: Bool = false
    var oWin: Bool = false
    var xWinCount = 0
    var oWinCount = 0
    var xCase: [Int] = []
    var oCase: [Int] = []
    let winCaseColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    var winCase: [[Int]] = [[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6],[0,1,2],[3,4,5],[6,7,8]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        xPlayerBallLbl.text = "\(xBall)"
        oPlayerBallLbl.text = "\(oBall)"
        oIsPlayerImg.image = UIImage(named: "player_off_D2")
        xIsPlayerImg.image = UIImage(named: "player_on_D2")

    }
    
    

    @IBAction func homeTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func restartTapped(_ sender: UIButton) {
        
       restartTap()
        
    }
    
    
    @IBAction func arrowsTapped(_ sender: UIButton) {
        
        if xIsPlayerImg.image == UIImage(named: "player_on_D2") {
                if (sender.currentTitle ?? "").isEmpty {
                    sender.isEnabled = false
                }
            sender.setTitle("X", for: .normal)
            xCase.append(sender.tag)
            xIsPlayerImg.image = UIImage(named: "player_off_D2")
            oIsPlayerImg.image = UIImage(named: "player_on_D2")
        } else if oIsPlayerImg.image == UIImage(named: "player_on_D2") {
            if (sender.currentTitle ?? "").isEmpty {
                sender.isEnabled = false
            }
            sender.setTitle("0", for: .normal)
            oCase.append(sender.tag)
            oIsPlayerImg.image = UIImage(named: "player_off_D2")
            xIsPlayerImg.image = UIImage(named: "player_on_D2")
        }
        
        if xCase.count >= 3 || oCase.count >= 3 {
            
            for winC in winCase {
                
                xWinCount = 0
                oWinCount = 0
                
                for win in winC {
                    
                    if xCase.contains(win) {
                        xWin = true
                        xWinCount += 1
                    } else {
                        xWin = false
                    }
                   
                    if oCase.contains(win) {
                        oWin = true
                        oWinCount += 1
                    } else {
                        oWin = false
                    }
                    
                }
                
                if xWin && xWinCount >= 3 {
                    xBall += 1
                    xPlayerBallLbl.text = "\(xBall)"
                    setAnimation(winCase: winC)
                    isEnabled(isEnable: false)
                    break
                } else if oWin && oWinCount >= 3 {
                    oBall += 1
                    oPlayerBallLbl.text = "\(oBall)"
                    setAnimation(winCase: winC)
                    isEnabled(isEnable: false)
                    break
                } else {
                    if xCase.count + oCase.count == 9 {
                        if xWin && xWinCount >= 3 {
                            xBall += 1
                            xPlayerBallLbl.text = "\(xBall)"
                            setAnimation(winCase: winC)
                            isEnabled(isEnable: false)
                        } else if oWin && oWinCount >= 3 {
                            oBall += 1
                            oPlayerBallLbl.text = "\(oBall)"
                            setAnimation(winCase: winC)
                            isEnabled(isEnable: false)
                        } else {
                            isEnabled(isEnable: false)
                        }
                        
                    }
                }
                
            }
            
        }
        
    }
    

}

//MARK: - isEnabled
extension SecondGameVC {
    func isEnabled(isEnable: Bool, title: String? = nil) {
        
        for i in arrowsBtn {
            i.isEnabled = isEnable
            if title != nil {
                i.setTitle(nil, for: .normal)
            }
        }
        
    }
}

//MARK: - setAnimationRotate
extension SecondGameVC {
    func setAnimationRotate() {
        
        let fullRotation = CABasicAnimation(keyPath: "transform.rotation")
//        fullRotation.delegate = self
//        fullRotation.fromValue = NSNumber(floatLiteral: 0)
        fullRotation.toValue = NSNumber(floatLiteral: Double(CGFloat.pi * 2))
        fullRotation.duration = 0.7
//        fullRotation.repeatCount = 1
        restartBtn.layer.add(fullRotation, forKey: "360")
        
    }
}

//MARK: - setAnimation
extension SecondGameVC {
    func setAnimation(winCase: [Int]) {
        
        for btn in arrowsBtn.enumerated() {
            if winCase.contains(btn.offset) {
                
                UIView.animate(withDuration: 0.6, delay: 0) {
                    btn.element.transform = CGAffineTransform(scaleX: 2, y: 2)
                    btn.element.setTitleColor(self.winCaseColor, for: .normal)
                } completion: { _ in
                    UIView.animate(withDuration: 0.4, delay: 0) {
                        btn.element.transform = .identity
                    } completion: { _ in
//                        btn.element.setTitleColor(.white, for: .normal)
                    }
                }
                
            }
        }
        
    }
}

//MARK: - restartTapped
extension SecondGameVC {
    func restartTap() {
        if (xBall + oBall) % 2 == 0 {
            oIsPlayerImg.image = UIImage(named: "player_off_D2")
            xIsPlayerImg.image = UIImage(named: "player_on_D2")
        } else {
            oIsPlayerImg.image = UIImage(named: "player_on_D2")
            xIsPlayerImg.image = UIImage(named: "player_off_D2")
        }
        
        xWin = false
        oWin = false
        xCase = []
        oCase = []
        xWinCount = 0
        oWinCount = 0
        isEnabled(isEnable: true)
        setAnimationRotate()
        for i in arrowsBtn {
            i.setTitleColor(.black, for: .normal)
            i.setTitle("", for: .normal)
            i.isEnabled = true
        }
    }
}

