import Foundation

enum NoteType {
    case simpleNote(SimpleNote)
    case financeTracker(FinanceTracker)
}

struct Note {
    var id: UUID
    var createdAt: Date
    let type: NoteType
    
    init(type: NoteType) {
        self.id = UUID()
        self.createdAt = Date()
        self.type = type
    }
}

struct SimpleNote {
    var content: String
}

struct FinanceTracker {
    var startDate: Date
    var endDate: Date
    var currency: String
}

extension Note {

    static func makeSimple(content: String) -> Note {
        let model = SimpleNote(content: content)
        return Note(type: .simpleNote(model))
    }

    static func makeFinance(
        startDate: Date,
        endDate: Date,
        currency: String
    ) -> Note {
        let model = FinanceTracker(
            startDate: startDate,
            endDate: endDate,
            currency: currency
        )
        return Note(type: .financeTracker(model))
    }
}

let note1 = Note.makeSimple(content: "Hello, mate!")

let note2 = Note.makeFinance(
            startDate: Date(),
            endDate: Date(),
            currency: "$"
)


