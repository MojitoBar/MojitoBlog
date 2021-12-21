---
date: 2021-12-17 22:22
description: @main이 뭘까?
tags: iOS, Swift
---

## Swift에서 @main이 뭘까?

### 모든 프로그램에는 항상 앱이 시작되어야 하는 진입점이 있으며 Swift도 예외는 아니다. 마치 <b class="heavy">c언어의 main함수</b> 같이 말이다. 예전에는 아래와 같이 <b class="heavy">main.m</b> 파일이 그 진입점 역할이었다.

```swift
// main.m
int main(int argc, char *argv[])
{
    @autoreleasepool {
    return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
```
<br/>

### 위 코드는 더 이상 사용하지 않는 오래된 코드이며, 앱의 <b class="heavy">진입점</b>을 알려주는 <b class="heavy">objective-c</b> 코드이다.

### 아래 코드와 같이 <b class="heavy">Swift</b>에서는 여전히 <b class="heavy">main.swift</b>를 사용할 수 있으며 앱의 진입점이 된다.
```swift
// main.swift
autoreleasepool {
  UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(AppDelegate.self))
}
```

### 오늘날 우리는 <b class="bold">@UIApplicationMain</b>와 <b class="bold">@main</b> 2가지 방법으로 진입점을 나타낼 수 있다.

## @UIApplicationMain
### 먼저 <b class="heavy">@UIApplicationMain</b> 어노테이션이다. 이 어노테이션은 <b class="heavy">UIApplicationMain</b> 함수를 호출하고 해당 클래스의 이름을 델리게이트 클래스의 이름으로 전달한다.

### UIApplicationMain의 역할은 4가지 정도가 있다.
- 먼저 앱의 본체에 해당하는 객체인 <b class="heavy">UIApplication객체</b>를 생성한다. 이 객체는 앱의 <b class="heavy">Life Cycle</b>을 관리한다.
- <b class="heavy">@UIApplicationMain</b>이 표시된 클래스에서 델리게이트를 인스턴스화 하고 이를 앱의 객체에 할당한다.
- 앱의 Run Loop을 포함한 기본 이벤트처리 루프를 설정하고 이벤트 처리를 시작한다.
- 앱의 info.plist에 불러올 main nib파일이 제대로 명시되어있으면, 해당 nib파일을 불러온다.

### 하지만 Xcode 12부터 <b class="bold">@UIApplicationMain</b> 대신 <b class="bold">@main</b> 속성이 쓰이게 된다.

## @main
### <b class="heavy">@UIApplicationMain</b>과 같이 진입점과 관련된 어노테이션이지만 범용성이 더 넓다. 단일 파일 코드이던 프레임워크 프로젝트이던 커스텀 라이브러리던 상관없이 동일하게 진입점을 설정해줄 수 있기 때문이다. (다만, 커스텀 진입점을 설정하면 위에서 언급한 @UIApplicationMain의 4가지 역할은 하지 않는 것 같다.)

### <b class="heavy">@main</b>을 따로 설정해주지 않는다면 기본값으로 AppDelegate클래스가 호출되지만 만약 직접 지정해주고 싶다면 해당 함수는 아래 예시 코드와 같이 static이어야 한다.

```swift
@main
class Main{
    static func main(){
        print("Hello")
    }
}
```
<br/>
<br/>
<br/>
## 참고자료
<ul>
<li>
    <a href="https://velog.io/@iris14_seo/iOS-%EC%95%B1%EC%9D%98-Life-Cycle-entry-point">iris14_seo velog</a>
</li>
<li>
    <a href="https://medium.com/@abedalkareemomreyh/what-is-main-in-swift-bc79fbee741c">Omreyh's medium</a>
</li>
</ul>
