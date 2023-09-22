//
//  Task+CoreDataProperties.swift
//  Doit_Memo_Coredata
//
//  Created by kiakim on 2023/09/21.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var contents: String?
    @NSManaged public var isDone: Bool

}

extension Task : Identifiable {

}
