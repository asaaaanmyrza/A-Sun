import Combine

final class FolderViewModel: ObservableObject {
    @Published var folder: Folder
    
    init(folder: Folder) {
        self.folder = folder
    }
}
