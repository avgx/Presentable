import Foundation

public protocol TimeIntervaled {
    var startTime: Date { get }
    var endTime: Date? { get }
    var duration: TimeInterval { get }
}
