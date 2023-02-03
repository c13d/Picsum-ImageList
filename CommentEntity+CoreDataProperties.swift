//
//  CommentEntity+CoreDataProperties.swift
//  Picsum-ImageList
//
//  Created by Christophorus Davin on 03/02/23.
//
//

import Foundation
import CoreData


extension CommentEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CommentEntity> {
        return NSFetchRequest<CommentEntity>(entityName: "CommentEntity")
    }

    @NSManaged public var id: Int32
    @NSManaged public var profilePictureUrl: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var comment: String?
    @NSManaged public var dateAdded: Date?

}

extension CommentEntity : Identifiable {

}
