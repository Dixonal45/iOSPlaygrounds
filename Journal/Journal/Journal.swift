//
//  Journal.swift
//  Journal
//
//  Created by Allison on 3/6/20.
//  Copyright © 2020 Allison. All rights reserved.
//

import Foundation
struct Journal {
    var entries = [JournalEntry]()
    var count: Int {
        return entries.count
    }
    mutating func add(entry: JournalEntry){
        entries.append(entry)
    }
    func entry(index: Int) -> JournalEntry? {
        if index >= 0 && index < entries.count {
            return entries[index]
        }else{
            return nil
        }
    }
}
