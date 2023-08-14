//
//  SettingsViewController.swift
//  CHALLENGE №1 
//
//  Created by Vanopr on 10.08.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var memory = MemorySettings()
    
    let purpleColor  = UIColor(red: 129/255, green: 48/255, blue: 167/255, alpha: 1)
    let yellowColor  = UIColor(red: 247/255, green: 248/255, blue: 11/255, alpha: 1)
    
    @IBOutlet weak var shortG: UIButton!
    @IBOutlet weak var middleG: UIButton!
    @IBOutlet weak var longG: UIButton!
    @IBOutlet weak var randomG: UIButton!
    @IBOutlet weak var gameWithTask: UISwitch!
    @IBOutlet weak var gameWithMusic: UISwitch!
    @IBOutlet weak var backMusicChoice: UIButton!
    @IBOutlet weak var clockSound: UIButton!
    @IBOutlet weak var bombSound: UIButton!
    @IBOutlet weak var animationOnOff: UISwitch!
    @IBOutlet weak var randomCategoryOnOf: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shortG.layer.cornerRadius = 20
        shortG.layer.borderColor = UIColor.black.cgColor
        shortG.layer.borderWidth = 1
        
        middleG.layer.cornerRadius = 20
        middleG.layer.borderColor = UIColor.black.cgColor
        middleG.layer.borderWidth = 1
        
        longG.layer.cornerRadius = 20
        longG.layer.borderColor = UIColor.black.cgColor
        longG.layer.borderWidth = 1
        
        randomG.layer.cornerRadius = 20
        randomG.layer.borderColor = UIColor.black.cgColor
        randomG.layer.borderWidth = 1
        
        shortGameOnOff()
        middleGameOnOff()
        longGameOnOff()
        randomGameOnOff()
        
        if memory.tasksOnOff {
            gameWithTask.isOn = true
        } else {
            gameWithTask.isOn  = false
        }
        
        if memory.musicOnOff {
            gameWithMusic.isOn = true
        } else {
            gameWithMusic.isOn  = false
        }
        
        if memory.animation {
            animationOnOff.isOn = true
        } else {
            animationOnOff.isOn  = false
        }
        
        if memory.randomCategory {
            randomCategoryOnOf.isOn = true
        } else {
            randomCategoryOnOf.isOn  = false
        }
        
        setBackgroundMusic()
        setClockMusic()
        setBombMusic()
    }
    
    @IBAction func shortGame(_ sender: UIButton) {
        
        memory.shortGameOn = true
        shortGameOnOff()
        memory.gameTime = 10
        UserDefaults.standard.set(false, forKey: "continue")
    }
    
    @IBAction func middleGame(_ sender: UIButton) {
        
        memory.middleGameOn = true
        middleGameOnOff()
        memory.gameTime = 20
        UserDefaults.standard.set(false, forKey: "continue")
    }
    
    @IBAction func longGame(_ sender: UIButton) {
        
        memory.longGameOn = true
        longGameOnOff()
        memory.gameTime = 45
        UserDefaults.standard.set(false, forKey: "continue")
    }
    
    @IBAction func randomGame(_ sender: UIButton) {
        
        memory.randomGameOn = true
        randomGameOnOff()
        memory.gameTime = Int.random(in: 10...45)
        UserDefaults.standard.set(false, forKey: "continue")
    }
    
    @IBAction func onOrOffTasks(_ sender: UISwitch) {
        
        if sender.isOn {
            memory.tasksOnOff = true
        } else {
            memory.tasksOnOff = false
        }
    }
    
    @IBAction func onOrOffMusic(_ sender: UISwitch) {
        
        if sender.isOn {
            memory.musicOnOff = true
        } else {
            memory.musicOnOff = false
        }
    }
    
    @IBAction func animationOnOff(_ sender: UISwitch) {
        
        if sender.isOn {
            memory.animation = true
        } else {
            memory.animation = false
        }
    }
    
    @IBAction func randomCategorySwitch(_ sender: UISwitch) {
        
        if sender.isOn {
            memory.randomCategory = true
        } else {
            memory.randomCategory = false
        }
        
        UserDefaults.standard.set(memory.randomCategory, forKey: "randomCategoryOnOff")
        UserDefaults.standard.set(false, forKey: "continue")
    }
    
    func shortGameOnOff() {
        
        if memory.shortGameOn {
            
            shortG.backgroundColor = purpleColor
            middleG.backgroundColor = yellowColor
            longG.backgroundColor = yellowColor
            randomG.backgroundColor = yellowColor
            memory.middleGameOn = false
            memory.longGameOn   = false
            memory.randomGameOn = false
        }
    }
    
    func middleGameOnOff() {
        
        if memory.middleGameOn {
            
            shortG.backgroundColor = yellowColor
            middleG.backgroundColor = purpleColor
            longG.backgroundColor = yellowColor
            randomG.backgroundColor = yellowColor
            memory.shortGameOn  = false
            memory.longGameOn   = false
            memory.randomGameOn = false
        }
    }
    
    func longGameOnOff() {
        
        if memory.longGameOn {
            
            shortG.backgroundColor = yellowColor
            middleG.backgroundColor = yellowColor
            longG.backgroundColor = purpleColor
            randomG.backgroundColor = yellowColor
            memory.shortGameOn  = false
            memory.middleGameOn   = false
            memory.randomGameOn = false
        }
    }
    
    func randomGameOnOff() {
        
        if memory.randomGameOn {
            
            shortG.backgroundColor = yellowColor
            middleG.backgroundColor = yellowColor
            longG.backgroundColor = yellowColor
            randomG.backgroundColor = purpleColor
            memory.shortGameOn  = false
            memory.middleGameOn = false
            memory.longGameOn   = false
        }
    }
    
    func setBackgroundMusic() {
        
        
        let menuItem1 = UIAction(title: "Мелодия 1") { action in
            self.memory.musicNumber = 1
        }
        
        let menuItem2 = UIAction(title: "Мелодия 2") { action in
            self.memory.musicNumber = 2
        }
        
        let menuItem3 = UIAction(title: "Мелодия 3") { action in
            self.memory.musicNumber = 3
        }
        
        if memory.musicNumber == 1 {
            menuItem1.state = .on
        } else if memory.musicNumber == 2 {
            menuItem2.state = .on
        } else {
            menuItem3.state = .on
        }
        
       
        backMusicChoice.menu = UIMenu(title: "Custom Menu", children: [menuItem1, menuItem2, menuItem3])
        backMusicChoice.showsMenuAsPrimaryAction = true
        backMusicChoice.changesSelectionAsPrimaryAction = true
    }
 
    
    func setClockMusic() {
        
        let menuItem1 = UIAction(title: "Часы 1") { action in
            self.memory.clockSoundNumber = 1
        }
        
        let menuItem2 = UIAction(title: "Часы 2") { action in
            self.memory.clockSoundNumber = 2
        }
        
        let menuItem3 = UIAction(title: "Часы 3") { action in
            self.memory.clockSoundNumber = 3
        }
        
        if memory.clockSoundNumber == 1 {
            menuItem1.state = .on
        } else if memory.clockSoundNumber == 2 {
            menuItem2.state = .on
        } else {
            menuItem3.state = .on
        }
        
        clockSound.menu = UIMenu(title: "Часы", children: [menuItem1, menuItem2, menuItem3])
        clockSound.showsMenuAsPrimaryAction = true
        clockSound.changesSelectionAsPrimaryAction = true
    }
    
    func setBombMusic() {
        
        let menuItem1 = UIAction(title: "Взрыв 1") { action in
            self.memory.bombSoundNumber = 1
        }
        
        
        let menuItem2 = UIAction(title: "Взрыв 2") { action in
            self.memory.bombSoundNumber = 2
        }
        
        let menuItem3 = UIAction(title: "Взрыв 3") { action in
            self.memory.bombSoundNumber = 3
        }
        
        if memory.bombSoundNumber == 1 {
            
            menuItem1.state = .on
        } else if memory.bombSoundNumber == 2 {
            menuItem2.state = .on
        } else {
            menuItem3.state = .on
        }
        
        bombSound.menu = UIMenu(title: "Часы", children: [menuItem1, menuItem2, menuItem3])
        bombSound.showsMenuAsPrimaryAction = true
        bombSound.changesSelectionAsPrimaryAction = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        
        UserDefaults.standard.set(memory.shortGameOn, forKey: "shortGameOn")
        UserDefaults.standard.set(memory.middleGameOn, forKey: "middleGameOn")
        UserDefaults.standard.set(memory.longGameOn, forKey: "longGameOn")
        UserDefaults.standard.set(memory.randomGameOn, forKey: "randomGameOn")
        UserDefaults.standard.set(memory.tasksOnOff, forKey: "tasksOnOff")
        UserDefaults.standard.set(memory.musicOnOff, forKey: "musicOnOff")
        UserDefaults.standard.set(memory.gameTime, forKey: "gameTime")
        UserDefaults.standard.set(memory.musicNumber, forKey: "musicNumber")
        UserDefaults.standard.set(memory.clockSoundNumber, forKey: "clockSoundNumber")
        UserDefaults.standard.set(memory.bombSoundNumber, forKey: "bombSoundNumber")
        UserDefaults.standard.set(memory.animation, forKey: "animation")
        UserDefaults.standard.synchronize() // Синхронизация
    }
}
