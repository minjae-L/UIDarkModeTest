//
//  UIModeUserDefaults.swift
//  AppDarkmode
//
//  Created by 이민재 on 5/5/24.
//

import Foundation

// MARK: DarkMode UserDefaults
// 옵션 3가지 dark: 다크모드, light: 라이트모드, custom: 사용자 지정모드
enum UIMode {
    case dark
    case light
    case custom
}

// UIModeUserDefaults 싱글톤
class UIModeUserDefaults {
    static let shared = UIModeUserDefaults()
    init() {}
    // 저장된 값으로 초기화
    // 한번도 값이 설정되지 않았다면 nil
    var stringValue = UserDefaults.standard.string(forKey: "mode")
    
    // 저장된 값을 UIMode 형식으로 저장
    // 한번도 값이 설정되지 않았다면 default를 통해 .custom으로 지정(사용자지정모드)
    var modeValue: UIMode {
        switch self.stringValue {
        case "custom":
            return .custom
        case "dark":
            return .dark
        case "light":
            return .light
        default:
                return .custom
        }
    }
    // 값 변경후 value 갱신
    func chageValue(_ mode: UIMode) {
        switch mode {
        case .dark:
            UserDefaults.standard.setValue("dark", forKey: "mode")
        case .light:
            UserDefaults.standard.setValue("light", forKey: "mode")
        case .custom:
            UserDefaults.standard.setValue("custom", forKey: "mode")
        }
        stringValue = UserDefaults.standard.string(forKey: "mode")
    }
}
