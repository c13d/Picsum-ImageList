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
    let imageListResult = BehaviorRelay<[String]>(value: [])
    
    
    
}
