import Foundation

public struct NamedList<Item: Sendable>: Identifiable, Sendable {
    public let id: String
    public let name: String
    public let items: [Item]
    
    public init(id: String, name: String, items: [Item]) {
        self.id = id
        self.name = name
        self.items = items
    }
}

extension NamedList {
    public var isEmpty: Bool { items.isEmpty }
    public var count: Int { items.count }
    public var first: Item? { items.first }
    public var last: Item? { items.last }
}

extension NamedList where Item: Identifiable {
    public subscript(id id: Item.ID) -> Item? {
        items.first { $0.id == id }
    }
}

extension NamedList: RandomAccessCollection {
    public typealias Index = Array<Item>.Index

    public var startIndex: Index { items.startIndex }
    public var endIndex: Index { items.endIndex }

    public subscript(position: Index) -> Item {
        items[position]
    }

    public func index(after i: Index) -> Index {
        items.index(after: i)
    }

    public func index(before i: Index) -> Index {
        items.index(before: i)
    }
}

extension NamedList: Equatable where Item: Equatable {}
extension NamedList: Hashable where Item: Hashable {}
extension NamedList: Codable where Item: Codable {}
