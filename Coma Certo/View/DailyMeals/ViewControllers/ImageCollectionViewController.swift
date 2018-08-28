//
//  ReactionsCollectionViewController.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 09/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import UIKit
class ImageCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private var lastSelectedCell = 0
    private var firstSelectedWhenCreated = true
    var preselectedItem : Displayable? = nil
    var items = [Displayable]()
    
    typealias OnItemSelected = ((Displayable)->Void)
    var onItemSelected :OnItemSelected?
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var divisionFactor = CGFloat(5)
        if UIInterfaceOrientationIsLandscape(UIApplication.shared.statusBarOrientation) {
            divisionFactor = CGFloat(10)
        }
        return CGSize(width: self.view.frame.width / divisionFactor, height: self.view.frame.width / divisionFactor)
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "emojiCell", for: indexPath) as! ImageCollectionCellView
        let itemToDisplay = items[indexPath.item]
        print("ImageCollectionViewController: creating cell for \(indexPath)")
        cell.reactionImage.image = itemToDisplay.displayImage()
        cell.reactionName.text = itemToDisplay.displayName()
        if let preselectedItem = self.preselectedItem{
            if itemToDisplay.equals( other: preselectedItem) {
                firstSelectedWhenCreated = false
                cell.isSelected = true
                lastSelectedCell = indexPath.row
                onItemSelected?(items[indexPath.item])
            }
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let previousSelectedCell = collectionView.cellForItem(at: IndexPath(item: lastSelectedCell, section: 0)) as! ImageCollectionCellView
        previousSelectedCell.isSelected = false;
        let newSelectedCell = collectionView.cellForItem(at: indexPath)
        newSelectedCell?.isSelected = true
        self.lastSelectedCell = indexPath.item
        onItemSelected?(items[indexPath.item])
        self.preselectedItem = items[indexPath.item]
    }
}
