//
//  CharacterEntity+CoreDataProperties.swift
//  task10
//
//  Created by İlknur Tulgar on 27.09.2025.
//
//

import Foundation
import CoreData


extension CharacterEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CharacterEntity> {
        return NSFetchRequest<CharacterEntity>(entityName: "CharacterEntity")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var status: String?
    @NSManaged public var species: String?
    @NSManaged public var gender: String?
    @NSManaged public var image: String?
    @NSManaged public var originName: String?
    @NSManaged public var locationName: String?

}

extension CharacterEntity : Identifiable {

}
