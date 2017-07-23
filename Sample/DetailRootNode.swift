//
//  DetailRootNode.swift
//  Sample
//
//  Created by Orlando on 22/07/17.
//  Copyright © 2017 Orlando. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class DetailRootNode: ASDisplayNode, ASCollectionDataSource, ASCollectionDelegate {
    var collectionNode: ASCollectionNode?
    private var imageCategory: String?
    
    required init(coder aDecoder: NSCoder) {
        fatalError("Texture is not compatible with Storyboards")
    }
    
    init(category newCategory: String) {
        super.init()
        
        self.automaticallyManagesSubnodes = true
        self.imageCategory = newCategory
        
        let layout = UICollectionViewFlowLayout()
        self.collectionNode = ASCollectionNode(collectionViewLayout: layout)
        self.collectionNode?.delegate = self
        self.collectionNode?.dataSource = self
        self.collectionNode?.backgroundColor = UIColor.white
    }
    
    //MARK - ASDisplayNode
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASWrapperLayoutSpec.wrapper(with: self.collectionNode!)
    }
    
    //MARK - ASCollectionDataSource
    
    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return 1
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        let imageCategory = self.imageCategory!
        
        let cellNodeBlock = { () -> DetailCellNode in
            let node = DetailCellNode()
            node.row = indexPath.row
            node.imageCategory = imageCategory
            
            return node
        }
        
        return cellNodeBlock
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, constrainedSizeForItemAt indexPath: IndexPath) -> ASSizeRange {
        let imageSize = CGSize.init(width: (self.collectionNode?.view.frame.width)!, height: 200)
        
        return ASSizeRangeMake(imageSize, imageSize)
    }
    
}
