//
//  ReactionsCollectionViewController.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 09/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import UIKit
class ReactionsCollectionViewController: UICollectionViewController {
    
    private var lastSelectedCell = 0
    private var firstSelectedWhenCreated = true
    var preselectedFeeling = Feeling.none
    
    typealias OnFeelingSelected = ((Feeling)->Void)
    var onFeelingSelected :OnFeelingSelected?
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Feeling.allFeelings.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "emojiCell", for: indexPath) as! FeelingCollectionCellView
        let feeling = Feeling.allFeelings[indexPath.item]
        let feelingImage = UIImage(named: feeling.imageName)
        cell.reactionImage.image = feelingImage
        cell.reactionName.text = feeling.displayName
        
        if (feeling.id == preselectedFeeling.id && firstSelectedWhenCreated){
            firstSelectedWhenCreated = false
            cell.isSelected = true
            onFeelingSelected?(Feeling.allFeelings[indexPath.item])
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let previousSelectedCell = collectionView.cellForItem(at: IndexPath(item: lastSelectedCell, section: 0)) as! FeelingCollectionCellView
        previousSelectedCell.isSelected = false;
        let newSelectedCell = collectionView.cellForItem(at: indexPath)
        newSelectedCell?.isSelected = true
        self.lastSelectedCell = indexPath.item
        onFeelingSelected?(Feeling.allFeelings[indexPath.item])
    }
}
