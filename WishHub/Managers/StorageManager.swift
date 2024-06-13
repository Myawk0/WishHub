//
//  StorageManager.swift
//  WishHub
//
//  Created by Мявкo on 12.06.24.
//

import Foundation
import KeychainAccess

extension StorageManager {

    enum Key: String {
        case email
        case password
        case code
        case token
    }

    var email: String {
        get { get(for: Key.email) ?? "" }
        set { set(newValue, for: Key.email) }
    }

    var password: String {
        get { get(for: Key.password) ?? "" }
        set { set(newValue, for: Key.password) }
    }

    var code: String {
        get { return get(for: Key.code) ?? "" }
        set { set(newValue, for: Key.code) }
    }

    var token: String {
        get { return get(for: Key.token) ?? "" }
        set { set(newValue, for: Key.token) }
    }
}

extension StorageManager {

    enum TemporaryKeys: String, CaseIterable {
        case isDarkMode
    }

    func reset() {
        TemporaryKeys.allCases.forEach { defaults.removeObject(forKey: $0.rawValue) }
    }

    func resetKey(_ key: TemporaryKeys) {
        defaults.removeObject(forKey: key.rawValue)
    }

    var isDarkMode: Bool {
        get { return defaults.bool(forKey: TemporaryKeys.isDarkMode.rawValue) }
        set { defaults.set(newValue, forKey: TemporaryKeys.isDarkMode.rawValue) }
    }
}

final class StorageManager {

    private static var uniqueInstance: StorageManager?
    private var defaults = UserDefaults.standard

    private init() {}

    static var shared: StorageManager {
        if uniqueInstance == nil {
            uniqueInstance = StorageManager()
        }
        return uniqueInstance!
    }

    // MARK: - Keychain

    private var keychain: Keychain {
        guard let service = Bundle.main.infoDictionary?[String(kCFBundleIdentifierKey)] as? String else {
            fatalError()
        }

        return Keychain(service: service)
            .accessibility(.whenUnlockedThisDeviceOnly)
    }

    private func set<T: Encodable>(_ value: T?, for key: Key) {
        guard let value = value else {
            delete(for: key)
            return
        }
        do {
            let data = try JSONEncoder().encode(value)
            try keychain.set(data, key: key.rawValue)
        } catch let error {
            print(error.localizedDescription)
        }
    }

    private func get<T: Decodable>(for key: Key) -> T? {
        do {
            guard let data = try keychain.getData(key.rawValue) else { return nil }
            return try JSONDecoder().decode(T.self, from: data)
        } catch let error {
            print(error)
            return nil
        }
    }

    private func delete(for key: Key) {
        do {
            try keychain.remove(key.rawValue)
        } catch let error {
            print(error.localizedDescription)
        }
    }

}
