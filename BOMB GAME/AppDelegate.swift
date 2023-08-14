//
//  AppDelegate.swift
//  CHALLENGE №1 
//
//  Created by Vanopr on 07.08.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var questionStart = Category()

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            // Проверяем, было ли приложение запущено впервые
            if !UserDefaults.standard.bool(forKey: "hasLaunchedBefore") {
                UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
                UserDefaults.standard.synchronize()
                
                // Выполняем код для первого запуска
                UserDefaults.standard.set(true,    forKey: "ifAboutDifferentOn")
                UserDefaults.standard.set(false,   forKey: "ifHobbiesAndSportsOn")
                UserDefaults.standard.set(false,   forKey: "ifLifeQuestionsOn")
                UserDefaults.standard.set(false,  forKey: "ifCelebrityQuestionsOn")
                UserDefaults.standard.set(false,  forKey: "ifFilmArtQuestionsOn")
                UserDefaults.standard.set(false, forKey: "ifNatureQuestionsOn")
                UserDefaults.standard.set(true, forKey: "shortGameOn")
                UserDefaults.standard.set(false, forKey: "middleGameOn")
                UserDefaults.standard.set(false, forKey: "longGameOn")
                UserDefaults.standard.set(false, forKey: "randomGameOn")
                UserDefaults.standard.set(10, forKey: "gameTime")
                UserDefaults.standard.set(questionStart.moviesQuestions, forKey: "questions")
                UserDefaults.standard.set(true, forKey: "tasksOnOff")
                UserDefaults.standard.set(true, forKey: "musicOnOff")
                UserDefaults.standard.set(1, forKey: "musicNumber")
                UserDefaults.standard.set(1, forKey: "clockSoundNumber")
                UserDefaults.standard.set(1, forKey: "bombSoundNumber")
                UserDefaults.standard.set(false, forKey: "continue")
                UserDefaults.standard.set(true, forKey: "animation")
                UserDefaults.standard.set(false, forKey: "randomCategoryOnOff")


            }
            
            return true
        }
    
    func applicationWillTerminate(_ application: UIApplication) {
            // Вызывается перед закрытием приложения
           UserDefaults.standard.synchronize() // Синхронизация

        }
    


}

