import Foundation

struct Folder: Identifiable {
    var id: UUID = UUID()
    var isGeneral: Bool = false
    var name: String
    var notes: [Note] = []
}
