import Foundation

public protocol Named {
    var name: String { get }
}

public typealias NamedObject = Identifiable & Named & ObservableObject
public typealias NamedValue = Identifiable & Named & Hashable
