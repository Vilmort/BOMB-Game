//
//  memoryBrain.swift
//  CHALLENGE №1 
//
//  Created by Vanopr on 11.08.2023.
//

import Foundation

struct MemorySettings {
    
    var shortGameOn  = UserDefaults.standard.bool( forKey: "shortGameOn")
    var middleGameOn = UserDefaults.standard.bool(forKey: "middleGameOn")
    var longGameOn   = UserDefaults.standard.bool(forKey: "longGameOn")
    var randomGameOn = UserDefaults.standard.bool( forKey: "randomGameOn")
    var gameTime     = UserDefaults.standard.integer(forKey: "gameTime")
    var tasksOnOff   = UserDefaults.standard.bool( forKey: "tasksOnOff")
    var musicOnOff   = UserDefaults.standard.bool( forKey: "musicOnOff")
    var musicNumber  = UserDefaults.standard.integer(forKey: "musicNumber")
    var clockSoundNumber = UserDefaults.standard.integer(forKey: "clockSoundNumber")
    var bombSoundNumber = UserDefaults.standard.integer(forKey: "bombSoundNumber")
    var animation =  UserDefaults.standard.bool(forKey: "animation")
    var randomCategory = UserDefaults.standard.bool(forKey: "randomCategoryOnOff")
    var ifContinue = UserDefaults.standard.bool(forKey: "continue")

}
