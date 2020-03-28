//
//  ResultViewController.swift
//  RockPaperScissor
//
//  Created by UmairAhmed Khan on 27/03/2020.
//  Copyright © 2020 noorifytech. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet private var resultIV: UIImageView!
    @IBOutlet private var resultLabel: UILabel!
    
    var resultText: String = ""
    var resultImage: UIImage = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.resultLabel.text = resultText
        self.resultIV.image = resultImage
    }
    
    @IBAction func onPlayAgainClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
