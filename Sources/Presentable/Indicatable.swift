import SwiftUI

//For things with indicator
//example: status (online/offline, rec/rec_off, signal_lost/signal_restored/never_connected)
public protocol Indicatable {
    var color: Color { get }
    var icon: Image { get }
}
