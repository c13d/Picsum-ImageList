//
//  CoreDataManager.swift
//  Picsum-ImageList
//
//  Created by Christophorus Davin on 03/02/23.
//

import CoreData
import UIKit

class CoreDataManager{
    
    static let instance = CoreDataManager()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchComments(id: Int) -> [CommentEntity]{
        var comments = [CommentEntity]()
        do{
            let request = CommentEntity.fetchRequest() as NSFetchRequest<CommentEntity>
            
            let sort = NSSortDescriptor(key: "dateAdded", ascending: true)
            request.sortDescriptors = [sort]
            
            comments = try context.fetch(request)
        }catch{
            
        }
        return comments
    }
    
    func addNewComment(id: Int,profilePictureUrl: String, firstName: String, lastName: String, comment: String){
        
        let newComment = CommentEntity(context: self.context)
        newComment.id = Int32(id)
        newComment.profilePictureUrl = profilePictureUrl
        newComment.firstName = firstName
        newComment.lastName = lastName
        newComment.comment = comment
        newComment.dateAdded = Date()
        
        do{
            try self.context.save()
        }catch{
            
        }
    }
    
}
