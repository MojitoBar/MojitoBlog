import Foundation

// 설정을 세팅하기 위한 변수 선언
var darkModeState = false
// UserDefaults에 darkModeState라는 키로 저장
UserDefaults.standard.set(darkModeState, forKey: "darkModeState")
// .bool로 자료형을 맞춰 가져오기
print(UserDefaults.standard.bool(forKey: "darkModeState"))
