//
//  ImageViewModel.swift
//  Picsum-ImageList
//
//  Created by Christophorus Davin on 02/02/23.
//

import Foundation
import RxSwift
import RxCocoa

class ImageViewModel{
    static let instance = ImageViewModel()
    let disposeBag = DisposeBag()
    
    let downloadImage = DownloadImage.instance
    
    let imageListResult = BehaviorRelay<[ImageModel]>(value: [])
    let fetchMoreData = PublishSubject<Void>()
    
    var pageCounter = 0
    
    var isFetchingData = false
    
    init(){
        bind()
    }
    
    private func bind(){
        fetchMoreData.subscribe{ [weak self] _ in
            guard let self = self else {return}
            self.fetchImages()
        }.disposed(by: disposeBag)
    }
    
    func fetchImages(){
        if isFetchingData == true {return}
        
        pageCounter += 1
        isFetchingData = true
        
        downloadImage.downloadImageList(page: pageCounter) { [weak self] resultModel in
            guard let self = self else {return}
            switch resultModel{
            case .success(let resultModel):
                for result in resultModel{
                    var tempResult = self.imageListResult.value
                    tempResult.append(result)
                    self.imageListResult.accept(tempResult)
                }
            case .failure(let error):
                print(error)
            }
            
            self.isFetchingData = false
        }
    }
    
}
