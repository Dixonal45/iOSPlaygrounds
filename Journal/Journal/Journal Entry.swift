//
//  Journal Entry.swift
//  Journal
//
//  Created by Allison on 3/6/20.
//  Copyright © 2020 Allison. All rights reserved.
//

import Foundation
struct JournalEntry: CustomStringConvertible {
    let date: Date
    let contents: String
    let dateFormatter = DateFormatter()
    var description: String {
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .short
    return dateFormatter.string(from: date)
    }
}
