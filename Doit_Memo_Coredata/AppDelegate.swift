//
//  AppDelegate.swift
//  Doit_Memo_Coredata
//
//  Created by kiakim on 2023/09/20.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //MARK: Core Data Stack
    //coredata model을 관리하는 클래스, 영구 저장소를 로딩
    lazy var persistentContainer: NSPersistentContainer = {
        
        //coreData 파일명과 일치하는 컨테이너를 생성
        let container = NSPersistentContainer(name: "CoreDataModel")
        //영구저장소를 로딩하고 설정
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            //오류가 발생한 경우 처리
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    //MARK: Core data saving support
    func saveContext () {
        
        // NSPersistentContainer에서 기본뷰를 가져옴
        let context = persistentContainer.viewContext
        // context에 변경사항이 발생하면
        if context.hasChanges {
            // 변경사항을 저장
            do {
                try context.save()
            } catch {
                //error가 발생할 경우 오류메세지
                let nesrror = error as NSError
                fatalError("Unresolved error \(nesrror),\(nesrror.userInfo)")
            }
        }
        
        
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            // Override point for customization after application launch.
            return true
        }
        
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
        
        
    }
    
}
