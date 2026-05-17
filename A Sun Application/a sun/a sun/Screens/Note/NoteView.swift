import SwiftUI

struct NoteView: View {
    
    @StateObject var viewModel: NoteViewModel
    
    var body: some View {
        switch viewModel.note.type {
        case .simpleNote (let data):
            SimpleNoteView(viewModel: viewModel, textInput: data.content)
        case .financeTracker:
            FinanceTrackerNoteView(viewModel: viewModel)
        case .habitTracker:
            HabitTrackerNoteView(viewModel: viewModel)
        }
    }
}
