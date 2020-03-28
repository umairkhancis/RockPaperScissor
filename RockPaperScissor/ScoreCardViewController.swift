//
//  ScoreCardViewController.swift
//  RockPaperScissor
//
//  Created by UmairAhmed Khan on 28/03/2020.
//  Copyright © 2020 noorifytech. All rights reserved.
//

import UIKit

class ScoreCardViewController: UIViewController {
    
    @IBOutlet private var yourScoreLabel: UILabel!
    @IBOutlet private var oponentScoreLabel: UILabel!
    @IBOutlet private var tieScoreLabel: UILabel!
    
    var yourScore: Int = 0
    var oponentScore: Int = 0
    var tieScore: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        yourScoreLabel.text = "\(yourScore)"
        oponentScoreLabel.text = "\(oponentScore)"
        tieScoreLabel.text = "\(tieScore)"
    }
    
    @IBAction func onPlayMoreClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
