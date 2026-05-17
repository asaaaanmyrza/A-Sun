struct User {
    var username: String
    var password: String
    
    var folders: [Folder] = [Folder(isGeneral: true, name: "General")]
}

extension User {
    var generalFolderIndex: Int? {
            folders.firstIndex { $0.isGeneral }
        }
}
