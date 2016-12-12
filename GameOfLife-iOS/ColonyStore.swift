//
//  ColonyStore.swift
//  GameOfLife-iOS
//
//  Created by Cameron Martin on 12/11/16.
//  Copyright © 2016 Jonathan J. Lee. All rights reserved.
//

import UIKit

class ColonyStore {
    
    var colonies = [Colony]()
    
    func createItem(colony: Colony) -> Colony {
        let newColony = colony
        
        colonies.append(newColony)
        
        return newColony
    }
    
    func removeItem(_ colony: Colony) {
        if let index = colonies.index(of: colony) {
            colonies.remove(at: index)
        }
    }
    
    func moveItemAtIndex(_ fromIndex: Int, toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        let movedItem = colonies[fromIndex]
        colonies.remove(at: fromIndex)
        colonies.insert(movedItem, at: toIndex)
    }
    
    init() {
        
    }
    
}
