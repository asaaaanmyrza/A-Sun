import SwiftUI

struct SimpleNoteView: View {
    @StateObject var viewModel: NoteViewModel
    @State var textInput: String
    
    var body: some View {
        TextEditor(text: $textInput)
            .textFieldStyle(.roundedBorder)
            .truncationMode(.tail)
            .padding()
        Text(viewModel.note.createdAt.formatted(date: .numeric, time: .shortened))
        Button("Save") {
            viewModel.editSimpleNote(with: textInput)
        }
    }
}

#Preview {
    NoteView(viewModel: NoteViewModel(note: Note.makeSimple(title: "Spendings on March", content: "Hello there!")))
}
