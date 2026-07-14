import Foundation
import Testing
@testable import Presentable

struct NamedListTests {

    @Test
    func storesValues() {
        let list = NamedList(
            id: "favorites",
            name: "Favorites",
            items: [1, 2, 3]
        )

        #expect(list.id == "favorites")
        #expect(list.name == "Favorites")
        #expect(list.items == [1, 2, 3])
    }

    @Test
    func countAndIsEmpty() {
        let empty = NamedList(
            id: "1",
            name: "Empty",
            items: [Int]()
        )

        #expect(empty.isEmpty)
        #expect(empty.count == 0)

        let filled = NamedList(
            id: "2",
            name: "Filled",
            items: [1, 2]
        )

        #expect(!filled.isEmpty)
        #expect(filled.count == 2)
    }

    @Test
    func firstAndLast() {
        let list = NamedList(
            id: "1",
            name: "Numbers",
            items: [10, 20, 30]
        )

        #expect(list.first == 10)
        #expect(list.last == 30)
    }
    
    @Test
    func collectionConformance() {
        let list = NamedList(
            id: "1",
            name: "Numbers",
            items: [1, 2, 3]
        )

        #expect(Array(list) == [1, 2, 3])
        #expect(list[1] == 2)
    }
    
    private struct Camera: Identifiable, Codable, Sendable, Equatable {
        let id: Int
        let name: String
    }

    @Test
    func lookupByID() {
        let list = NamedList(
            id: "cams",
            name: "Cameras",
            items: [
                Camera(id: 1, name: "A"),
                Camera(id: 2, name: "B")
            ]
        )

        #expect(list[id: 2]?.name == "B")
        #expect(list[id: 100] == nil)
    }
    
    @Test
    func codableRoundTrip() throws {
        let original = NamedList(
            id: "numbers",
            name: "Numbers",
            items: [1, 2, 3]
        )

        let data = try JSONEncoder().encode(original)
        let decoded = try JSONDecoder().decode(NamedList<Int>.self, from: data)

        #expect(decoded == original)
    }
}
