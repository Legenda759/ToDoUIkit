//
//  ToDoListItem+CoreDataProperties.swift
//  ToDoUIkit
//
//  Created by Legenda_759 on 07/03/22.
//
//

import Foundation
import CoreData


extension ToDoListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListItem> {
        return NSFetchRequest<ToDoListItem>(entityName: "ToDoListItem")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var email: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var address: String?

}

extension ToDoListItem : Identifiable {

}
