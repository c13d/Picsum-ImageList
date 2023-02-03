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
    
    let imageListResult = BehaviorRelay<[CommentModel]>(value: [])
    let fetchNewData = PublishSubject<Void>()
    
    var isFetchingData = false
    
    var firstNames = [String]()
    var lastNames = [String]()
    var nouns = [String]()
    var verbs = [String]()
    
    init(){
        downloadLocalJson()
    }
    
    func fetchNewComment(){
        
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
