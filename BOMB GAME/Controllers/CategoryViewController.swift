//
//  CategoryViewController.swift
//  CHALLENGE №1 
//
//  Created by Vanopr on 08.08.2023.
//

import UIKit

class CategoryViewController: UIViewController {
    
    var category = Category()
    var memory = MemorySettings()
    
    var ifAboutDifferent     = UserDefaults.standard.bool(forKey: "ifAboutDifferentOn")
    var ifHobbiesAndSports   = UserDefaults.standard.bool(forKey: "ifHobbiesAndSportsOn")
    var ifLifeQuestions      = UserDefaults.standard.bool(forKey: "ifLifeQuestionsOn")
    var ifCelebrityQuestions = UserDefaults.standard.bool(forKey: "ifCelebrityQuestionsOn")
    var ifFilmArtQuestions   = UserDefaults.standard.bool(forKey: "ifFilmArtQuestionsOn")
    var ifNatureQuestions    = UserDefaults.standard.bool(forKey: "ifNatureQuestionsOn")
    
    @IBOutlet weak var aboutDifferent: UIButton!
    @IBOutlet weak var hobbiesAndSports: UIButton!
    @IBOutlet weak var aboutLife: UIButton!
    @IBOutlet weak var celebrity: UIButton!
    @IBOutlet weak var filmArt: UIButton!
    @IBOutlet weak var nature: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        сhoiceAboutDifferent()
        choiceHobbiesAndSportsAction()
        сhoiceLifeQuestions()
        сhoiceCelebrityQuestions()
        сhoiceFilmArtQuestions()
        сhoiceNatureQuestions()
    }
    
    @IBAction func aboutDifferentAction(_ sender: UIButton) {
        сhoiceAboutDifferent()
        newGame()
    }
    
    @IBAction func hobbiesAndSportsAction(_ sender: Any) {
        choiceHobbiesAndSportsAction()
        newGame()
    }
    
    @IBAction func LifeQuestionsAction(_ sender: UIButton) {
        сhoiceLifeQuestions()
        newGame()
    }
    
    @IBAction func CelebrityAction(_ sender: UIButton) {
        сhoiceCelebrityQuestions()
        newGame()
    }
    
    @IBAction func FilmArtAction(_ sender: Any) {
        сhoiceFilmArtQuestions()
        newGame()
    }
    
    @IBAction func NatureAction(_ sender: Any) {
        сhoiceNatureQuestions()
        newGame()
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        
        let startOver = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! MainViewController
        startOver.modalPresentationStyle = .fullScreen
        self.present(startOver, animated: true)
    }
    
    func сhoiceAboutDifferent() {
        
        if ifAboutDifferent {
            aboutDifferent.setImage(UIImage(named: "Category1On"), for: .normal )
        } else {
            aboutDifferent.setImage(UIImage(named: "Category1Off"), for: .normal )
        }
        
        ifAboutDifferent.toggle()
        UserDefaults.standard.set(!ifAboutDifferent, forKey: "ifAboutDifferentOn")
    }
    
    func choiceHobbiesAndSportsAction() {
        
        if ifHobbiesAndSports  {
            hobbiesAndSports.setImage(UIImage(named: "Category2On"), for: .normal)
        } else {
            hobbiesAndSports.setImage(UIImage(named: "Category2Off"), for: .normal)
        }
        ifHobbiesAndSports.toggle()
        UserDefaults.standard.set(!ifHobbiesAndSports, forKey: "ifHobbiesAndSportsOn")
        
    }
    
    func сhoiceLifeQuestions() {
        
        if ifLifeQuestions {
            aboutLife.setImage(UIImage(named: "Category3On"), for: .normal )
        } else {
            aboutLife.setImage(UIImage(named: "Category3Off"), for: .normal )
        }

        ifLifeQuestions.toggle()
        UserDefaults.standard.set(!ifLifeQuestions,   forKey: "ifLifeQuestionsOn")
    }
    
    func сhoiceCelebrityQuestions() {
        
        if ifCelebrityQuestions {
            celebrity.setImage(UIImage(named: "Category4On"), for: .normal )
        } else {
            celebrity.setImage(UIImage(named: "Category4Off"), for: .normal )
        }
        
        ifCelebrityQuestions.toggle()
        UserDefaults.standard.set(!ifCelebrityQuestions,  forKey: "ifCelebrityQuestionsOn")
    }
    
    func сhoiceFilmArtQuestions() {
        
        if ifFilmArtQuestions {
            filmArt.setImage(UIImage(named: "Category5On"), for: .normal )
        } else {
            filmArt.setImage(UIImage(named: "Category5Off"), for: .normal )
        }
        
        ifFilmArtQuestions.toggle()
        UserDefaults.standard.set(!ifFilmArtQuestions,  forKey: "ifFilmArtQuestionsOn")
    }
    
    func сhoiceNatureQuestions() {
        
        if ifNatureQuestions {
            nature.setImage(UIImage(named: "Category6On"), for: .normal )
        } else {
            nature.setImage(UIImage(named: "Category6Off"), for: .normal )
        }
        ifNatureQuestions.toggle()
        UserDefaults.standard.set(!ifNatureQuestions, forKey: "ifNatureQuestionsOn")
    }
    
    func newGame() {
        memory.ifContinue = false
        UserDefaults.standard.set(memory.ifContinue, forKey: "continue")
    }
}
