import Foundation

public struct Sign {
    
    public static func login(
        id: String,
        password: String,
        accessToken: String,
        refreshToken: String
    ) {
        UserDefaultsStore.set(id, for: "id")
        KeychainStore.set(password, for: id)
        UserDefaultsStore.set(accessToken, for: "accessToken")
        KeychainStore.set(refreshToken, for: "refreshToken")
    }
    
    public static func reissue(_ accessToken: String) {
        UserDefaultsStore.set(accessToken, for: "accessToken")
    }
    
    public static var id: String? {
        try? UserDefaultsStore.read(key: "id")
    }
    
    public static var password: String? {
        guard let id else { return nil }
        return try? KeychainStore.read(key: id)
    }
    
    public static var accessToken: String? {
        try? UserDefaultsStore.read(key: "accessToken")
    }
    
    public static var refreshToken: String? {
        try? KeychainStore.read(key: "refreshToken")
    }
}
