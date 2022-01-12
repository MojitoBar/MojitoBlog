---
date: 2022-01-12 10:48
description: UIKit에서 UI를 깔끔하게 선언하기 위한 노력
tags: iOS, Swift
---

## StoryBoard?

### UIKit으로 iOS 프로젝트를 개발 시 UI를 개발하는 방법으론 <b class="bold">StoryBoard</b> 또는 <b class="bold">Code로 개발</b>, 총 2가지 방법이 있다. (이 2가지를 섞어 쓰는 경우도 많다.)
### UIKit으로 많은 프로젝트를 해보진 않았지만 StoryBoard로 예제를 만들어본 결과 단점이 매우 명확하게 느껴졌다.
### <b class="heavy">먼저, 가독성이 떨어진다는 점이다.</b>
### 뷰가 여러개가 되거나, 한 화면에 많은 오브젝트들이 배치될 시 그들을 한눈에 파악하기가 힘들었다.
### <b class="heavy">두 번째로는 재사용성이 떨어진다는 점이다.</b>
### 뒤로가기 버튼이나 확인 버튼 등 중복해서 사용될 여지가 있는 오브젝트들을 StoryBoard로 만들게 되면 재사용하기가 매우 어렵다.
### <b class="heavy">마지막으로 협업의 어려움이다.</b>
### StoryBoard는 XML 포멧이기 때문에 깃으로 협업 시 수정사항을 파악하기 어려울 뿐더러 Merge Conflict를 처리가 매우 어렵다.

<br/>
<hr/>
<br/>

### 위와 같은 이유로 StoryBoard말고 Code로 UI를 짜는 방법을 선호하는 편인데, 마우스 드래그만 하면 생성되는 StoryBoard와는 달리 Code로 짜게 되면 init, constraint, 추가 속성 등을 직접 선언해줘야한다.
### 이 때 잘못하면 코드가 매우 지저분해 보이거나, UI 생성 흐름이 뒤죽박죽이게 돼 앞서 해결하려 했던 가독성과 재사용성을 해결하지 못할 수도 있다.
### 따라서 이번 포스팅을 통해 현재 내가 알고 있는 가장 깔끔한 UI 생성 방법에 대해 정리하고, 앞으로 더 좋은 방법을 찾게 된다면 주기적으로 업데이트하려 한다.

## 2022/01/12
### 현재 접근 방법은 앱에서 사용되는 UI 객체를 CustomUIClass로 전부 빼는 방법이다.

```swift
import UIKit

// 버튼 타입
public enum RoundedButtonType {
    case big
    case middle
    case small
}

// 라운드 버튼
class RoundedButton: UIButton {
    init() {
        super.init(frame: CGRect.zero)
        setupView()
    }

    convenience init(type: RoundedButtonType) {
        self.init()
        
        switch type {
        case .big:
            self.frame = CGRect(x: 100, y: 200, width: 50, height: 50)
        case .middle:
            self.frame = CGRect(x: 100, y: 300, width: 30, height: 30)
        case .small:
            self.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func setupView() {
        // 뷰에 관한 세팅들
        self.backgroundColor = .red
        self.layer.cornerRadius = 16
        setupConstraints()
    }
    
    func setupConstraints() {
        // 제약사항 관한 세팅들
        
    }
}
```
### 위 코드는 라운드 버튼을 <b class="heavy">CustomUIClass</b>로 뺀 간단한 예제이다.
### 버튼의 타입을 enum으로 만들어 여러 크기에 대응하는 <b class="heavy">RoundedButton</b>이 되었다.
### <b class="heavy">setupView()</b> 와 <b class="heavy">setupConstraints()</b> 를 통해 Button의 세부 속성을 정의할 수 있다.

```swift
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI() {
        let a = RoundedButton(type: .big)
        let b = RoundedButton(type: .middle)
        
        self.view.addSubview(a)
        self.view.addSubview(b)
    }
}
```
### 만들어진 CustomUIClass는 위 코드와 같이 사용하고 있다.

## 생각해볼 점
- 대부분의 값을 커스텀하게 사용할 수 없을까? 예를 들어 현재 코드를 기준으로 RoundedButton(type: .middle) 를 선언하면 가로세로 30의 빨간 Rounded 사각형이 생긴다. 이때 색깔이나 가로세로도 커스텀하게 사용할 수 없을까?
- 메인에서 사용되는 코드를 보면 SuperView에 추가해주는 코드가 오브젝트마다 따라붙어야한다는 것을 알 수 있다. 이 부분을 더 깔끔하게 해결할 수 없을까?

<br/>
<br/>
## 참고자료
<ul>
<li>
    <a href="https://ios-development.tistory.com/43?category=892896">김종권의 iOS 앱 개발 알아가기</a>
</li>
</ul>
