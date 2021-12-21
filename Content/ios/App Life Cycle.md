---
date: 2021-12-21 09:37
description: App Life Cycle (App Delegate Methods)
tags: iOS, Swift
---

## App Life Cycle

### 상태 변화에 따라 다른 동작을 처리하기 위한 <b class="heavy">App Delegate Method</b>들이 있다.
### <a class="juso" href="https://juseok.xyz/ios/foreground%20&%20background/">Foreground & Background</a> 포스트에서 앱의 상태에 대해 공부해본 적이 있었다. 이번에는 각각의 앱의 상태에 따른 동작을 처리하기 위한 함수들에 대해 알아보자.

## 앱이 처음 실행될 때
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
```
### 앱이 처음 실행될 때 호출되는 함수이다. 

## active에서 inactive로 바뀔 때
```swift
func applicationWillResignActive(_ application: UIApplication)
```

### 앱이 실행중일 때 <b class="heavy">전화</b>가 오거나, <b class="heavy">잠금화면</b>, <b class="heavy">멀티테스킹 스크린</b>으로 바뀌게 되면 해당 함수를 호출한다.

## Background 상태일 때
```swift
func applicationDidEnterBackground(_ application: UIApplication)
``` 
### 앱이 <b class="heavy">Background</b> 상태가 되면 호출된다. 보통 <b class="heavy">공유자원 해제</b>, <b class="heavy">유저 데이터 저장</b> 등의 로직이 여기에 구현된다.

## Background에서 Foreground로 이동될 때
```swift
func applicationWillEnterForground(_ appication: UIApplication)
```
### 앱이 <b class="heavy">Background</b>에서 <b class="heavy">Foreground</b>로 이동될 때 실행된다. API를 통해 앱의 상태를 갱신할 때 사용된다. (버전 체크 등)

## 앱이 active 상태가 되었을 때
```swift
func applicationDidBecomeActive(_ application: UIApplication)
```

## 앱이 종료될 때
```swift
func appicationWillTerminate(_ application: UIApplication)
```

<br/>
<br/>
<br/>
## 참고자료
<ul>
<li>
    <a href="https://velog.io/@isouvezz/ios-%EB%A9%B4%EC%A0%91-%EC%98%88%EC%83%81-%EC%A7%88%EB%AC%B8-%EC%A0%95%EB%A6%AC">isouvezz.log</a>
</li>
<li>
    <a href="https://blog.naver.com/PostView.naver?blogId=soojin_2604&logNo=222423840595&parentCategoryNo=&categoryNo=&viewDate=&isShowPopularPosts=false&from=postView">티모의 개발노트</a>
</li>
</ul>
