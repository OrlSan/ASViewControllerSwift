//
//  DetailCellNode.swift
//  Sample
//
//  Created by Orlando on 22/07/17.
//  Copyright © 2017 Orlando. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class DetailCellNode: ASCellNode {
    var row: Int = 0
    var imageCategory: String = "abstract"
    var imageNode: ASNetworkImageNode?
    
    // The image URL
    private var imageURL: URL {
        get {
            let imageSize: CGSize = self.calculatedSize
            let urlWith = Int(imageSize.width)
            let urlHeight = Int(imageSize.height)
            return URL(string: "https://lorempixel.com/\(urlWith)/\(urlHeight)/\(imageCategory)/\(row)")!
        }
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("Texture doest not support Storyboards")
    }
    
    override init() {
        super.init()
        
        self.automaticallyManagesSubnodes = true
        self.imageNode = ASNetworkImageNode()
        self.imageNode?.backgroundColor = ASDisplayNodeDefaultPlaceholderColor()
    }
    
    //MARK - ASDisplayNode
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASRatioLayoutSpec.init(ratio: 1.0, child: self.imageNode!)
    }
    
    override func layoutDidFinish() {
        super.layoutDidFinish()
        
        self.imageNode?.url = self.imageURL
    }
}
