
//  aboutCoreDat.swift
//  Doit_Memo_Coredata
//
//  Created by kiakim on 2023/09/20.
//

import UIKit
import CoreData

var coreDataModels = [Task]()

class AboutCoreData {
    

    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    func getAllItems(){
        do{
            coreDataModels = try context.fetch(Task.fetchRequest())
                print("getAllItems실행", coreDataModels)
        }
        catch {
            //error
        }
    }
    
    //UUID : 고유한 ID값 생성
    func createItem(id: UUID, contents: String, isDone: Bool ){
       
        let newItem = Task(context: context)
        newItem.id = id
        newItem.contents = contents
        newItem.isDone = false
        do{
            //context coreData 중개자
            try context.save()
            getAllItems()
        }
        catch {
            
        }
        
    }
    
    func deleteItem(coreIndex: IndexPath){
        let deleted = coreDataModels[coreIndex.row]
        context.delete(deleted)
        do{
            try context.save()
            getAllItems()
        }
        catch {
            
        }
    }
    
    
    
    
    func updateItem(coreIndex:IndexPath, isDone: Bool){
        let isDoneValue = coreDataModels[coreIndex.row].isDone
        let isDoneChange = !isDoneValue
            
        do{
            try context.save()
        }
        catch {
            
        }
    }
    
}

