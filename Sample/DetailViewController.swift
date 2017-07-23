//
//  DetailViewController.swift
//  Sample
//
//  Created by Orlando on 22/07/17.
//  Copyright © 2017 Orlando. All rights reserved.
//

import UIKit
import AsyncDisplayKit

final class DetailViewController: ASViewController<DetailRootNode> {
    required init(coder aDecoder: NSCoder) {
        fatalError("Texture is not compatible with Storyboards")
    }
    
    override init(node newNode: DetailRootNode) {
        super.init(node: newNode)
    }
    
    //MARK - Rotation
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        self.node.collectionNode?.view.collectionViewLayout.invalidateLayout()
    }
}

