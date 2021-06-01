//
//  KVCollectionViewFlowLayout.swift
//  KVProj
//
//  Created by Matías Spinelli on 01/06/2021.
//

import UIKit

class KVCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        setup()
    }
    
    private func setup() {
        scrollDirection = .vertical

        var numberOfColumns: CGFloat = 2.0
        
        if UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight {
            numberOfColumns = 3.0
        } else {
            numberOfColumns = 2.0
        }
        
        let widthFloat = CGFloat(collectionView!.frame.width)
        let cellSpacing = (widthFloat - (130 * numberOfColumns) ) / (2 * numberOfColumns)
        
        itemSize = CGSize(width: 130, height: 200)
        
        sectionInset = UIEdgeInsets(top: 30.0, left: cellSpacing, bottom: 30.0, right: cellSpacing)
        
        minimumLineSpacing = 30.0
        minimumInteritemSpacing = cellSpacing
    }
}
