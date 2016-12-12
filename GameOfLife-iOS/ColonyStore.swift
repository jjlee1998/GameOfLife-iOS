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
    
    func createColony(colony: Colony) {
        let newColony = colony
        
        colonies.append(newColony)
    }
    
    func removeColony(_ colony: Colony) {
        if let index = colonies.index(of: colony) {
            colonies.remove(at: index)
        }
    }
    
    func moveColonyAtIndex(_ fromIndex: Int, toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        let movedColony = colonies[fromIndex]
        colonies.remove(at: fromIndex)
        colonies.insert(movedColony, at: toIndex)
    }
    
    init() {
        
    }
    
}
