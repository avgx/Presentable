import Foundation

public protocol Actionable {
    func execute() async throws
}
