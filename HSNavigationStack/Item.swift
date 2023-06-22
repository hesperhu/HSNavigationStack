//
//  Item.swift
//  HSNavigationStack
//
//  Created by hsw on 2023-06-22.
//

import Foundation

protocol Item: Identifiable, Hashable {
    var id: UUID { get set }
    var name: String { get set }
    var detail: String { get set }
}
