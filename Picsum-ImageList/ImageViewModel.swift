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
    
    var pageCounter = 1
    
    init(){
        bind()
    }
    
    private func bind(){
        
    }
    
    func fetchImages(){
        downloadImage.downloadImageList(page: pageCounter) { [weak self] resultModel in
            guard let self = self else {return}
            for result in resultModel{
                var tempResult = self.imageListResult.value
                tempResult.append(result)
                self.imageListResult.accept(tempResult)
            }
        }
    }
    
}
