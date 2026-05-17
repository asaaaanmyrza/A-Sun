import Combine

final class NoteViewModel: ObservableObject {
    @Published var note: Note
    
    init(note: Note) {
        self.note = note
    }
}

extension NoteViewModel { //Simple Note
    
    func editSimpleNote(with content: String) {
        guard case .simpleNote(var simpleNote) = note.type else { return }
        simpleNote.content = content
        note.type = .simpleNote(simpleNote)
    }
    
}

extension NoteViewModel { //Finance Tracker
    
    func addFinanceOperation(_ operation: Operation) {
        guard case .financeTracker(var financeTracker) = note.type else { return }
        financeTracker.operations.append(operation)
        note.type = .financeTracker(financeTracker)
    }
    
    var operations: [Operation] {
        guard case .financeTracker(let financeTracker) = note.type else { return [] }
        return financeTracker.operations
    }
    
}

extension NoteViewModel { //Habit Tracker
    
    func addHabit(_ habit: String) {
        guard case .habitTracker(var habitTracker) = note.type else { return }
        habitTracker.habits.append(habit)
        note.type = .habitTracker(habitTracker)
    }
    
    var habits: [String] {
        guard case .habitTracker(let habitTracker) = note.type else { return [] }
        return habitTracker.habits
    }
    
}
