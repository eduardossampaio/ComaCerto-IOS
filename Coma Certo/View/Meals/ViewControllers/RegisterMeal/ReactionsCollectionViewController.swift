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
    
    private struct Reaction{
        let reactionName:String
        let reactionImage:String
        
        init(_ reactionName:String, _ reactionImage:String) {
            self.reactionName = reactionName
            self.reactionImage = reactionImage
        }
    }
    
    private let reactions = [
        Reaction("Alegria","emoji-happy"),
        Reaction("Ansiedade","emoji-anxiety"),
        Reaction("Frustração","emoji-frustration"),
        Reaction("Irritação","emoji-irritation"),
        Reaction("Pressa","emoji-hurry"),
        Reaction("Raiva","emoji-rage"),
        Reaction("Tédio","emoji-boredom"),
        Reaction("Tristeza","emoji-sad")
    ]
    
    private var lastSelectedCell = 0
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reactions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "emojiCell", for: indexPath) as! ReactionCollectionCellView
        let reaction = reactions[indexPath.item]
        let reactionImage = UIImage(named: reaction.reactionImage)
        cell.reactionImage.image = reactionImage
//        cell.reactionImage.image = UIImage(named: cell.reactionImage)
        cell.reactionName.text = reaction.reactionName
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let previousSelectedCell = collectionView.cellForItem(at: IndexPath(item: lastSelectedCell, section: 0)) as! ReactionCollectionCellView
        previousSelectedCell.isSelected = false;
        let newSelectedCell = collectionView.cellForItem(at: indexPath)
        newSelectedCell?.isSelected = true
        self.lastSelectedCell = indexPath.item
        print("selecionou item")
    }
}
