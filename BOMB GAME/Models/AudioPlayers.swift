//
//  AudioPlayers.swift
//  CHALLENGE №1 
//
//  Created by Vanopr on 11.08.2023.
//

import Foundation
import AVFAudio

struct Audio {
    
    var backgroundMusic: AVAudioPlayer?
    var tickingMusic: AVAudioPlayer?
    var explosionMusic: AVAudioPlayer?
    var burnMusic: AVAudioPlayer?
    
    var musicOnOff = UserDefaults.standard.bool( forKey: "musicOnOff")
    var musicNumber  = UserDefaults.standard.integer(forKey: "musicNumber")
    var clockSoundNumber = UserDefaults.standard.integer(forKey: "clockSoundNumber")
    var bombSoundNumber = UserDefaults.standard.integer(forKey: "bombSoundNumber")
    
    var musicTitle = ""
    var clockTitle = ""
    var bombTitle  = ""
    
    mutating func setupAudioPlayers() {
        
        if musicNumber == 1 {
            musicTitle = "Background Music 1"
        } else if musicNumber == 2 {
            musicTitle = "Background Music 2"
        } else {
            musicTitle = "Background Music 3"
        }
        
        if clockSoundNumber == 1 {
            clockTitle = "ticking1"
        } else if clockSoundNumber == 2 {
            clockTitle = "ticking2"
        } else {
            clockTitle = "ticking3"
        }
        
        if bombSoundNumber == 1 {
            bombTitle = "Explosion+1"
        } else if bombSoundNumber == 2 {
            bombTitle = "Explosion+2"
        } else {
            bombTitle = "Explosion+3"
        }
        
        if let soundFilePath1 = Bundle.main.path(forResource: musicTitle, ofType: "mp3"), let soundFilePath2 = Bundle.main.path(forResource: clockTitle, ofType: "mp3"), let soundFilePath3 = Bundle.main.path(forResource: bombTitle, ofType: "mp3"), let soundFilePath4 = Bundle.main.path(forResource: "Burn", ofType: "mp3") {
            let soundFileURL1 = URL(fileURLWithPath: soundFilePath1)
            let soundFileURL2 = URL(fileURLWithPath: soundFilePath2)
            let soundFileURL3 = URL(fileURLWithPath: soundFilePath3)
            let soundFileURL4 = URL(fileURLWithPath: soundFilePath4)
            
            do {
                backgroundMusic = try AVAudioPlayer(contentsOf: soundFileURL1)
                tickingMusic = try AVAudioPlayer(contentsOf: soundFileURL2)
                explosionMusic = try AVAudioPlayer(contentsOf: soundFileURL3)
                burnMusic = try AVAudioPlayer(contentsOf: soundFileURL4)
                // Подготовка к воспроизведению
                backgroundMusic?.prepareToPlay()
                tickingMusic?.prepareToPlay()
                explosionMusic?.prepareToPlay()
                explosionMusic?.numberOfLoops = 0
                burnMusic?.prepareToPlay()
                
                if !musicOnOff {
                    backgroundMusic?.volume = 0.0
                    tickingMusic?.volume = 0.0
                    explosionMusic?.volume = 0.0
                    burnMusic?.volume = 0.0
                }
                
            } catch {
                print("Ошибка при загрузке аудио: \(error.localizedDescription)")
            }
        }
    }
    
    func playMusic() {
        backgroundMusic?.play()
        tickingMusic?.play()
        burnMusic?.play()
    }
    
    func stopMusic() {
        backgroundMusic?.stop()
        tickingMusic?.stop()
        burnMusic?.stop()
    }
    
    func pauseMusic() {
        backgroundMusic?.pause()
        tickingMusic?.pause()
        burnMusic?.pause()
    }
}
