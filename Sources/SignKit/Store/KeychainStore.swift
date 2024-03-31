import Foundation

public struct KeychainStore {
    
    public static func create(_ value: String, for key: String) throws {
        let encodedData = value.data(using: String.Encoding.utf8)!
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecValueData: encodedData
        ]
        let status = SecItemAdd(query as CFDictionary, nil)
        if status == errSecDuplicateItem {
            throw KeychainError.keyDuplicated
        }
    }
    
    public static func set(_ value: String, for key: String) {
        do {
            try create(value, for: key)
        } catch {
            update(value, for: key)
        }
    }
    
    public static func read(key: String) throws -> String {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecReturnAttributes: true,
            kSecReturnData: true
        ]
        var item: CFTypeRef?
        if SecItemCopyMatching(query as CFDictionary, &item) == errSecSuccess,
           let unwrappedItem = item,
           let data = unwrappedItem[kSecValueData] as? Data,
           let decodedData = String(data: data, encoding: .utf8) {
            return decodedData
        } else {
            throw KeychainError.keyDoesNotExist
        }
    }
    
    public static func update(_ value: String, for key: String) {
        let encodedData = value.data(using: String.Encoding.utf8)!
        let previousQuery: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key
        ]
        let updateQuery: [CFString: Any] = [
            kSecValueData: encodedData
        ]
        _ = SecItemUpdate(
            previousQuery as CFDictionary,
            updateQuery as CFDictionary
        )
    }
    
    public static func delete(key: String) {
        let deleteQuery: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key
        ]
        _ = SecItemDelete(deleteQuery as CFDictionary)
    }
}
