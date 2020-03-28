//
//  MainViewController.swift
//  RockPaperScissor
//
//  Created by UmairAhmed Khan on 27/03/2020.
//  Copyright © 2020 noorifytech. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet private var rockIV: UIButton!
    @IBOutlet private var paperIV: UIButton!
    @IBOutlet private var sicssorIV: UIButton!
    
    private var userChoice: Choice!
    
    private var yourScore: Int = 0
    private var oponentScore: Int = 0
    private var tieScore: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onRockClicked(_ sender: Any) {
        self.userChoice = .Rock
        performSegue(withIdentifier: "result", sender: self)
    }
    
    @IBAction func onPaperClicked(_ sender: Any) {
        self.userChoice = .Paper
        performSegue(withIdentifier: "result", sender: self)
    }
    
    @IBAction func onScissorClicked(_ sender: Any) {
        self.userChoice = .Scissor
        performSegue(withIdentifier: "result", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "result") {
            let controller = segue.destination as! ResultViewController
            let oponentChoice = getOponentChoice()
            let result = game(userChoice: userChoice, oponentChoice: oponentChoice)
            
            controller.resultText = getResultText(result: result, userChoice: userChoice, oponentChoice: oponentChoice)
            controller.resultImage = getResultImage(userChoice: userChoice, oponentChoice: oponentChoice)
        }
        else if(segue.identifier == "scorecard") {
            let controller = segue.destination as! ScoreCardViewController
            
            controller.yourScore = self.yourScore
            controller.oponentScore = self.oponentScore
            controller.tieScore = self.tieScore
        }
    }
    
    private func getOponentChoice() -> Choice {
        let availableChoices = [Choice.Rock, Choice.Paper, Choice.Scissor]
        let randomValue = arc4random() % 3
        print("randomValue: \(randomValue)" )
        
        return availableChoices[Int(randomValue)]
    }
    

    /**
     * Business Logic:
     * This function return result w.r.t user
     * retruns true if user wins else false for losse
     */
    private func game(userChoice: Choice, oponentChoice: Choice) -> Result {
        switch (userChoice, oponentChoice) {
        case let (user, oponent) where user == oponent:
            tieScore += 1
            return .Tie
        case (.Rock, .Scissor), (.Paper, .Rock), (.Scissor, .Paper):
            yourScore += 1
            return .Win
        default:
            oponentScore += 1
            return .Loose
        }
    }
    
    private func getResultText(result: Result, userChoice: Choice, oponentChoice: Choice) -> String {
        switch (result, userChoice, oponentChoice) {
            case (.Win, .Rock, .Scissor):
                return "Rock Breaks Scissor, You Win!"
            case (.Win, .Paper, .Rock):
                return "Paper Covers Rock, You Win!"
            case (.Win, .Scissor, .Paper):
                return "Scissor Cuts Paper, You Win!"
            case (.Loose, .Scissor, .Rock):
                return "Rock Breaks Scissor, You Loose!"
            case (.Loose, .Rock, .Paper):
                return "Paper Covers Rock, You Loose!"
            case (.Loose, .Paper, .Scissor):
                return "Scissor Cuts Paper, You Loose!"
            default:
                return "It's a Tie"
        }
    }
    
    private func getResultImage(userChoice: Choice, oponentChoice: Choice) -> UIImage {
        switch (userChoice, oponentChoice) {
            case (.Rock, .Scissor), (.Scissor, .Rock):
                return UIImage(named: "RockCrushesScissors") ?? UIImage()
            case (.Paper, .Rock), (.Rock, .Paper):
                return UIImage(named: "PaperCoversRock") ?? UIImage()
            case (.Scissor, .Paper), (.Paper, .Scissor):
                return UIImage(named: "ScissorsCutPaper") ?? UIImage()
            default:
                return UIImage(named: "itsATie") ?? UIImage()
        }
    }
    
    private enum Choice {
        case Rock
        case Paper
        case Scissor
    }
    
    private enum Result {
        case Win
        case Loose
        case Tie
    }
}

