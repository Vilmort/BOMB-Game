//
//  MainViewController.swift
//  CHALLENGE №1 
//
//  Created by Vanopr on 07.08.2023.
//

import UIKit
import Lottie

class MainViewController: UIViewController {
    
    let gradientLayer = CAGradientLayer()
    
    var category = Category()
    var memory = MemorySettings()
    
    var questionsActual = UserDefaults.standard.array(forKey: "questions") as! [String]
    var ifAboutDifferent = UserDefaults.standard.bool(forKey: "ifAboutDifferentOn")
    var ifHobbiesAndSports = UserDefaults.standard.bool(forKey: "ifHobbiesAndSportsOn")
    var ifLifeQuestions = UserDefaults.standard.bool(forKey: "ifLifeQuestionsOn")
    var ifCelebrityQuestions = UserDefaults.standard.bool(forKey: "ifCelebrityQuestionsOn")
    var ifFilmArtQuestions = UserDefaults.standard.bool(forKey: "ifFilmArtQuestionsOn")
    var ifNatureQuestions = UserDefaults.standard.bool(forKey: "ifNatureQuestionsOn")
    
    @IBOutlet weak var сontinueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.synchronize()
        
        if !memory.ifContinue  {
            сontinueButton.isHidden = true
        }
        
        if questionsActual.isEmpty  {
            сontinueButton.isHidden = true
        }
    }
    
    @IBAction func сontinueAction(_ sender: UIButton) {
        
        performSegue(withIdentifier: "ContinueButtonPresed", sender: nil)
    }
    
    
    
    @IBAction func askButton(_ sender: UIButton) {
        
        func performSegue(withIdentifier identifier: String, sender: Any?) {
            if identifier == "AskViewAction" {
                // Do something before the segue is performed
                super.performSegue(withIdentifier: "AskViewAction", sender: nil)
            }
        }
    }
    
    @IBAction func CategoryButton(_ sender: Any) {
        
        func performSegue(withIdentifier identifier: String, sender: Any?) {
            if identifier == "CategoryViewAction" {
                super.performSegue(withIdentifier: "CategoryViewAction", sender: nil)
            }
        }
        
    }
    
    @IBAction func startGameButton(_ sender: UIButton) {
        if !memory.randomCategory {
            questionsActual = category.addAllCategories(
                ifAboutDifferentOn     : ifAboutDifferent,
                ifHobbiesAndSportsOn   : ifHobbiesAndSports,
                ifLifeQuestionsOn      : ifLifeQuestions,
                ifCelebrityQuestionsOn : ifCelebrityQuestions,
                ifFilmArtQuestionsOn   : ifFilmArtQuestions,
                ifNatureQuestionsOn    : ifNatureQuestions)
        } else {
            questionsActual = category.addRandomCategories()
        }
        
        UserDefaults.standard.set(0, forKey: "animationCurrentTime")
        UserDefaults.standard.set(questionsActual, forKey: "questions")
        UserDefaults.standard.synchronize() // Синхронизация
        
        let startOver = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        startOver.modalPresentationStyle = .fullScreen
        self.present(startOver, animated: true)
    }
    
    @IBAction func goToSettingsAction(_ sender: UIButton) {
        
        func performSegue(withIdentifier identifier: String, sender: Any?) {
            if identifier == "goToSettings" {
                super.performSegue(withIdentifier: "goToSettings", sender: nil)
            }
        }
    }
}
