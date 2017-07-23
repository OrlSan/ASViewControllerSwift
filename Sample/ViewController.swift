//
//  ViewController.swift
//  Sample
//
//  Created by Orlando on 22/07/17.
//  Copyright © 2017 Orlando. All rights reserved.
//

import UIKit
import AsyncDisplayKit

final class ViewController: ASViewController<ASTableNode>, ASTableDataSource, ASTableDelegate {
    
    let objects: [String] = ["abstract", "animals", "business", "cats", "city", "food", "nightlife", "fashion", "people", "nature", "sports", "technics", "transport"]
    
    init() {
        super.init(node: ASTableNode())
        
        self.title = "Image Categories"
        
        node.delegate = self
        node.dataSource = self
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("storyboards are not compatible with Texture")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let selectedIndexPath = self.node.indexPathForSelectedRow {
            self.node.deselectRow(at: selectedIndexPath, animated: false)
        }
    }
    
    //MARK: ASTableNodeDataSource
    
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 1
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let cellNodeBlock = { () -> ASCellNode in
            let cellNode = ASTextCellNode()
            cellNode.text = self.objects[indexPath.row].capitalized
            
            return cellNode
        }
        
        return cellNodeBlock
    }
    
    //MARK: ASTableNodeDelegate
    
    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
        let category = objects[indexPath.row]
        let detailRootNode = DetailRootNode(category: category)
        let detailViewController = DetailViewController(node: detailRootNode)
        detailViewController.title = category.capitalized
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
