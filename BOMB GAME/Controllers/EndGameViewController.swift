//
//  EndGameViewController.swift
//  CHALLENGE №1 
//
//  Created by Vanopr on 08.08.2023.
//

import UIKit

class EndGameViewController: UIViewController {
    
    var tasks = Tasks()
    var memory = MemorySettings()
    
    @IBOutlet weak var labelPrompt: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var otherTask: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if memory.tasksOnOff {
            taskLabel.text = tasks.getRandomNonRepeatingTask()
        } else {
            taskLabel.isHidden   = true
            otherTask.isHidden   = true
            labelPrompt.isHidden = true
        }
    }
    
    @IBAction func changeTaskAction(_ sender: UIButton) {
        taskLabel.text = tasks.getRandomNonRepeatingTask()
    }
    
    @IBAction func startOverAction(_ sender: UIButton) {
        
        let startOver = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! MainViewController
        startOver.modalPresentationStyle = .overFullScreen
        self.present(startOver, animated: true)
    }
    
    @IBAction func goBackFromEndGameViewAction(_ sender: UIButton) {
        
        let gameViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        gameViewController.modalPresentationStyle = .fullScreen
        self.present(gameViewController, animated: true)
    }
}
