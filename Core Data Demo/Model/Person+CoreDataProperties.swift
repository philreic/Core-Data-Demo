//
//  Person+CoreDataProperties.swift
//  Core Data Demo
//
//  Created by Philippe Reichen on 12/8/21.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var age: String?
    @NSManaged public var array: [String]?
    @NSManaged public var gender: String?
    @NSManaged public var name: String?

}

extension Person : Identifiable {

}
