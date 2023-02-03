//
//  CommentViewModel.swift
//  Picsum-ImageList
//
//  Created by Christophorus Davin on 03/02/23.
//

import Foundation
import RxSwift
import RxCocoa

class CommentViewModel{
    static let instance = CommentViewModel()
    let disposeBag = DisposeBag()
    let downloadJson = DownloadJson.instance
    let coreDataManager = CoreDataManager.instance
    
    let commentListResult = BehaviorRelay<[CommentEntity]>(value: [])
    let fetchNewData = PublishSubject<Void>()
    
    var isFetchingData = false
    
    var firstNames = [String]()
    var lastNames = [String]()
    var nouns = [String]()
    var verbs = [String]()
    
    init(){
        downloadLocalJson()
    }
    
    func fetchComments(id: Int){
        let temp = coreDataManager.fetchComments(id: id)
        commentListResult.accept(temp)
    }
    
    func addNewComment(id: Int){
        var comment = ""
        let randomIdxFirstName = Int.random(in: 0...firstNames.count-1)
        let randomIdxLastName = Int.random(in: 0...lastNames.count-1)
        
        for _ in 1...10{
            let randomIdxNouns = Int.random(in: 0...nouns.count-1)
            let randomIdxVerbs = Int.random(in: 0...verbs.count-1)
            comment.append(nouns[randomIdxNouns])
            comment.append(" ")
            comment.append(verbs[randomIdxVerbs])
        }
        
        let firstName = firstNames[randomIdxFirstName]
        let lastName = lastNames[randomIdxLastName]
        let profilePictureUrl = "\(Array(firstName)[0])\(Array(lastName)[0])"

        coreDataManager.addNewComment(id: id,profilePictureUrl: profilePictureUrl, firstName: firstName, lastName: lastName, comment: comment)
        fetchComments(id: id)
    }
    
}

extension CommentViewModel{
    func downloadLocalJson(){
        downloadJson.downloadJson(fileName: "firstNames") { [weak self] resultModel in
            guard let self = self else { return }
            switch resultModel{
                case .success(let result):
                    self.firstNames = result
                case .failure(let error):
                    print(error)
            }
        }
        
        downloadJson.downloadJson(fileName: "lastNames") { [weak self] resultModel in
            guard let self = self else { return }
            switch resultModel{
                case .success(let result):
                    self.lastNames = result
                case .failure(let error):
                    print(error)
            }
        }
        
        downloadJson.downloadJson(fileName: "nouns") { [weak self] resultModel in
            guard let self = self else { return }
            switch resultModel{
                case .success(let result):
                    self.nouns = result
                case .failure(let error):
                    print(error)
            }
        }
        
        downloadJson.downloadJson(fileName: "verbs") { [weak self] resultModel in
            guard let self = self else { return }
            switch resultModel{
                case .success(let result):
                    self.verbs = result
                case .failure(let error):
                    print(error)
            }
        }
    }
}
