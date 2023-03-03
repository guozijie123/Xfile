//
//  LanguageManager.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2022/8/31.
//

import UIKit

class LanguageManager: NSObject {
    static let shareInstance = LanguageManager()
    private static let userDefaults_LanguageKey = "current_language"
    private static let defaultLanguage = "zh-Hans"
    
    var languageList = [("English","en"),("中文(简体)","zh-Hans"),("跟随系统","auto")]
    
    override init() {
        currentLanguage = LanguageManager.storedCurrentLanguage ?? LanguageManager.defaultLanguage
    }
    
    /// 可用的语言
    public static var availableLanguages: [String] {
        Bundle.main.localizations.sorted()
    }
    
    /// 当前语言
    public var currentLanguage: String = "" {
        didSet {
            storeCurrentLanguage()
        }
    }
}

extension LanguageManager {
    /// 保存当前语言
    private func storeCurrentLanguage() {
        UserDefaults.standard.setValue(currentLanguage, forKey: LanguageManager.userDefaults_LanguageKey)
    }
    
    /// 获取保存的语言
    private static var storedCurrentLanguage: String? {
        UserDefaults.standard.value(forKey: LanguageManager.userDefaults_LanguageKey) as? String
    }
    
    /// 推荐语言（手机系统语言）
    private static var preferredLanguage: String? {
        Bundle.main.preferredLocalizations.first {availableLanguages.contains($0)}
    }
    
    public var currentLocale: Locale {
        Locale(identifier: currentLanguage)
    }
}

extension LanguageManager {
    
    public func localize(string: String, bundle: Bundle?) -> String {
        if let languageBundleUrl = bundle?.url(forResource: currentLanguage, withExtension: "lproj"), let languageBundle = Bundle(url: languageBundleUrl) {
            return languageBundle.localizedString(forKey: string, value: nil, table: nil)
        }
        return string
    }
    
    public func localize(string: String, bundle: Bundle?, arguments: [CVarArg]) -> String {
        String(format: localize(string: string, bundle: bundle), locale: currentLocale, arguments: arguments)
    }
    
}





extension String {
    var localized: String {
        return LanguageManager.shareInstance.localize(string: self, bundle: Bundle.main)
    }
        
}

