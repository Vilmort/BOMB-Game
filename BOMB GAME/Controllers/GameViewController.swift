//
//  GameViewController.swift
//  CHALLENGE №1
//
//  Created by Vanopr on 07.08.2023.
//

import UIKit
import Lottie
import AVFoundation
import Foundation

class GameViewController: UIViewController {
    
    var animationCurrentTime = UserDefaults.standard.double(forKey: "animationCurrentTime")
    var timer: Timer?
    
    var category = Category()
    var audio = Audio()
    
    var questionsActual = UserDefaults.standard.array(forKey: "questions") as! [String]
    var memorySettings = MemorySettings()
    
    var questionSaved = UserDefaults.standard.string( forKey: "questionSaved")
    
    let animationActual = UserDefaults.standard.integer(forKey: "animation")
    
    let gameTimeActual =  UserDefaults.standard.integer(forKey: "gameTime")
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet private var animationView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.set(true, forKey: "continue")
        
        // MARK: Проверка
        
        print(questionsActual.count)
        print(gameTimeActual)
        print(animationCurrentTime)
        
        animationView!.frame = view.bounds
        animationView!.contentMode = .scaleAspectFit
        animationView!.stop()
        // изменить на .play чтобы запустить анимацию
        stopButton.isHidden = true
        audio.setupAudioPlayers()
    }
    
    @IBAction func goBackFromStartScreenButtonAction(_ sender: UIButton) {
        
        animationView.stop()
        audio.stopMusic()
        timer?.invalidate()
        timer = nil
        
        UserDefaults.standard.set(animationCurrentTime, forKey: "animationCurrentTime")
        
        let startOver = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! MainViewController
        startOver.modalPresentationStyle = .fullScreen
        self.present(startOver, animated: true)
    }
    
    
    @IBAction func goButtonAction(_ sender: UIButton) {

        if animationCurrentTime.rounded(.awayFromZero) == 0 {
            let questionSaved = category.getRandomNonRepeatingQuestion(questionsModify: questionsActual)
            questionLabel.text = questionSaved
            UserDefaults.standard.set(questionSaved, forKey: "questionSaved")
            UserDefaults.standard.set(category.newArrayOfQuestion, forKey: "questions")
            UserDefaults.standard.synchronize() // Синхронизация

        } else {
           
            questionLabel.text = UserDefaults.standard.string(forKey: "questionSaved")
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateAnimationCurrentTime), userInfo: nil, repeats: true)
        
        if memorySettings.animation {
            animationView!.loopMode = .loop
            animationView.play()
        }
        
        audio.playMusic()
        goButton.isHidden = true
        stopButton.isHidden = false
    }
    
    @IBAction func stopButtonAction(_ sender: UIButton) {
        animationView.pause()
        audio.pauseMusic()
        goButton.isHidden = false
        stopButton.isHidden = true
        timer?.invalidate()
        timer = nil

    }
    
    func gameOver() {
        
        let endGameViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EndGameViewController") as! EndGameViewController
        endGameViewController.modalPresentationStyle = .fullScreen
        self.present(endGameViewController, animated: true)
        
        animationView.isHidden = true
        audio.stopMusic()
        audio.explosionMusic?.play()
        timer?.invalidate()
        timer = nil
    }
    
    @objc func updateAnimationCurrentTime() {
        
        if animationCurrentTime < Double(gameTimeActual) && goButton.isHidden == true  {
            animationCurrentTime += 0.1
        } else {
            gameOver()
        }
    }
}
