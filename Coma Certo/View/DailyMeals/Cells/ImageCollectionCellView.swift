//
//  ReactionCollectionCellView.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 09/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import UIKit
class ImageCollectionCellView : UICollectionViewCell{
    
    @IBOutlet weak var reactionImage: UIImageView!
    @IBOutlet weak var reactionName: UILabel!
    
    override var isSelected: Bool{
        didSet{
            if self.isSelected{
                self.contentView.backgroundColor =  UIColor(named: "SelectedFeelingColor")
            }
            else{
                self.contentView.backgroundColor = UIColor(named: "DeselectedFeelingColor")
            }
        }
    }
}
